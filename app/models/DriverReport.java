package models;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
import play.db.jpa.Transactional;
import utils.CommonUtil;
import vo.EventTypeReportVO;

/**
 * 司机的事件统计报表。
 * <li>这个表的时间类型字段名跟T_EVENT_TYPE表的tech_name字段值一样</li>
 * @author weiwei
 *
 */
/**
 * @author weiwei
 *
 */
@Entity
@Table(name="t_driver_report")
public class DriverReport extends Model {

	@ManyToOne
	public Driver driver;
	
	@Column(name="service_number")
	public String serviceNo;
	
	@Column(name="time_type")
	public String timeType;// daily|weekly|monthly|yearly
	
	@ManyToOne
	public Vehicle vehicle;
	
	@Column(name="start_time")
	public Date startTime;
	
	@Column(name="end_time")
	public Date endTime;
	
	@Column(name="high_way_max_speed")
	public float highWayMaxSpeed;// unit of time -> km/h
	
	@Column(name="non_high_way_max_speed")
	public float nonHighWayMaxSpeed;// // unit of time -> km/h
	
	@Column(name="speeding_count_on_high_way")
	public long speedingCountOnHighWay;
	
	@Column(name="speeding_count")
	public long speedingCount;
	
	@Column(name="speeding_total")
	public long speedingCountTotal;
	
	@Column(name="speeding_duration_on_high_way")
	public float speedingDurationOnHighWay;// unit of time -> second
	
	@Column(name="speeding_duration_total")
	public float speedingDurationTotal;// unit of time -> second
	
	@Column(name="sudden_acceleration_near_bus_stop")
	public long suddenAccelerationNearBusStop;
	
	@Column(name="sudden_acceleration")
	public long suddenAcceleration;
	
	@Column(name="sudden_acceleration_total")
	public long suddenAccelerationTotal;
	
	@Column(name="sudden_brake_near_bus_stop")
	public long suddenBrakeNearBusStop;
	
	@Column(name="sudden_brake")
	public long suddenBrake;
	
	@Column(name="sudden_brake_total")
	public long suddenBrakeTotal;
	
	@Column(name="sudden_left_turn_near_bus_stop")
	public long suddenLeftTurnNearBusStop;
	
	@Column(name="sudden_left_turn")
	public long suddenLeftTurn;
	
	@Column(name="sudden_left_turn_total")
	public long suddenLeftTurnTotal;
	
	@Column(name="sudden_right_turn_near_bus_stop")
	public long suddenRightTurnNearBusStop;
	
	@Column(name="sudden_right_turn")
	public long suddenRightTurn;
	
	@Column(name="sudden_right_turn_total")
	public long suddenRightTurnTotal;
	
	@Column(name="sudden_lane_change_near_bus_stop")
	public long suddenLaneChangeNearBusStop;
	
	@Column(name="sudden_lane_change_total")
	public long suddenLaneChangeTotal;
	
	@Column(name="performance_index")
	public long performanceIndex;
	
	@Column(name="highest_performance_index")
	public long highestPerformanceIndex;
	
	@Column(name="lowest_performance_index")
	public long lowestPerformanceIndex;
	
	public long idling;
	
	@Column(name="driving_time")
	public long drivingTime;// unit of time -> second
	
	public long total;
	
	public static interface TIME_TYPE {
		String DAILY = "daily";
		String WEEKLY = "weekly";
		String MONTHLY = "monthly";
		String YEARLY = "yearly";
	};
	
	public String toString(){
		return "[id=" + id + "]";
	}
	
	public static boolean isValidTimeType(String timeType){
		if (TIME_TYPE.DAILY.equals(timeType))
			return true;
		
		if (TIME_TYPE.WEEKLY.equals(timeType))
			return true;
		
		if (TIME_TYPE.MONTHLY.equals(timeType))
			return true;
		
		if (TIME_TYPE.YEARLY.equals(timeType))
			return true;
		
		return false;
	}
	
	public static List<DriverReport> findByDriver(int page, int pageSize, Driver driver, String timeType, String startTime, String endTime) {
		List<DriverReport> drs = new ArrayList<DriverReport>();
		StringBuilder sql = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(driver, timeType, startTime, endTime, sql, params);
		
		List<DriverReport> _drs = null;
		if (sql.length() > 0 && !params.isEmpty())
			_drs = DriverReport.find(sql.toString(), params.toArray()).fetch(page, pageSize);
		else
			_drs = DriverReport.all().fetch(page, pageSize);
		
		if (_drs != null && !_drs.isEmpty())
			drs.addAll(_drs);
		
		return drs;
	}

	public static long countByCondition(Driver driver, String timeType, String startTime, String endTime){
		StringBuilder sql = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(driver, timeType, startTime, endTime, sql, params);
		
		if (sql.length() > 0 && !params.isEmpty())
			return DriverReport.count(sql.toString(), params.toArray());
		
		return DriverReport.count();
	}
	
	private static void parseCondition(Driver driver, String timeType, String startTime, String endTime, StringBuilder sql, List<Object> params) {
		if (driver != null){
			sql.append("driver = ?");
			params.add(driver);
		}
		
		if (timeType != null && !timeType.isEmpty()) {
			if (sql.length() > 0)
				sql.append(" and ");
			
			sql.append("timeType = ?");
			params.add(timeType);
			
			if (startTime != null && !startTime.isEmpty()){
				sql.append(" and startTime >= ?");
				params.add(CommonUtil.getDateByTimeTypeAndTime(timeType, startTime));
			}
			
			if (endTime != null && !endTime.isEmpty()){
				sql.append(" and endTime < ?");
				params.add(CommonUtil.getDateByTimeTypeAndTime(timeType, endTime));
			}
		}
	}
	
	public static List<DriverReport> findByDrivers(Collection<Driver> drivers, String timeType, String time) {
		if (drivers == null || timeType == null || time == null)
			return null;
		
		List<DriverReport> drs = new ArrayList<DriverReport>();
		
		for (Driver driver : drivers){
			Date date = null;
			try {
				date = CommonUtil.getDateByTimeTypeAndTime(timeType, time);
			} catch (Throwable e){
				e.printStackTrace();
				continue;
			}
			
			Object[] params = {driver, timeType, date};
			DriverReport dr = DriverReport.find("driver = ? and timeType = ? and startTime = ?", params).first();
			if (dr == null)
				continue;
			
			drs.add(dr);
		}
		
		return drs;
	}
	
	public static List<DriverReport> findByDriver(Driver driver, String timeType, String time){
		List<Driver> drivers = new ArrayList<Driver>();
		drivers.add(driver);
		
		List<DriverReport> drs = findByDrivers(drivers, timeType, time);
		
		return drs;
	}
	
	/**
	 * 统计司机事件数据
	 * @param currentTime
	 */
	@Transactional
	public static void doStatistics(final Date currentTime){
		List<Driver> drivers = Driver.findAll();
		if (drivers == null || drivers.isEmpty()){
			System.out.println(CommonUtil.getNowTime() + "------------- drivers is null");
			new Log("System", "DriverReport.doStaticstics", "Driver not found.", null, "-", false).create();
			return;
		}
		
		List<EventType> eventTypes = EventType.findAll();
		if (eventTypes == null || eventTypes.isEmpty()){
			System.out.println(CommonUtil.getNowTime() + "------------- eventTypes is null");
			new Log("System", "DriverReport.doStaticstics", "EventType not found.", null, "-", false).create();
			return ;
		}
		
		// 日报表 ->
		Date end = dailyReport(currentTime, drivers, eventTypes);
			
		// 周报表 -> 
		end = weeklyReport(drivers, eventTypes, end);
		
		// 月报表 -> 
		end = monthlyReport(drivers, eventTypes, end);
		
		// 年报表 -> 
		Date firtDayOfYear = yearlyReport(drivers, eventTypes, end);
		
		// Rebuild the Incomplete Report
		System.out.println(CommonUtil.formatTime(firtDayOfYear));
		while (firtDayOfYear.before(currentTime)){
			firtDayOfYear = CommonUtil.addDate(firtDayOfYear, 1);
			// daily
			Date _end = dailyReport(firtDayOfYear, drivers, eventTypes);
			
			// weekly
			_end = weeklyReport(drivers, eventTypes, _end);
			
			// monthly
			_end = monthlyReport(drivers, eventTypes, _end);
			
			// yearly
			yearlyReport(drivers, eventTypes, _end);
			
			System.out.println(CommonUtil.formatTime(firtDayOfYear));
		}
	}

	private static Date yearlyReport(List<Driver> drivers, List<EventType> eventTypes, Date end) {
		Date start;
		String timeType;
		List<DriverReport> db_dr;
		int lastDay;
		lastDay = CommonUtil.getLastDayOfYear(end)-1;
		start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy", CommonUtil.addYear(end, -1))+"-01-01 00:00:00");
		end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) + " 00:00:00");
		end = CommonUtil.addSecond(end, -1);
		timeType = TIME_TYPE.YEARLY;
		db_dr = DriverReport.find("startTime = ? and endTime = ? and timeType = ?", start, end, timeType).fetch();
		if (db_dr == null || db_dr.isEmpty()){
			DriverReport.saveToDb(drivers, timeType, start, end, eventTypes);
		} else {
			System.out.println("yearly no report");
		}
		
		return start;
	}

	private static Date monthlyReport(List<Driver> drivers, List<EventType> eventTypes, Date end) {
		Date start;
		String timeType;
		List<DriverReport> db_dr;
		int lastDay = CommonUtil.getLastDayOfMonth(end)-1;
		start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM", CommonUtil.addMonth(end, -1))+"-01 00:00:00");
		end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) +" 00:00:00");
		end = CommonUtil.addSecond(end, -1);
		timeType = TIME_TYPE.MONTHLY;
		db_dr = DriverReport.find("startTime = ? and endTime = ? and timeType = ?", start, end, timeType).fetch();
		if (db_dr == null || db_dr.isEmpty()){
			DriverReport.saveToDb(drivers, timeType, start, end, eventTypes);
		} else {
			System.out.println("monthly no report");
		}
		
		return end;
	}

	private static Date weeklyReport(List<Driver> drivers, List<EventType> eventTypes, Date end) {
		Date start;
		String timeType;
		List<DriverReport> db_dr;
		int day = CommonUtil.getDayOfWeek(end);
		start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(end, -day+2))+" 00:00:00");
		end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, 7)) + " 00:00:00");
		end = CommonUtil.addSecond(end, -1);
		timeType = TIME_TYPE.WEEKLY;
		db_dr = DriverReport.find("startTime = ? and endTime = ? and timeType = ?", start, end, timeType).fetch();
		if (db_dr == null || db_dr.isEmpty()){
			DriverReport.saveToDb(drivers, timeType, start, end, eventTypes);
		} else {
			System.out.println("weekly no report");
		}
		
		return end;
	}

	private static Date dailyReport(final Date currentTime, List<Driver> drivers, List<EventType> eventTypes) {
		Date start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(currentTime, -1)) + " 00:00:00");
		Date end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd",CommonUtil.addDate(start, 1)) + " 00:00:00");
		end = CommonUtil.addSecond(end, -1);
		String timeType = TIME_TYPE.DAILY;
		List<DriverReport> db_dr = DriverReport.find("startTime = ? and endTime = ? and timeType = ?", start, end, timeType).fetch();
		if (db_dr == null || db_dr.isEmpty()){
			DriverReport.saveToDb(drivers, timeType, start, end, eventTypes);
		} else {
			System.out.println("daily no report");
		}
		
		return end;
	}
	
	/**
	 *Create the Report and Save it to DataBase
	 * @param drivers
	 * @param timeType
	 * @param start
	 * @param end
	 * @param eventTypes
	 */
	public static void saveToDb(List<Driver> drivers, String timeType, Date start, Date end, List<EventType> eventTypes){
		for (Driver d : drivers){
			DriverReport dr = new DriverReport();
			dr.startTime = start;
			dr.endTime = end;
			
			long total = 0 ;
			Map<String, Long> counts = new HashMap<String, Long>();
    		for (EventType et : eventTypes){
    			long count = Event.calculateDriverEventCount(d.id, start, end, et.techName);
        		counts.put(et.fieldName, count);
        		total += count;
    		}
    		
			dr.driver = d;
			dr.drivingTime = Driver.calculateDrivingTime(d.number, start, end);
			
			dr.highWayMaxSpeed = 0;
			dr.idling = 0;
			dr.nonHighWayMaxSpeed = 0;
			dr.serviceNo = "";
			
			dr.speedingCountOnHighWay = 0;
			dr.speedingCount = counts.get("speedingCount");
			dr.speedingCountTotal = dr.speedingCountOnHighWay + dr.speedingCount;
			
			dr.speedingDurationOnHighWay = 0;
			dr.speedingDurationTotal = 0;
			
			dr.suddenAcceleration = counts.get("suddenAcceleration");
			dr.suddenAccelerationNearBusStop = 0;
			dr.suddenAccelerationTotal = dr.suddenAcceleration + dr.suddenAccelerationNearBusStop;
			
			dr.suddenBrake = counts.get("suddenBrake");
			dr.suddenBrakeNearBusStop = 0;
			dr.suddenBrakeTotal = dr.suddenBrake + dr.suddenBrakeNearBusStop;
			
			dr.suddenLaneChangeNearBusStop = 0;
			dr.suddenLaneChangeTotal = 0;
			
			dr.suddenLeftTurn = counts.get("suddenLeftTurn");
			dr.suddenLeftTurnNearBusStop = 0;
			dr.suddenLeftTurnTotal = dr.suddenLeftTurn + dr.suddenLeftTurnNearBusStop;
			
			dr.suddenRightTurn = counts.get("suddenRightTurn");
			dr.suddenRightTurnNearBusStop = 0;
			dr.suddenRightTurnTotal = dr.suddenRightTurn + dr.suddenRightTurnNearBusStop;
			
			dr.timeType = timeType;
			
			dr.performanceIndex = 100 - dr.reduceScore();
			dr.total = dr.total();
			
			Driver _d = Driver.findById(dr.driver.id);
			Department dept = _d.department;
			if (dept != null){
				dept = Department.findById(dept.id);
				Set<Driver> fleetDrivers = dept.drivers;
				if (fleetDrivers != null && !fleetDrivers.isEmpty()){
					List<Long> fleetDriverScores = new ArrayList(fleetDrivers.size());
					for (Driver fleetDriver : fleetDrivers){
						List<DriverReport> drs = DriverReport.findByDriver(fleetDriver, timeType, null);
						if (drs == null || drs.isEmpty())
							continue;
						
						fleetDriverScores.add(fleetDriver.calculateScore(drs));
					}
					
					if (!fleetDriverScores.isEmpty()){
						Collections.sort(fleetDriverScores);
						dr.highestPerformanceIndex = fleetDriverScores.get(fleetDriverScores.size()-1);
						dr.lowestPerformanceIndex = fleetDriverScores.get(0);
					}
				}
			}
			
			dr.create();
		}
		
		new Log("System", "DriverReport.saveToDB", String.format("%s Report between %s and %s .", timeType, start, end), null, "-", false).create();
	}
	
	/**
	 * 计算减分
	 */
	public long reduceScore(){
		Map<String, Long> rules = EventType.getPointRule();
		return this.speedingCountTotal * rules.get("speedingCount") 
			+ this.suddenAccelerationTotal * rules.get("suddenAcceleration") 
			+ this.suddenBrakeTotal * rules.get("suddenBrake")
			+ this.suddenLeftTurnTotal * rules.get("suddenLeftTurn") 
			+ this.suddenRightTurnTotal * rules.get("suddenRightTurn") 
			+ this.idling * rules.get("idling");
	}
	
	public long total(){
		return this.speedingCountTotal + this.suddenAccelerationTotal + this.suddenLeftTurnTotal + this.suddenRightTurnTotal + this.suddenBrakeNearBusStop;
	}
	
	public static List<EventTypeReportVO> generateDriverEventPerformance(Driver driver, String timeType, String time){
		List<EventType> types = EventType.findAll();
		List<EventTypeReportVO> result = new ArrayList<EventTypeReportVO>(types.size());
		
		Date[] dates = CommonUtil.getStartAndEndDate(timeType, time);
		String start = CommonUtil.formatTime("yyyy-MM-dd",dates[0]);
		String end = CommonUtil.formatTime("yyyy-MM-dd", dates[1]);
		List<DriverReport> drs = DriverReport.findByDriver(driver, timeType, time);
		
		Map<String, Long> rules = EventType.getPointRule();
		// to count the percent
		long totalTimes = 0;
		
		for (EventType et : types){
			long times = 0;
			long rule = 0;
			if (EventType.Constant.SPEEDING.equals(et.techName)){
				for (DriverReport dr : drs)
					times += dr.speedingCountTotal;
				rule = rules.get("speedingCount");
			} else if (EventType.Constant.IDLE.equals(et.techName)){
				for (DriverReport dr : drs)
					times += dr.idling;
				rule = rules.get("idling");
			} else if (EventType.Constant.SUDDEN_ACCELERATION.equals(et.techName)){
				for (DriverReport dr : drs)
					times += dr.suddenAccelerationTotal;
				rule = rules.get("suddenAcceleration");
			} else if (EventType.Constant.SUDDEN_BRAKING.equals(et.techName)){
				for (DriverReport dr : drs)
					times += dr.suddenBrakeTotal;
				rule = rules.get("suddenBrake");
			} else if (EventType.Constant.SUDDEN_LEFT.equals(et.techName)){
				for (DriverReport dr : drs)
					times += dr.suddenLeftTurnTotal;
				rule = rules.get("suddenLeftTurn");
			} else if (EventType.Constant.SUDDEN_RIGHT.equals(et.techName)){
				for (DriverReport dr : drs)
					times += dr.suddenRightTurnTotal;
				rule = rules.get("suddenRightTurn");
			}
			
			totalTimes += times;
			result.add(new EventTypeReportVO(et.id, et.name, rule, times, "0%", timeType, start, end));
		}
		
		if (totalTimes > 0)
			for (EventTypeReportVO etVO : result)
				etVO.percent = CommonUtil.percent(etVO.times, totalTimes);
		
		return result;
	}
	
}
