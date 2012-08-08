package vo;

import java.util.ArrayList;
import java.util.List;

import models.Event;

public class EventGPS {

	public String id;
	public String name;
	public int currentSpeed;
    public String xCoord;//lng
    public String yCoord;//lat
    public String activeStatus = "on";
	public String techName;
	
	public EventGPS init(Event event){
		this.id = String.valueOf(event.id);
		this.currentSpeed = event.eventRecord.speed;
		this.name = event.eventRecord.type.name;
		this.xCoord = event.eventRecord.lng;
		this.yCoord = event.eventRecord.lat;
		this.techName = event.eventRecord.type.techName;
		
		return this;
	}
	
	@Override
	public String toString() {
		return "EventGPS [id=" + id + ", name=" + name + ", currentSpeed="
				+ currentSpeed + ", xCoord=" + xCoord + ", yCoord=" + yCoord
				+ ", activeStatus=" + activeStatus + ", techName=" + techName
				+ "]";
	}
	
}
