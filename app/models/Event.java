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
    		gps.xCoord = er.lng;
    		gps.yCoord = er.lat;
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
	
	/**
	 * 
	 * @param page <0 表示fetch all
	 * @param pageSize <0 表示fetch all
	 * @return
	 */
	public static Map search(int page, int pageSize, Long driver, String serviceNo, Long type, Date startTime, Date endTime){
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(driver, serviceNo, type, startTime, endTime, sqlSB, params);

		if (sqlSB.length() > 0 && !params.isEmpty())
			sqlSB.insert(0, "left join e.eventRecord er where ");

		List<Event> events = null;
		if (page > 0 && pageSize > 0) 
			events = Event.find("select e from Event e " + sqlSB.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		else 
			events = Event.find("select e from Event e " + sqlSB.toString() + " order by id desc", params.toArray()).fetch();
		
		List<EventVO> eventVOList = new ArrayList<EventVO>();
		if (events != null)
			for (Event e : events) 
				eventVOList.add(new EventVO().init(e));

		Map map = new HashMap();
		map.put("data", eventVOList);
		map.put("columns", CommonUtil.assemColumns(EventVO.class));
		
		long count = Event.count("select count(e.id) from Event e " + sqlSB.toString(), params.toArray());
		map.put("total", count);
		
		return map;
	}

	private static void parseCondition(Long driver, String serviceNo, Long type, Date startTime, Date endTime, StringBuilder sqlSB, List<Object> params) {
		if (driver != null && driver > 0) {
			sqlSB.append("e.driver.id = ?");
			params.add(driver);
		}

		if (!CommonUtil.isBlank(serviceNo)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");

			sqlSB.append("e.serviceNumber = ?");
			params.add(serviceNo);
		}

		if (type != null && type > 0) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");

			sqlSB.append("er.type.id = ?");
			params.add(type);
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
	
}
