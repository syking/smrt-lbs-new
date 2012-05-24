package services;

import java.util.ArrayList;
import java.util.List;

import models.Event;
import models.EventRecord;
import models.GPSData;
import models.Schedule;
import models.Vehicle;
import vo.EventGPS;
import vo.EventVO;
import vo.VehicleGPS;

public class EventService {

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
}
