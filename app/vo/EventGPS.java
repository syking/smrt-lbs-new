package vo;

import java.util.ArrayList;
import java.util.List;

import models.Event;

public class EventGPS {

	public String id;
	public String name;
	public int currentSpeed;
    public Double lng;//lng
    public Double lat;//lat
    public String activeStatus = "on";
	public String techName;
	
	public EventGPS init(Event event){
		this.id = String.valueOf(event.id);
		this.currentSpeed = event.eventRecord.speed;
		this.name = event.eventRecord.type.name;
		this.lng = Double.parseDouble(event.eventRecord.lng);
		this.lat = Double.parseDouble(event.eventRecord.lat);
		this.techName = event.eventRecord.type.techName;
		
		return this;
	}
	
	@Override
	public String toString() {
		return "EventGPS [id=" + id + ", name=" + name + ", currentSpeed="
				+ currentSpeed + ", lng=" + lng + ", lat=" + lat
				+ ", activeStatus=" + activeStatus + ", techName=" + techName
				+ "]";
	}
	
}
