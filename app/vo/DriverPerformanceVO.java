package vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import utils.CommonUtil;

import models.Driver;
import models.DriverReport;

public class DriverPerformanceVO {
	public String id;
	public String driverName;
	public String driverNo;
	public String drivingTime;
	public String reportType;
	public String start;
	public String end;
	public long highest;
	public long lowest;
	public long performanceIndex;
	
	public DriverPerformanceVO(Driver driver,String timeType, Date start, Date end, List<DriverReport> drs){
		this.id = String.valueOf(driver.id);
		this.driverName = driver.name;
		this.driverNo = driver.number;
		long reduceTotal = 0;
		long totalTimes = 0;
		List<Long> scores = new ArrayList<Long>();
		long drivingTimeTotal = 0;
		for (DriverReport dr : drs){
			scores.add(dr.performanceIndex);
			reduceTotal += dr.reduceScore();
			totalTimes += dr.total;
			drivingTimeTotal += dr.drivingTime;
		}
		
		this.performanceIndex = 100-reduceTotal;
		
		if (!scores.isEmpty()){
			Collections.sort(scores);
			this.highest = scores.get(scores.size()-1);
			this.lowest = scores.get(0);
		}
		
		if (start != null)
			this.start = CommonUtil.formatTime("yyyy-MM-dd", start);
		
		if (end != null)
			this.end = CommonUtil.formatTime("yyyy-MM-dd", end);
		
		if (timeType != null && timeType.length() > 1)
			this.reportType = timeType.toUpperCase().substring(0, 1) + timeType.substring(1);
		
		long[] time = CommonUtil.changeSecondsToTime(drivingTimeTotal);
		
		this.drivingTime = time[0] + "h " + time[1] + "m " + time[2] + "s ";
	}
	
}
