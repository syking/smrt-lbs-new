package models;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
import vo.CounselVO;
import vo.EventReportVO;
import vo.EventVO;
import vo.ScheduleVO;

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
	
	public Schedule(){}
	
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
		if (CommonUtil.isBlank(vehicleNumber))
			return null;
		
		return Schedule.find("vehicle_number = ?", vehicleNumber.trim()).fetch() ;
	}
	
	public static List<Schedule> findByDriverNumber(String driverNumber){
		if (CommonUtil.isBlank(driverNumber))
			return null;
		
		return Schedule.find("driver_number = ?", driverNumber.trim()).fetch() ;
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
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "performanceIndex", "drivingTime", "department", "fleet", "driver","driverNo", "id"));
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

	public static List<Schedule> findAndOrderByIdDesc() {
		return Schedule.find("order by id desc").fetch();
	}

	public static List<ScheduleVO> assemScheduleVO(List<Schedule> schedules) {
		if (schedules == null)
			return null;
		
		List<ScheduleVO> result = new ArrayList<ScheduleVO>(schedules.size());
		for (Schedule sch : schedules){
			ScheduleVO vo = new ScheduleVO(sch);
			result.add(vo);
		}
		
		return result;
	}

	public static void createByVO(final ScheduleVO vo){
		vo.validate();
		Schedule sch = parseByVO(vo);
		if (sch.vehicle == null)
			throw new RuntimeException("VehicleNumber is invalid!");
		if (sch.driver == null)
			throw new RuntimeException("DriverNumber is invalid!");
		if (sch.startTime.after(sch.endTime))
			throw new RuntimeException("EndTime must after the StartTime!");
		
		sch.create();
	}
	
	private static Schedule parseByVO(final ScheduleVO vo){
		Vehicle vehicle = Vehicle.find("byNumber", vo.vehicleNumber).first();
		
		Driver driver = Driver.find("byNumber", vo.driverNumber).first();
		
		Schedule sch = new Schedule();
		sch.driver = driver;
		sch.vehicle = vehicle;
		sch.dutyId = vo.duty;
		String start = vo.startDate + " " + vo.startTime;
		sch.startTime = CommonUtil.parse(start);
		sch.endTime = CommonUtil.parse(vo.endDate + " " + vo.endTime);
		sch.serviceNumber = vo.route;
		
		return sch;
	}
	
	public static String createByJson(String models){
		List<ScheduleVO> vos = CommonUtil.parseArray(models, ScheduleVO.class);
		if (vos == null)
			return models;
		
		for (ScheduleVO vo : vos){
			vo.validate();
			
			Vehicle vehicle = Vehicle.find("byNumber", vo.vehicleNumber).first();
			if (vehicle == null)
				throw new RuntimeException("VehicleNumber is invalid!, ");
			
			Driver driver = Driver.find("byNumber", vo.driverNumber).first();
			if (driver == null)
				throw new RuntimeException("DriverNumber is invalid!, ");
			
			Schedule sch = new Schedule();
			sch.driver = driver;
			sch.vehicle = vehicle;
			sch.dutyId = vo.duty;
			sch.startTime = CommonUtil.parse(vo.startDate + " " + vo.startTime);
			sch.endTime = CommonUtil.parse(vo.endDate + " " + vo.endTime);
			sch.serviceNumber = vo.route;
			
			if (sch.startTime.after(sch.endTime))
				throw new RuntimeException("EndTime must after the StartTime!");
			
			sch.create();
			
			vo.id = String.valueOf(sch.id);
		}
		
		String _models = CommonUtil.toJson(vos);
		
		return _models;
	}
	
	public static boolean updateByJson(String models){
		List<ScheduleVO> vos = CommonUtil.parseArray(models, ScheduleVO.class);
		if (vos == null)
			return false;
		
		for (ScheduleVO vo : vos){
			vo.validate();
			
			Vehicle vehicle = Vehicle.find("byNumber", vo.vehicleNumber).first();
			if (vo.vehicleNumber != null && vehicle == null)
				throw new RuntimeException("VehicleNumber is invalid!, ");
			
			Driver driver = Driver.find("byNumber", vo.driverNumber).first();
			if (vo.driverNumber != null && driver == null)
				throw new RuntimeException("DriverNumber is invalid!, ");
			
			Schedule sch = Schedule.findById(Long.parseLong(vo.id));
			if (sch == null)
				continue ;
			
			sch.driver = driver;
			sch.vehicle = vehicle;
			sch.dutyId = vo.duty;
			sch.startTime = CommonUtil.parse(vo.startDate + " " + vo.startTime);
			sch.endTime = CommonUtil.parse(vo.endDate + " " + vo.endTime);
			sch.serviceNumber = vo.route;
			
			if (sch.startTime.after(sch.endTime))
				throw new RuntimeException("EndTime must after the StartTime!");
			
			sch.save();
		}
		
		return true;
	}
	
	public static boolean deleteByJson(String models){
		List<ScheduleVO> vos = CommonUtil.parseArray(models, ScheduleVO.class);
		if (vos == null)
			return false;
		
		for (ScheduleVO vo : vos){
			Schedule sch = Schedule.findById(Long.parseLong(vo.id));
			if (sch == null)
				continue ;
			
			sch.delete();
		}
		
		return true;
	}

	public static List<Schedule> findByCondition(int page, int pageSize, String driverNumber,String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime) {
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime, sqlSB, params);
		
		List<Schedule> schedules = null;
		if (page <= 0 || pageSize <= 0)
			schedules = Schedule.find(sqlSB.toString() + " order by id desc", params.toArray()).fetch();
		else
			schedules = Schedule.find(sqlSB.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		
		return schedules;
	}
	
	public static long countByCondition(String driverNumber,String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime) {
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime, sqlSB, params);
		
		if (sqlSB.length() > 0 && !params.isEmpty())
			return Schedule.count(sqlSB.toString(), params.toArray());
		else
			return Schedule.count();
	}

	private static void parseCondition(String driverNumber, String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime, StringBuilder sqlSB, List<Object> params) {
		if (!CommonUtil.isBlank(driverNumber)) {
			Driver driver = Driver.findByNumber(driverNumber.trim());
			if (driver != null){
				sqlSB.append("driver = ?");
				params.add(driver);
			}
		}

		if (!CommonUtil.isBlank(vehicleNumber)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			Vehicle vehicle = Vehicle.findByNumber(vehicleNumber.trim());
			if (vehicle != null){
				sqlSB.append("vehicle = ?");
				params.add(vehicle);
			}
		}
		
		if (!CommonUtil.isBlank(route)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("serviceNumber like ?");
			params.add("%"+route.trim()+"%");
		}
		
		if (!CommonUtil.isBlank(duty)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("dutyId like ?");
			params.add("%"+duty.trim()+"%");
		}

		if (!CommonUtil.isBlank(startDate)){
			if (startTime != null && !startTime.isEmpty())
				startTime = startDate.trim() + " " + startTime.trim();
			else 
				startTime = startDate.trim() + " 00:00:00";
			
			Date start = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime);
			params.add(start);
			
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("start_time >= ?");
		}
		
		if (!CommonUtil.isBlank(endDate)){
			if (endTime != null && !endTime.isEmpty())
				endTime = endDate.trim() + " " + endTime.trim();
			else 
				endTime = endDate.trim() + " 00:00:00";
			
			Date end = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime);
			params.add(end);
			
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("end_time < ?");
		}
	}

	public static List<ComboVO> assemRouteComboVO() {
		List<ComboVO> result = new ArrayList<ComboVO>();
		List<String> lines = getAllServiceNumber();
		if (lines != null)
    		for (String l : lines){
    			result.add(new ComboVO(l,l));
    		}
		
		return result;
	}

	public static Map export(String driverNumber, String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime) {
		List<Schedule> schedules = Schedule.findByCondition(1, 200, driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime);
		List<ScheduleVO> vos = Schedule.assemScheduleVO(schedules);
		Map data = CommonUtil.assemGridData(vos, "id");
		return data;
	}
	public static Map search(int page, int pageSize, String driverNumber, String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime) {
		List<Schedule> schedules = Schedule.findByCondition(page, pageSize, driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime);
		List<ScheduleVO> vos = Schedule.assemScheduleVO(schedules);
		Map data = new HashMap();
		data.put("total", Schedule.countByCondition(driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime));
		data.put("schedules", vos);
		
		return data;
	}
	

	@Override
	public String toString() {
		return "Schedule [driver=" + driver + ", vehicle=" + vehicle
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", serviceNumber=" + serviceNumber + ", dutyId=" + dutyId
				+ "]";
	}
	
	public static void parseAndCreateByCSV(File file) throws IOException{
		if (file == null)
			throw new RuntimeException("file is invalid");
		
		String fullFileName = file.getName();
		int index = fullFileName.lastIndexOf('.');
		String ext = fullFileName.substring(index+1);
		if (!"csv".equals(ext))
			throw new RuntimeException("file type must be csv !");
		
		BufferedReader reader = new BufferedReader(new FileReader(file));
		String line = reader.readLine();
		while ((line = reader.readLine()) != null){
			String[] array = line.split(",");
			if (array.length < 6)
				continue;
			
			try{
				ScheduleVO vo = new ScheduleVO();
				vo.driverNumber = array[0];
				vo.vehicleNumber = array[1];
				vo.startDate = CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.resoveDate(array[2].split(" ")[0]));
				vo.startTime = CommonUtil.resoveTime(array[2].split(" ")[1]);
				vo.endDate = CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.resoveDate(array[3].split(" ")[0]));
				vo.endTime = CommonUtil.resoveTime(array[3].split(" ")[1]);
				vo.route = array[4];
				vo.duty = array[5];
				Schedule sch = Schedule.parseByVO(vo);
				sch.create();
				
			} catch(Throwable e){
				continue;
			}
		}
		
		reader.close();
	}
}
