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
	public static List<VehicleGPS> findGPS(List<Vehicle> vehicles){
		
		if (vehicles == null)
			return null;
		
		List<VehicleGPS> result = new ArrayList<VehicleGPS>(vehicles.size());
		// 1. 遍历车辆，根据车辆的设备找出对应的最新的GPS信息
		for (Vehicle v : vehicles){
			GPSData gps = GPSData.find("device_key = ? order by id desc limit 1", v.device.key).first();
			if (gps == null)
				continue;
			
			VehicleGPS vGps = new VehicleGPS();
			vGps.id = v.id;
			vGps.busPlateNumber = v.number;
			
			// TODO
			/* 暂时直接根据车辆编号找到调度 表的最新的排班记录，其实这样是不行的，
			 * 因为排班是会把时间排到以后的，因此以后需要修改为按当前时间找符合排班时间的记录
			 * */
			Schedule schedule = Schedule.find("vehicle_number = ? order by id desc", v.number).first();
			if (schedule == null){
				vGps.driver = "不在排班计划内";
				vGps.serviceNumber = "不在排班计划内";
			}else{
				vGps.driver = schedule.driver.name;
				vGps.serviceNumber = schedule.serviceNumber;
			}
			
			vGps.currentSpeed = gps.speed;
			vGps.xCoord = gps.longitude;
			vGps.yCoord = gps.latitude;
			vGps.vehicleType = v.type;
			vGps.activeStatus = "on";
			vGps.direction = Vehicle.DIRECTIONS[gps.direction];
			
			result.add(vGps);
		}
	
		return result;
	}
}
