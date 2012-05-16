package vo;

import utils.CommonUtil;
import models.Event;
import models.EventRecord;

public class EventVO {

	public EventVO init(Event e){
		this.id = String.valueOf(e.id);
		this.serviceNo = e.serviceNumber;
		this.time = CommonUtil.formatTime(e.eventRecord.time);
		this.type = e.eventRecord.type.name;
		this.lat = e.eventRecord.lat;
		this.lng = e.eventRecord.lng;
		this.driver = e.driver.name;
		this.vehicle = e.vehicle.number;
		this.department = e.department.name;
		this.fleet = e.fleet.name;
		return this;
	}
	
	public String id;
	public String driver;
	public String vehicle;
	public String department;
	public String fleet;
	public String serviceNo;
	public String time;
	public String type;
	public String lat;
	public String lng;
	
}
