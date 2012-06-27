package vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import models.Event;

public class DriverReportVO {
	public long id;
	public String serviceNo;
	public String eventTime;
	public int speed;
	public String type;
	public String latitude;
	public String longitude;
	public String road;
	
	public DriverReportVO init(Event event) throws ParseException{
		this.id = event.id;
		this.serviceNo = event.serviceNumber;
		this.eventTime = timeConvertor(event.eventRecord.time.toString());
		this.speed = event.eventRecord.speed;
		this.type = event.eventRecord.type.techName;
		this.latitude = event.eventRecord.lat;
		this.longitude = event.eventRecord.lng;
		this.road = event.road;
		return this;
	}
	
	public static String timeConvertor(String time) throws ParseException{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dateString = df.parse(time);
		String dateTime = df.format(dateString);
		return dateTime;
	}
}
