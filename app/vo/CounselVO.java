package vo;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import utils.CommonUtil;

import models.Counselling;

public class CounselVO {
	public long id;
	public String userName;
	public String driverName;
	public String startTime;
	public String endTime;
	public String remark;
	
	public CounselVO init(Counselling c) throws ParseException{
		this.id = c.id;
		this.userName = c.user.name;
		this.driverName = c.driver.name;
		this.startTime = c.startTime.toString();
		this.endTime = c.endTime.toString();
		this.remark = c.remark;
		return this;
	}
	
	public static String timeConvertor(Date date) throws ParseException{
		DateFormat df = new SimpleDateFormat("EEE, d MMM yyyy HH:mm:ss");
		String dateString = df.format(date);
		return dateString;
	}
}
