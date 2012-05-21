package controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Event;
import models.EventRecord;
import models.EventType;
import play.mvc.*;
import services.EventService;
import utils.CommonUtil;
import vo.EventGPS;
import vo.EventVO;

import static models.User.Constant.*;

@With(Interceptor.class)
public class Maps extends Controller {
    
    private static Map viewOnMap(String idPrefix, List<Event> events, String... unlessColumn) {
    	Map map = new HashMap();
    	if (events == null)
    		return map;
    	
		List<EventVO> eventVOList = new ArrayList<EventVO>(events.size());
    	List<EventGPS> gpsList = new ArrayList<EventGPS>(events.size());
    	for (Event e : events){
    		EventVO eVO = new EventVO().init(e);
    		eVO.id = idPrefix + "_" + e.id;
    		eventVOList.add(eVO);
    		
    		EventGPS gps = new EventGPS();
    		gps.id = eVO.id;
    		gps.currentSpeed = e.eventRecord.speed;
    		gps.name = e.eventRecord.type.name;
    		gps.xCoord = e.eventRecord.lng;
    		gps.yCoord = e.eventRecord.lat;
    		gps.techName = e.eventRecord.type.techName;
    		
    		gpsList.add(gps);
    	}
    	
    	String eventGPS = CommonUtil.getGson().toJson(gpsList);
    	
    	List<Map> columnMap = CommonUtil.assemColumns(EventVO.class, unlessColumn);
    	Map _id = new HashMap(3);
		_id.put("field", "id");
		_id.put("title", "id");
		_id.put("width", "1px");
		columnMap.add(_id);
		
    	String eventColumns = CommonUtil.getGson().toJson(columnMap);
    	
    	String eventData = CommonUtil.getGson().toJson(eventVOList);
    	
    	String eventTypes = CommonUtil.getGson().toJson(EventType.findAll());
    	
    	map.put("eventColumns", eventColumns);
    	map.put("eventData", eventData);
    	map.put("eventTypes", eventTypes);
    	map.put("eventGPS", eventGPS);
    	map.put("idPrefix", idPrefix);
    	
    	return map;
	}
    
    /**
     * 获取某部门下所有司机的 Events List 和 Events GPS
     * @param departmentId
     */
    public static void departmentEvents(Long departmentId){
    	List<Event> events = Event.find("department_id = ?", departmentId).fetch();
    	
    	Map result = viewOnMap("dept_" + departmentId, events, "id", "vehicle", "fleet", "driver");
    	result.put("eventGPSUrl", "/Maps/departmentEventsGPS?departmentId=" + departmentId);
    	render(renderArgs.get(THEME) + "/Map/map.html", result);
    }
    
    public static void departmentEventsGPS(Long departmentId){
    	List<Event> events = Event.find("department_id = ?", departmentId).fetch();
    	Map result = viewOnMap("dept_" + departmentId, events, "id", "vehicle", "fleet", "driver");
    	
    	renderText(result.get("eventGPS"));
    }
    
    /**
     * 获取某车队下所有司机的 Events List 和 Events GPS
     * @param departmentId
     */
    public static void fleetEvents(Long fleetId){
    	List<Event> events = Event.find("fleet_id = ?", fleetId).fetch();
    	
    	Map result = viewOnMap("fleet_" + fleetId, events, "id", "vehicle", "department", "driver");
    	result.put("eventGPSUrl", "/Maps/fleetEventsGPS?fleetId=" + fleetId);
    	render(renderArgs.get(THEME) + "/Map/map.html", result);
    }
    
    public static void fleetEventsGPS(Long fleetId){
    	List<Event> events = Event.find("fleet_id = ?", fleetId).fetch();
    	Map result = viewOnMap("fleet_" + fleetId, events, "id", "vehicle", "department", "driver");
    	
    	renderText(result.get("eventGPS"));
    }

    
    /**
     * 获取某个司机的Events List 和 Events GPS
     * @param driverId
     */
    public static void driverEvents(Long driverId){
    	List<Event> events = Event.find("driver_id = ?", driverId).fetch();
    	if (events == null)
    		return ;
    	
    	Map result = viewOnMap("driver_" + driverId, events, "id", "vehicle", "fleet", "department");
    	result.put("eventGPSUrl", "/Maps/driverEventsGPS?driverId=" + driverId);
    	render(renderArgs.get(THEME) + "/Map/map.html", result);
    }
    
    public static void driverEventsGPS(Long driverId){
    	List<Event> events = Event.find("driver_id = ?", driverId).fetch();
    	Map result = viewOnMap("driver_" + driverId, events, "id", "vehicle", "fleet", "department");
    	
    	renderText(result.get("eventGPS"));
    }

}
