package vo;

import java.util.Collection;
import java.util.Date;

import models.Department;
import models.Driver;
import models.DriverReport;
import models.Fleet;
import utils.CommonUtil;

public class EventReportVO {

	public String id;
	public String department;
	public String fleet;
	public String route;
	public String driver;
	public String driverNo;
	public String drivingTime;
	public String reportType;
	public String startTime;
	public String endTime;
	public long speeding;
	public long suddenAcceleration;
	public long suddenBrake;
	public long suddenLTurn;
	public long suddenRTurn;
	public long idling;
	public long total;
	public long performance;
	
	public EventReportVO(){}
	
	public EventReportVO(DriverReport dr){
		init(dr, null, null, null);
	}
	
	public EventReportVO(DriverReport dr, Department dept){
		init(dr, dept, null, null);
		this.id = String.valueOf(dept.id);
	}
	
	public EventReportVO(DriverReport dr, Fleet fleet){
		init(dr, null, fleet, null);
		this.id = String.valueOf(fleet.id);
	}
	
	public EventReportVO(DriverReport dr, String route){
		init(dr, null, null, route);
		this.id = String.valueOf(route);
	}
	
	public EventReportVO(Collection<DriverReport> drs){
		init(drs, null, null, null);
	}
	
	public EventReportVO(Collection<DriverReport> drs, Department dept){
		init(drs, dept, null, null);
		this.id = String.valueOf(dept.id);
	}
	
	public EventReportVO(Collection<DriverReport> drs, Fleet fleet){
		init(drs, null, fleet, null);
		this.id = String.valueOf(fleet.id);
	}
	
	public EventReportVO(Collection<DriverReport> drs, String route){
		init(drs, null, null, route);
		this.id = String.valueOf(route);
	}
	
	public void init(DriverReport dr, Department dept, Fleet fleet, String route) {
		this.id = String.valueOf(dr.driver.id);
		this.department = dept == null ? null : dept.name;
		this.fleet = fleet == null ? null : fleet.name;
		this.route = route;
		this.driverNo = dr.driver.number;
		long[] times = CommonUtil.changeSecondsToTime(dr.drivingTime);
		this.drivingTime = times[0] + "h " + times[1] + "m " + times[2] + "s " ;
		this.driver = dr.driver.name;
		this.reportType = dr.timeType;
		this.startTime = CommonUtil.formatTime(dr.startTime);
		this.endTime = CommonUtil.formatTime(dr.endTime);
		
		this.speeding = dr.speedingCountTotal;
		this.suddenAcceleration = dr.suddenAccelerationTotal;
		this.suddenBrake = dr.suddenBrakeTotal;
		this.suddenLTurn = dr.suddenLeftTurnTotal;
		this.suddenRTurn = dr.suddenRightTurnTotal;
		this.idling = dr.idling;
		this.total = this.speeding+this.suddenAcceleration+this.suddenBrake+this.suddenLTurn+this.suddenRTurn+this.idling;
		this.performance = dr.performanceIndex;
	}
	
	public void init(Collection<DriverReport> drs, Department dept, Fleet fleet, String route) {
		this.department = dept == null ? null : dept.name;
		this.fleet = fleet == null ? null : fleet.name;
		this.route = route;
		
		int i = 0;
		long reduceTotal = 0;
		for (DriverReport dr : drs){
			if (i == 0){
				this.id = String.valueOf(dr.driver.id);
				this.driverNo = dr.driver.number;
				this.driver = dr.driver.name;
				this.reportType = dr.timeType;
				this.startTime = CommonUtil.formatTime(dr.startTime);
				this.endTime = CommonUtil.formatTime(dr.endTime);
				long[] times = CommonUtil.changeSecondsToTime(dr.drivingTime);
				this.drivingTime = times[0] + "h " + times[1] + "m " + times[2] + "s " ;
			}
			
			this.speeding += dr.speedingCountTotal;
			this.suddenAcceleration += dr.suddenAccelerationTotal;
			this.suddenBrake += dr.suddenBrakeTotal;
			this.suddenLTurn += dr.suddenLeftTurnTotal;
			this.suddenRTurn += dr.suddenRightTurnTotal;
			this.idling += dr.idling;
			reduceTotal += dr.reduceScore();
			
			i++;
		}
		
		this.performance = 100 - reduceTotal;
		
		this.total = this.speeding+this.suddenAcceleration+this.suddenBrake+this.suddenLTurn+this.suddenRTurn+this.idling;
	}
	
}
