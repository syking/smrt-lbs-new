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
	public Long id;
	public String userName = "";
	public String driverName = "";
	public String startDate;
	public String startTime;
	public String endDate;
	public String endTime;
	public String remark;
	
	public CounselVO init(Counselling c){
		this.id = c.id;
		if (c.user != null)
			this.userName = c.user.name;
		if (c.driver != null)
			this.driverName = c.driver.name;
		
		this.startDate = CommonUtil.formatTime(c.startTime).split(" ")[0];
		this.startTime = CommonUtil.formatTime(c.startTime).split(" ")[1];
		this.endDate = CommonUtil.formatTime(c.endTime).split(" ")[0];
		this.endTime = CommonUtil.formatTime(c.endTime).split(" ")[1];
		this.remark = c.remark;
		return this;
	}
	
	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(userName))
			builder.append(CommonUtil.formatStr(msg, "UserName"));
		
		if (CommonUtil.isBlank(driverName))
			builder.append(CommonUtil.formatStr(msg, "DriverName"));
		
		if (CommonUtil.isBlank(startDate))
			builder.append(CommonUtil.formatStr(msg, "StartDate"));
		
		if (!CommonUtil.isValidDate(startDate))
			builder.append("StartDate yyyy-MM-dd, ");
		
		if (CommonUtil.isBlank(startTime))
			builder.append(CommonUtil.formatStr(msg, "StartTime"));
		
		if (!CommonUtil.isValidTime(startTime))
			builder.append("StartTime HH:mm:ss, ");
		
		if (CommonUtil.isBlank(endDate))
			builder.append(CommonUtil.formatStr(msg, "EndDate"));
		
		if (!CommonUtil.isValidDate(endDate))
			builder.append("EndDate yyyy-MM-dd, ");
		
		if (CommonUtil.isBlank(endTime))
			builder.append(CommonUtil.formatStr(msg, "EndTime"));
		
		if (!CommonUtil.isValidTime(endTime))
			builder.append("EndTime HH:mm:ss, ");
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
		
	}

}
