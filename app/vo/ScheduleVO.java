package vo;

import utils.CommonUtil;
import models.Schedule;

public class ScheduleVO {

	public String id;
	public String driverNumber;
	public String vehicleNumber;
	public String startDate;
	public String startTime;
	public String endDate;
	public String endTime;
	public String route;
	public String duty;
	
	public ScheduleVO() {
		
	}
	
	public ScheduleVO(Schedule sch) {
		super();
		this.id = String.valueOf(sch.id);
		if (sch.driver != null)
			this.driverNumber = sch.driver.number;
		if (sch.vehicle != null)
			this.vehicleNumber = sch.vehicle.number;
		this.startDate = CommonUtil.formatTime(sch.startTime).split(" ")[0];
		this.startTime = CommonUtil.formatTime(sch.startTime).split(" ")[1];
		this.endDate =  CommonUtil.formatTime(sch.endTime).split(" ")[0];
		this.endTime = CommonUtil.formatTime(sch.endTime).split(" ")[1];
		this.route = sch.serviceNumber;
		this.duty = sch.dutyId;
	}
	
	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can't be empty, ";
		if (CommonUtil.isBlank(driverNumber))
			builder.append(CommonUtil.formatStr(msg, "DriverNumber"));
		
		if (CommonUtil.isBlank(vehicleNumber))
			builder.append(CommonUtil.formatStr(msg, "VehicleNumber"));
		
		if (CommonUtil.isBlank(route))
			builder.append(CommonUtil.formatStr(msg, "Route"));
		
		if (CommonUtil.isBlank(duty))
			builder.append(CommonUtil.formatStr(msg, "Duty"));
		
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

	@Override
	public String toString() {
		return "ScheduleVO [id=" + id + ", driverNumber=" + driverNumber
				+ ", vehicleNumber=" + vehicleNumber + ", startDate="
				+ startDate + ", startTime=" + startTime + ", endDate="
				+ endDate + ", endTime=" + endTime + ", route=" + route
				+ ", duty=" + duty + "]";
	}
	
}
