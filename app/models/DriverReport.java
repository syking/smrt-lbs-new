package models;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
import play.db.jpa.Transactional;
import utils.CommonUtil;

/**
 * 司机的事件统计报表。
 * <li>这个表的时间类型字段名跟T_EVENT_TYPE表的tech_name字段值一样</li>
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
	
	public long idling;
	
	@Column(name="driving_time")
	public float drivingTime;// unit of time -> second
	
	public static interface TIME_TYPE {
		String DAILY = "daily";
		String WEEKLY = "weekly";
		String MONTHLY = "monthly";
		String YEARLY = "yearly";
	};
	
	public static void main(String[] args){
		Date end = new Date();
		Date start = CommonUtil.addYear(end, -1);
		end = CommonUtil.addYear(start, 1);
		
		System.out.println(start + "|" + end);
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
			return;
		}
		
		List<EventType> eventTypes = EventType.findAll();
		if (eventTypes == null || eventTypes.isEmpty()){
			System.out.println(CommonUtil.getNowTime() + "------------- eventTypes is null");
			return ;
		}
		
		// 日报表 -> 要求在每天的00开始之后的一个小时内进行统计工作，统计的都是昨天、昨天以前的
		//if (!"00".equals(CommonUtil.formatTime("HH", currentTime)))
			//return ;
		
		Date start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(currentTime, -1)) + " 00:00:00");
		Date end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd",CommonUtil.addDate(start, 1)) + " 00:00:00");
		String timeType = TIME_TYPE.DAILY;
		
		// 周报表 -> 判断end是否是星期日
		if (1 == CommonUtil.getDayOfWeek(end)){
			start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(end, -7))+" 00:00:00");
			end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, 7)) + " 00:00:00");
			timeType = TIME_TYPE.WEEKLY;
		}else{
			// 月报表 -> 判断end是否是本月的最后一天
			int now = CommonUtil.getDayOfMonth(end);
			int lastDay = CommonUtil.getLastDayOfMonth(end)-1;
			if (now == lastDay){
				start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM", CommonUtil.addMonth(end, -1))+"-01 00:00:00");
				end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) +" 00:00:00");
				timeType = TIME_TYPE.MONTHLY;
			}else{
				// 年报表 -> 判断end是否是本年的最后一天
				now = CommonUtil.getDayOfYear(end);
				lastDay = CommonUtil.getLastDayOfYear(end)-1;
				if (now == lastDay){
					start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy", CommonUtil.addYear(end, -1))+"-01-01 00:00:00");
					end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) + " 00:00:00");
					timeType = TIME_TYPE.YEARLY;
				}
			}
		}
		
		List<DriverReport> db_dr = DriverReport.find("startTime = ? and endTime = ? and timeType = ?", start, end, timeType).fetch();
		if (db_dr != null && !db_dr.isEmpty()){
			System.out.println(CommonUtil.getNowTime() + "------------- start->" + CommonUtil.formatTime(start) + " | end->"+CommonUtil.formatTime(end) + "|" +timeType + " | has aready exist!");
			return ;
		}
		
		for (Driver d : drivers){
			DriverReport dr = new DriverReport();
			dr.startTime = start;
			dr.endTime = end;
			
			long total = 0 ;
			Map<String, Long> counts = new HashMap<String, Long>();
    		for (EventType et : eventTypes){
    			long count = Event.calculateDriverEventCount(d.id, start, end, et.techName);
        		counts.put(et.columnName, count);
        		total += count;
    		}
    		
			dr.driver = d;
			dr.drivingTime = Driver.calculateDrivingTime(d.number);
			
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
			
			dr.create();
		}
	}
}
