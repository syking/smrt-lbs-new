package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import models.Department;
import models.Driver;
import models.DriverReport;
import models.Event;
import models.Schedule;

import play.Logger;
import play.modules.excel.RenderExcel;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.DriverPerformanceVO;
import vo.EventReportVO;
import vo.EventTypeReportVO;

@With({Interceptor.class, ExcelControllerHelper.class})
public class Excels extends Controller{

	private static void renderExcel(Map map){
		request.format = "xls";
    	renderArgs.put(RenderExcel.RA_FILENAME, "records_"+CommonUtil.formatTime("yyyyMMddHHmmss", new Date())+".xls");
        renderTemplate(renderArgs.get(THEME) + "/Excels/data-records.xls", map);
	}
	
    public static void queryData(Long driverId, String timeType, String startTime, String endTime) {
		driverId = driverId == null ? 0 : driverId;
		Map map = Driver.queryReport(-1, -1, driverId, timeType, startTime, endTime);
		if (map != null)
			renderExcel(map);
	}
    
    public static void reportDepartment(Long parentId, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty())
    		return;
    	
    	List<Department> departments = Department.findByParent(parentId);
    	if (departments == null)
    		return ;
    	
    	Map map = Department.assemReport(departments, timeType, time);
    	if (map != null)
    		renderExcel(map);
    }
    
    public static void reportRoute(String line, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty())
    		return;
    	
    	List<String> lineList = Schedule.findLinesByLine(line);
    	if (lineList == null)
    		return ;
    	
    	Map map = Schedule.assemReportByLine(lineList, timeType, time);
    	if (map != null)
    		renderExcel(map);
    }
    
    public static void reportDriverByDept(Long departmentId, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty())
    		return ;
    	
		List<Driver> drivers = null;
		if (departmentId == null || departmentId <= 0)
			drivers = Driver.findAll();
		else
			drivers = Driver.find("select d from Driver d where d.department.id = ?", departmentId).fetch();
		
		Map map = Driver.assemReport(drivers, timeType, time);
		if (map != null)
			renderExcel(map);
    }
    
    public static void reportDriver(long driverId, String timeType, String time){
		if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty())
			return ;
		
		Driver driver = Driver.find("id = ?", driverId).first();
		if (driver == null)
			return;
		
		Map map = driver.generatePerformanceReport(timeType, time);
		
		request.format = "xls";
    	renderArgs.put(RenderExcel.RA_FILENAME, driver.name + "_"+driver.number + "_performance_"+CommonUtil.formatTime("yyyyMMddHHmmss", new Date())+".xls");
        renderTemplate(renderArgs.get(THEME) + "/Excels/driver-performance.xls", map);
	}
    
    public static void reportDriverByRoute(String line, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty())
    		return ;
    	
		List<Schedule> schs = null;
		if (line == null || line.isEmpty())
			schs = Schedule.findAll();
		else
			schs = Schedule.find("line = ?", line).fetch();
		
		if (schs == null)
			return ;
		
		Set<Driver> drivers = new HashSet<Driver>(schs.size());
		for (Schedule s : schs)
			drivers.add(s.driver);
		
		Map map = Driver.assemReport(drivers, timeType, time);
		if (map != null)
			renderExcel(map);
    }
    
    public static void reportEvent(Long driver, String serviceNo, Long type, Date startTime, Date endTime) {
		Map data = Event.search(-1, -1, driver, serviceNo, type, startTime, endTime);
		if (data != null)
			renderExcel(data);
	}
    
    public static void schedules(String driverNumber, String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime){
    	Map data = Schedule.search(-1, -1, driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime);
		if (data != null)
			renderExcel(data);
    }
    
    public static void drivers(String department, String number, String name, String description){
    	Map data = Driver.search(department, number, name, description);
    	if (data != null)
    		renderExcel(data);
    }
}
