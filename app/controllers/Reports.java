package controllers;

import static models.User.Constant.THEME;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import models.Department;
import models.Driver;
import models.DriverReport;
import models.Event;
import models.Fleet;
import models.Schedule;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.DriverPerformanceVO;
import vo.EventReportVO;
import vo.EventTypeReportVO;
import vo.Grid;

/**
 * 报表，主要是对Event的报表分析。
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Reports extends Controller {

    public static void index() {
        render();
    }
    
    /**
     * 司机报表Grid
     */
    public static void driverByDept(String id, Long departmentId, String timeType, String time){
    	List<Department> deptList = Department.find("select d from Department d where d.id not in (select dt.parent.id from Department dt where dt.parent.id is not null) ").fetch();
    	List<ComboVO> departments = new ArrayList<ComboVO>();
    	if (deptList != null)
    		for (Department d : deptList){
    			departments.add(new ComboVO(d.name, d.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("departments", CommonUtil.getGson().toJson(departments));
    	map.put("departmentId", departmentId);
    	map.put("timeType", timeType);
    	map.put("time", time);
    	map.put("tabId", id);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/dept-driver-grid.html")).render(map));
    }
    
    /**
     * 分司机报表
     */
    public static void driverListJsonByDept(Long departmentId, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
    	
		List<Driver> drivers = null;
		if (departmentId == null || departmentId <= 0)
			drivers = Driver.findAll();
		else
			drivers = Driver.find("select d from Driver d where d.department.id = ?", departmentId).fetch();
		
		Map map = Driver.assemReport(drivers, timeType, time);
		
    	renderJSON(map);
    }
    
    /**
     * 部门报表Grid
     */
    public static void department(String id){
    	List<Department> deptList = Department.find("select d from Department d where d.id in (select dt.parent.id from Department dt where dt.parent.id is not null) ").fetch();
    	List<ComboVO> departments = new ArrayList<ComboVO>();
    	if (deptList != null)
    		for (Department d : deptList){
    			departments.add(new ComboVO(d.name, d.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("departments", CommonUtil.getGson().toJson(departments));
    	map.put("tabId", id);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/department-grid.html")).render(map));
    }
    
    /**
     * 分部门报表
     */
    public static void departmentListJson(Long parentId, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
    	
    	List<Department> departments = Department.findByParent(parentId);
    	if (departments == null)
    		return ;
    	
    	Map map = Department.assemReport(departments, timeType, time);
    	
    	renderJSON(map);
    }
    
    /**
     * 分车队司机报表Grid
     */
    @Deprecated
    public static void driverByFleet(Long fleetId){
    	List<Fleet> fleetList = Fleet.find("select f from Fleet f where f.id not in (select fl.parent.id from Fleet fl where fl.parent.id is not null) ").fetch();
    	List<ComboVO> fleets = new ArrayList<ComboVO>();
    	if (fleetList != null)
    		for (Fleet f : fleetList){
    			fleets.add(new ComboVO(f.name, f.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("fleets", CommonUtil.getGson().toJson(fleets));
    	map.put("fleetId", fleetId);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/fleet-driver-grid.html")).render(map));
    }
    
    /**
     * 分车队司机报表
     */
    @Deprecated
    public static void driverListJsonByFleet(Long fleetId, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
    	
    	List<Schedule> schs = null;
		if (fleetId == null || fleetId <= 0)
			schs = Schedule.findAll() ;
		else
			schs = Schedule.find("select s from Schedule s where s.vehicle.id in (select v.id from Vehicle v where v.fleet.id = ?)", fleetId).fetch();
		if (schs == null)
			return ;
		
		Set<Driver> drivers = new HashSet<Driver>(schs.size());
		for (Schedule s : schs)
			drivers.add(s.driver);
		
		Map map = Driver.assemReport(drivers, timeType, time);
		
    	renderJSON(map);
    }
    
    
    /**
     * Fleet 车队报表 Grid
     */
    @Deprecated
    public static void fleet(){
    	List<Fleet> fleetList = Fleet.find("select f from Fleet f where f.id in (select fl.parent.id from Fleet fl where fl.parent.id is not null) ").fetch();
    	List<ComboVO> fleets = new ArrayList<ComboVO>();
    	if (fleetList != null)
    		for (Fleet f : fleetList){
    			fleets.add(new ComboVO(f.name, f.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("fleets", CommonUtil.getGson().toJson(fleets));
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/fleet-grid.html")).render(map));
    }
    
    /**
     * 分车队报表
     */
    @Deprecated
    public static void fleetListJson(Long parentId, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
    	
    	List<Fleet> fleets = Fleet.findByParent(parentId);
    	if (fleets == null)
    		return ;
    	Map map = Fleet.assemReport(fleets, timeType, time);
    	
    	renderJSON(map);
    }
    
    /**
     * 分路线司机报表Grid
     * @param line service number
     * @param id tab id
     * @param timeType report type e.g daily|weekly|monthly|yearly
     * @param time select a date time to get the report data
     */
    public static void driverByLine(String line, String id, String timeType, String time){
    	List<String> lineList = Schedule.getAllServiceNumber();
    	List<ComboVO> lines = new ArrayList<ComboVO>();
    	if (lineList != null)
    		for (String l : lineList){
    			lines.add(new ComboVO(l, l));
    		}
    	
    	Map map = new HashMap();
    	map.put("lines", CommonUtil.getGson().toJson(lines));
    	map.put("line", line);
    	map.put("timeType", timeType);
    	map.put("time", time);
    	map.put("tabId", id);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/line-driver-grid.html")).render(map));
    }
    
    /**
     * 分路线司机报表
     * @param line service number
     * @param timeType report type e.g daily|weekly|monthly|yearly
     * @param time select a date time to get the report data
     */
    public static void driverListJsonByLine(String line, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
    	
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
		
    	renderJSON(map);
    }
    
    /**
     * 分路线报表 Grid
     * @param id tab id
     */
    public static void line(String id){
    	List<String> lineList = Schedule.getAllServiceNumber();
    	List<ComboVO> lines = new ArrayList<ComboVO>();
    	if (lineList != null)
    		for (String l : lineList){
    			lines.add(new ComboVO(l, l));
    		}
    	
    	Map map = new HashMap();
    	map.put("lines", CommonUtil.getGson().toJson(lines));
    	map.put("tabId", id);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/line-grid.html")).render(map));
    }
    
    /**
     * 分路线 报表
     * @param line service number
     * @param timeType report type e.g daily|weekly|monthly|yearly
     * @param time select a date to get the report
     */
    public static void lineListJson(String line, String timeType, String time){
    	if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
    	
    	List<String> lineList = Schedule.findLinesByLine(line);
    	if (lineList == null)
    		return ;
    	
    	Map map = Schedule.assemReportByLine(lineList, timeType, time);
		
    	renderJSON(map);
    }

    /**
     * 打开单个司机报表页
     * @param id tab id
     * @param driverId driver id 
     * @param timeType report type e.g daily|weekly|monthly|yearly
     * @param time
     */
	public static void driver(String id, long driverId, String timeType, String time) {
		List<Driver> driverList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (driverList != null)
    		for (Driver d : driverList){
    			drivers.add(new ComboVO(d.name, d.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	map.put("driverId", driverId);
    	map.put("tabId", id);
    	map.put("timeType", timeType);
    	map.put("time", time);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/driver-grid.html")).render(map));
	}
	
	/**
     * 司机单个报表，包括成绩
     * @param driverId
     * @param timeType
     * @param time
     */
	public static void driverListJson(long driverId, String timeType, String time){
		if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty()){
    		renderJSON(CommonUtil.map("message", "timeType is invalid or time is invalid !"));
    	}
		
		Driver driver = Driver.find("id = ?", driverId).first();
		if (driver == null)
			return;
		
		Date[] dates = CommonUtil.getStartAndEndDate(timeType, time);
		Date start = dates[0];
		Date end = dates[1];
		
		List<DriverReport> drs = DriverReport.findByDriver(driver, timeType, time);
		DriverPerformanceVO performance = new DriverPerformanceVO(driver, timeType, start, end, drs);
		Map map = new HashMap();
		map.put("data", new DriverPerformanceVO[]{performance});
		map.put("columns", CommonUtil.assemColumns(DriverPerformanceVO.class, "id"));
		
		List<EventTypeReportVO> etrVOs = DriverReport.generateDriverEventPerformance(driver, timeType, time);
		Map events = new HashMap();
		events.put("data", etrVOs);
		events.put("columns", CommonUtil.assemColumns(EventTypeReportVO.class, "id"));
		map.put("events", events);
		
		List<Map> pieCharts = new ArrayList<Map>(etrVOs.size());
		for (EventTypeReportVO ertVO : etrVOs){
			Map pie = new HashMap();
			pie.put("type", ertVO.eventType);
			pie.put("value", ertVO.times);
			pieCharts.add(pie);
		}
		
		map.put("chart", pieCharts);

		renderJSON(map);
	}
	
	/**
	 * Open Data Query Page 
	 * @param id tab id
	 */
	public static void query(String id) {
		List<Driver> driverList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (driverList != null)
    		for (Driver d : driverList)
    			drivers.add(new ComboVO(d.name, d.id));
    	
    	Map map = new HashMap();
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	Grid grid = new Grid();
    	grid.tabId = id;
    	grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(EventReportVO.class, "department","fleet","route", "id"));
    	
    	map.put("grid", grid);
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/data-query.html")).render(map));
	}

	public static void queryData(int page, int pageSize, Long driverId, String timeType, String startTime, String endTime) {
		driverId = driverId == null ? 0 : driverId;
		Map map = Driver.queryReport(page, pageSize, driverId, timeType, startTime, endTime);
    	renderJSON(map);
	}
}
