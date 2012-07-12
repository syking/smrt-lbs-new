package models;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.ChartSerie;
import vo.ComboVO;
import vo.EventReportVO;

/**
 * 车次安排时间等信息
 * @author weiwei
 *
 */
@Entity
@Table(name="t_schedule")
public class Schedule extends Model {

	/* 司机编号 例如：74689 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(referencedColumnName="number")
	public Driver driver;
	
	/* 车辆编号 例如：SMB77P */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(referencedColumnName="number")
	public Vehicle vehicle;
	
	/* 开始时间 */
	@Column(name="start_time")
	public Date startTime;
	
	/* 结束时间 */
	@Column(name="end_time")
	public Date endTime;
	
	/* 开车路线 */
	@Column(name = "line")
	public String serviceNumber;
	
	/* 调度安排 例如：851AM04 | 851PM04 */
	@Column(unique = true, name = "duty_id")
	public String dutyId;
	
	public static List<String> getAllServiceNumber(){
		List<String> list = Schedule.find("select distinct s.serviceNumber from Schedule s ").fetch();
		
		return list;
	}
	
	public static List<ComboVO> getComboByVehicle(String vehicleNo){
		List<Schedule> scheList = findByVehicleNumber(vehicleNo);
		List<ComboVO> schedules = new ArrayList<ComboVO>();
		if (scheList != null) 
        	 for (Schedule s : scheList)
        		 schedules.add(new ComboVO(CommonUtil.formatTime("yyyy-MM-dd HH:mm", s.startTime)+", "+CommonUtil.formatTime("yyyy-MM-dd HH:mm", s.endTime), s.id));
		
		return schedules;
	}
	
	public static List<Schedule> findByVehicleNumber(String vehicleNumber){
		return Schedule.find("vehicle_number = ?", vehicleNumber).fetch() ;
	}
	
	public static List<Schedule> findByDriverNumber(String driverNumber){
		return Schedule.find("driver_number = ?", driverNumber).fetch() ;
	}

	public static Map assemReportByLine(Collection<String> lines, String timeType, String time){
    	//---------------chart----------------------------
    	List<EventReportVO> datas = new ArrayList<EventReportVO>();
		List<String> categories = new ArrayList<String>(lines.size());
		ChartSerie serie = new ChartSerie();
		//---------------chart----------------------------
		
		for (String line : lines){
			categories.add(line);
			
			List<Driver> drivers = Schedule.findDriverByLine(line);
			List<DriverReport> drs = DriverReport.findByDrivers(drivers, timeType, time);
			if (drs == null || drs.isEmpty())
				continue;
			
			EventReportVO drVO = new EventReportVO(drs, line);
			
			//--------char-------------
			serie.assemDriverReportData(drVO);
			datas.add(drVO);
    	}
		
		List<Map> series = serie.generateChartSeries();
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "department", "fleet", "driver","driverNo", "date", "id"));
		map.put("series", series);
		map.put("categories", categories);
		
		return map;
    }

	public static List<String> findLinesByLine(String line){
		List<String> lineList = Schedule.getAllServiceNumber();
    	if (lineList == null || lineList.size() == 0){
    		if (line == null)
    			return null;
    		
    		lineList = Arrays.asList(line);
    	}else if (line != null && line.trim().length() > 0 && !line.equals("all")){
    		lineList = Arrays.asList(line);
    	}
    	
    	return lineList;
	}
	
	public static List<Driver> findDriverByLine(String line) {
		List<Schedule> schs = Schedule.find("serviceNumber = ?", line).fetch();
		if (schs == null || schs.isEmpty())
			return null;
		
		Set<Long> driverIds = new HashSet<Long>();
		for (Schedule sch : schs){
			Driver driver = sch.driver;
			if (driver == null)
				continue;
			
			driverIds.add(driver.id);
		}
		
		List<Driver> drivers = new ArrayList<Driver>(driverIds.size());
		for (Long id : driverIds){
			Driver d  = Driver.findById(id);
			drivers.add(d);
		}
		
		return drivers;
	}
	
}
