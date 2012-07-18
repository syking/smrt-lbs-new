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
	public String id;
	public String userName = "";
	public String driverName = "";
	public String startDate;
	public String startTime;
	public String endDate;
	public String endTime;
	public String remark;
	
	public CounselVO init(Counselling c) throws ParseException{
		this.id = String.valueOf(c.id);
		if (c.user != null)
			this.userName = c.user.name;
		if (c.driver != null)
			this.driverName = c.driver.name;
		
		this.startDate = c.startTime.toString().split(" ")[0];
		this.startTime = c.startTime.toString().split(" ")[1];
		this.endDate =  c.endTime.toString().split(" ")[0];
		this.endTime = c.endTime.toString().split(" ")[1];
		this.remark = c.remark;
		return this;
	}

	@Override
	public String toString() {
		return "CounselVO [id=" + id + ", userName=" + userName
				+ ", driverName=" + driverName + ", startDate=" + startDate
				+ ", startTime=" + startTime + ", endDate=" + endDate
				+ ", endTime=" + endTime + ", remark=" + remark + "]";
	}
	
	
}
