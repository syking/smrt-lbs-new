package vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import models.DriverReport;

public class DriverReportVO {
	public long id;
	public String serviceNo;
	public String eventTime;
	public int speed;
	public String type;
	public String latitude;
	public String longitude;
	public String road;
	
	public DriverReportVO init(DriverReport r) throws ParseException{
		this.id = r.id;
		this.serviceNo = r.event.serviceNumber;
		this.eventTime = timeConvertor(r.event.eventRecord.time.toString());
		this.speed = r.event.eventRecord.speed;
		this.type = r.event.eventRecord.type.techName;
		this.latitude = r.event.eventRecord.lat;
		this.longitude = r.event.eventRecord.lng;
		this.road = r.event.eventRecord.road;
		return this;
	}
	
	public static String timeConvertor(String time) throws ParseException{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dateString = df.parse(time);
		String dateTime = df.format(dateString);
		return dateTime;
	}
}
