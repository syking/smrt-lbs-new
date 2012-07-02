package controllers;

import models.*;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import utils.Splitter;
import vo.ComboVO;
import vo.EventGPS;
import vo.EventVO;

import java.util.*;

import static models.User.Constant.THEME;

@With(Interceptor.class)
public class Events extends Controller {

	public static void index() {
		render(renderArgs.get(THEME) + "/Events/index.html");
	}

	public static void viewOnMap() {
		render(renderArgs.get(THEME) + "/Application/view_on_map.html");
	}

	public static void viewEventOnMap(String eventId) {
		render(renderArgs.get(THEME) + "/Events/event_view_on_map.html");
	}

	/**
	 * 给定车辆编号，获取该车辆的所有事件信息
	 * 
	 * @param vehicleNo
	 */
	public static void list(String vehicleNo) {
		Vehicle v = Vehicle.find("number = ?", vehicleNo).first();
		if (v == null)
			viewOnMap();

		List<EventVO> eventVOList = Event.assemEventVO(v);
		if (eventVOList == null)
			viewOnMap();

		String eventData = CommonUtil.getGson().toJson(eventVOList);

		List<Map> columnMap = CommonUtil.assemColumns(EventVO.class, "id", "vehicle", "driver", "department", "fleet");

		Map id = new HashMap(3);
		id.put("field", "id");
		id.put("title", "id");
		id.put("width", "1px");

		columnMap.add(id);

		String eventColumns = CommonUtil.getGson().toJson(columnMap);

		List<EventType> types = EventType.findAll();
		String eventTypes = CommonUtil.getGson().toJson(types);

		render(renderArgs.get(THEME) + "/Application/view_on_map.html", eventData, eventColumns, eventTypes);
	}

	/* 传进来车辆车牌号，返回该车辆的所有事件 GPS 信息 */
	public static void gps(String vehicleNo, Long eventId) {
		if (eventId == null || eventId <= 0) {
			renderJSON(Event.findGPS(vehicleNo));
			return ;
		}
		
		Event event = Event.findById(eventId);
		List<EventGPS> eGps = new ArrayList<EventGPS>(1);
		EventGPS gps = new EventGPS();
		gps.id = String.valueOf(event.id);
		gps.currentSpeed = event.eventRecord.speed;
		gps.name = event.eventRecord.type.name;
		gps.xCoord = event.eventRecord.lng;
		gps.yCoord = event.eventRecord.lat;
		gps.techName = event.eventRecord.type.techName;
		eGps.add(gps);

		renderJSON(eGps);
	}

	public static void read() {
		List<EventRecord> ers = EventRecord.findAll();
		if (ers == null)
			renderJSON("[]");

		List<EventVO> result = new ArrayList<EventVO>(ers.size());
		
		for (EventRecord er : ers) {
			Event e = Event.find("event_record_id = ?", er.id).first();
			EventVO ev = new EventVO().init(e);

			result.add(ev);
		}

		renderJSON(result);
	}

	public static void listJson() {
		List<Event> events = Event.findAll();
		if (events == null)
			renderJSON("");

		List<EventVO> eventVOList = new ArrayList<EventVO>();

		for (Event e : events) 
			eventVOList.add(new EventVO().init(e));

		Map data = CommonUtil.assemGridData(eventVOList, "id");

		renderJSON(data);
	}

	public static void destroy(String models) {
		renderJSON(models);
	}

	public static void update(String models) {
		renderJSON(models);
	}

	public static void search(Long driver, String serviceNo, Long type, Date startTime, Date endTime) {

		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		if (driver != null && driver > 0) {
			sqlSB.append("e.driver.id = ?");
			params.add(driver);
		}

		if (serviceNo != null && serviceNo.trim().length() > 0) {
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

		if (sqlSB.length() > 0)
			sqlSB.insert(0, "left join e.eventRecord er where ");

		List<Event> events = Event.find("select e from Event e " + sqlSB.toString(), params.toArray()).fetch();
		if (events == null)
			return ;

		List<EventVO> eventVOList = new ArrayList<EventVO>();

		for (Event e : events) 
			eventVOList.add(new EventVO().init(e));

		Map data = CommonUtil.assemGridData(eventVOList, "id");

		renderJSON(data);
	}

	public static void grid(String id) {

		List<Driver> drList = Driver.findAll();
		List<ComboVO> drivers = new ArrayList<ComboVO>();
		if (drList != null)
			for (Driver dr : drList) 
				drivers.add(new ComboVO(dr.name, dr.id));

		List<String> liList = Schedule.find("select DISTINCT s.serviceNumber from Schedule s ").fetch();
		List<ComboVO> lines = new ArrayList<ComboVO>();
		if (liList != null)
			for (String s : liList) 
				lines.add(new ComboVO(s, s));
		
		List<EventType> typeList = EventType.findAll();
		List<ComboVO> types = new ArrayList<ComboVO>();
		if (typeList != null)
			for (EventType et : typeList) 
				types.add(new ComboVO(et.name, et.id));

		Map map = new HashMap();
		map.put("drivers", CommonUtil.getGson().toJson(drivers));
		map.put("lines", CommonUtil.getGson().toJson(lines));
		map.put("types", CommonUtil.getGson().toJson(types));
		Map _map = new HashMap();
		_map.put("tagId", id);
		map.put("grid", _map);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Events/grid.html")).render(map));
	}

}
