package vo;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import models.Counselling;

public class CounselVO {
	public long id;
	public String userName;
	public String driverName;
	public String date;
	public String startTime;
	public String endTime;
	public String remark;
	
	public CounselVO init(Counselling c) throws ParseException{
		this.id = c.id;
		this.userName = c.user.name;
		this.driverName = c.driver.name;
		this.date = c.date;
		this.startTime = c.startTime;
		this.endTime = c.endTime;
		this.remark = c.remark;
		return this;
	}
}
