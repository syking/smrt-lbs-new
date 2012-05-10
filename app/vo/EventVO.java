package vo;

import utils.CommonUtil;
import models.Event;
import models.EventRecord;

public class EventVO {

	public EventVO init(Event e){
		this.id = e.id;
		this.serviceNo = e.serviceNumber;
		this.time = CommonUtil.formatTime(e.eventRecord.time);
		this.type = e.eventRecord.type.name;
		this.lat = e.eventRecord.lat;
		this.lng = e.eventRecord.lng;
		this.driver = e.driver.name;
		
		return this;
	}
	
	public long id;
	public String driver;
	public String serviceNo;
	public String time;
	public String type;
	public String lat;
	public String lng;
	
}
