package models;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.EventGPS;
import vo.EventVO;

/**
 * 事件信息，包括超速、突然加速等等。
 * 事件发生时的GPS数据也会保存在 eventRecord 实体中。
 * GPSData只是一个定时任务的数据发送。不一定跟事件同步。
 * 也许事件已经发生了，但是GPSData还没到点发送数据。
 * 因此Event自己也会包含一些GPS位置信息，例如经纬度。
 * @author weiwei
 *
 */
@Entity
@Table(name="t_event")
public class Event extends Model{
	
	/* 设备发送的事件信息 */
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "event_record_id")
	public EventRecord eventRecord;
	
	/* 事件发生时是哪位司机开的车，需要根据设备找到相应的车辆，再找到当时相应的调度安排才能得到司机信息 */
	@ManyToOne(fetch = FetchType.EAGER)
	public Driver driver;
	
	/* 事件发生时是哪部车辆 */
	@ManyToOne(fetch = FetchType.EAGER)
	public Vehicle vehicle;

	/* 事件发生时是哪个部门 */
	@ManyToOne(fetch = FetchType.EAGER)
	public Department department;
	
	/* 事件发生时是哪个车队的 */
	@ManyToOne(fetch = FetchType.EAGER)
	public Fleet fleet;
	
	/* 时间发生时是哪条路线，需要根据设备找到相应的车辆，再找到当时相应的调度安排才能得到路线信息 */
	@Column(name = "service_number")
	public String serviceNumber = "";
	
	/* 是否在高速公路，需要分析事件记录数据中的经纬度 */
	@Column(name = "is_high_way")
	public boolean isHighWay;
	
	/* 是否在公交车站附近 ，需要分析事件记录数据中的经纬度*/
	@Column(name = "is_near_bus_stop")
	public boolean isNearBusStop;
	
	/* 道路 */
	public String road;//需要根据经纬度计算得出地址位置

	@Override
	public String toString() {
		return "Event [eventRecord=" + eventRecord + ", driver=" + driver
				+ ", serviceNumber=" + serviceNumber + ", isHighWay="
				+ isHighWay + ", isNearBusStop=" + isNearBusStop + ", road="
				+ road + ", id=" + id + "]";
	}
	
	public static List<EventVO> assemEventVO(Vehicle v){
		List<EventRecord> eventRecords = EventRecord.find("device_key = ?", v.device.key).fetch();
    	if (eventRecords == null)
    		return null;
    	
    	List<EventVO> eventVOList = new ArrayList<EventVO>(eventRecords.size());
    	
    	for (EventRecord er : eventRecords){
    		Event e = Event.find("event_record_id = ?", er.id).first();
    		EventVO eVO = new EventVO().init(e);
    		eventVOList.add(eVO);
    	}
    	
    	return eventVOList;
	}

	public static List<EventGPS> findGPS(String vehicleNo) {
		Vehicle v = Vehicle.find("number = ?", vehicleNo).first();
		
		if (v == null)
			return null;
		
		List<EventRecord> eventRecords = EventRecord.find("device_key = ?", v.device.key).fetch();
    	if (eventRecords == null)
    		return null;
    	
    	List<EventGPS> result = new ArrayList<EventGPS>(eventRecords.size());
    	for (EventRecord er : eventRecords){
    		EventGPS gps = new EventGPS();
    		Event e = Event.find("event_record_id = ?", er.id).first();
    		gps.id = vehicleNo + "_" + e.id;
    		gps.currentSpeed = er.speed;
    		gps.name = er.type.name;
    		gps.lng = Double.parseDouble(er.lng);
    		gps.lat = Double.parseDouble(er.lat);
    		gps.techName = er.type.techName;
    		
    		result.add(gps);
    	}
		
		return result;
	}
	
	public static long calculateDriverEventCount(final long driverId, final Date startTime, final Date endTime, final String eventTypeTechName){
		final List<Object> _params = new ArrayList<Object>(4);
		_params.add(eventTypeTechName);
		_params.add(driverId);
		
		final String _sql = " and er.time >= ? and er.time < ? " ;
		_params.add(startTime);
		_params.add(endTime);
		
		return Event.count("select count(e) from Event e left join e.eventRecord er where er.type.techName = ? and e.driver.id = ? " + _sql, _params.toArray());
	}
	
	public static Map search(int page, int pageSize, Date startTime, Date endTime, EventVO event){
		Map map = null;
		if (event == null)
			map = search(page, pageSize, null, null, null, null, null);
		else
			map = search(page, pageSize, event.driver, event.serviceNo, event.type, startTime, endTime);
		
		if (map != null)
			map.remove("columns");
		
		return map;
	}
	
	/**
	 * 
	 * @param page <0 表示fetch all
	 * @param pageSize <0 表示fetch all
	 * @return
	 */
	public static Map search(int page, int pageSize, String driverName, String serviceNo, String typeName, Date startTime, Date endTime){
		List<EventVO> eventVOList = new ArrayList<EventVO>();
		Map _map = searchEvent(page, pageSize, driverName, serviceNo, typeName, startTime, endTime);
		List<Event> events = (List<Event>) _map.get("data");
		if (events != null)
			for (Event e : events) 
				eventVOList.add(new EventVO().init(e));
		
		Map map = new HashMap();
		map.put("data", eventVOList);
		map.put("columns", CommonUtil.assemColumns(EventVO.class));
		map.put("total", _map.get("total"));
		
		return map;
	}
	
	public static Map searchEvent(int page, int pageSize, EventVO event, Date startTime, Date endTime){
		Map map = null;
		if (event == null)
			map = searchEvent(page, pageSize, null, null, null, null, null);
		else
			map = searchEvent(page, pageSize, event.driver, event.serviceNo, event.type, startTime, endTime);
		
		return map;
	}
	
	public static Map searchEvent(int page, int pageSize, String driverName, String serviceNo, String typeName, Date startTime, Date endTime){
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(driverName, serviceNo, typeName, startTime, endTime, sqlSB, params);

		if (sqlSB.length() > 0 && !params.isEmpty())
			sqlSB.insert(0, "left join e.eventRecord er where ");

		List<Event> events = null;
		if (page > 0 && pageSize > 0) 
			events = Event.find("select e from Event e " + sqlSB.toString() + " order by e.id desc", params.toArray()).fetch(page, pageSize);
		else 
			events = Event.find("select e from Event e " + sqlSB.toString() + " order by e.id desc", params.toArray()).fetch();
		
		Map map = new HashMap();
		map.put("data", events);
		long total = Event.count("select count(e.id) from Event e " + sqlSB.toString(), params.toArray());
		map.put("total", total);
		
		return map;
	}

	private static void parseCondition(String driverName, String serviceNo, String typeName, Date startTime, Date endTime, StringBuilder sqlSB, List<Object> params) {
		if (!CommonUtil.isBlank(driverName)) {
			sqlSB.append("e.driver.name like ?");
			params.add("%"+driverName.trim()+"%");
		}

		if (!CommonUtil.isBlank(serviceNo)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");

			sqlSB.append("e.serviceNumber like ?");
			params.add("%"+serviceNo.trim()+"%");
		}

		if (!CommonUtil.isBlank(typeName)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");

			sqlSB.append("er.type.name like ?");
			params.add("%"+typeName.trim()+"%");
		}

		if (startTime != null) {
			Date _endTime = new Date();
			if (endTime != null) 
				_endTime = endTime;

			if (sqlSB.length() > 0)
				sqlSB.append(" and ");

			sqlSB.append("er.time between ? and ?");
			params.add(startTime);
			params.add(_endTime);
		}
	}

	public static Event fetchById(Long id) {
		Event event = Event.findById(id);
		if (id == null)
			throw new RuntimeException("id required");
		
		if (event == null)
			throw new RuntimeException("Event not found");
		
		return event;
	}
	
}
