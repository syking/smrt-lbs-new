package controllers;

import static models.User.Constant.THEME;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
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
import models.EventType;
import models.Fleet;
import models.Schedule;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import utils.Splitter;
import vo.ComboVO;
import vo.DriverReportPieChartVO;
import vo.DriverReportVO;
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
    public static void driverByDept(Long departmentId){
    	List<Department> deptList = Department.find("select d from Department d where d.id not in (select dt.parent.id from Department dt where dt.parent.id is not null) ").fetch();
    	List<ComboVO> departments = new ArrayList<ComboVO>();
    	if (deptList != null)
    		for (Department d : deptList){
    			departments.add(new ComboVO(d.name, d.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("departments", CommonUtil.getGson().toJson(departments));
    	map.put("departmentId", departmentId);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/dept-driver-grid.html")).render(map));
    }
    
    /**
     * 分司机报表
     * @throws ParseException 
     */
    public static void driverListJsonByDept(Long departmentId, String timeType, String time) throws ParseException{
		
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
    public static void department(){
    	List<Department> deptList = Department.find("select d from Department d where d.id in (select dt.parent.id from Department dt where dt.parent.id is not null) ").fetch();
    	List<ComboVO> departments = new ArrayList<ComboVO>();
    	if (deptList != null)
    		for (Department d : deptList){
    			departments.add(new ComboVO(d.name, d.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("departments", CommonUtil.getGson().toJson(departments));
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/department-grid.html")).render(map));
    }
    
    /**
     * 分部门报表
     * @throws ParseException 
     */
    public static void departmentListJson(Long parentId, String timeType, String time) throws ParseException{
    	// department list
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return;
    	
    	String sql = "";
    	List<Long> params = new ArrayList<Long>(1);
    	if (parentId != null && parentId > 0){
    		sql = "and d.parent.id = ? " ;
    		params.add(parentId);
    	}
    	
    	List<Department> departments = Department.find("select d from Department d where d.id not in (select dt.parent.id from Department dt where dt.parent.id is not null) " + sql, params.toArray()).fetch();
    	if (departments == null)
    		return ;
    	
    	List<Map> columns = new ArrayList<Map>(eventTypes.size()+2);
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"name", "Name"}));
    	List<Map> datas = new ArrayList<Map>(departments.size());
    	
    	for (EventType et : eventTypes){
    		Map column = new HashMap();
		
    		column.put("field", et.techName);
    		column.put("title", CommonUtil.upperFirst(et.name));
    		
    		columns.add(column);
    	}
    	
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"total", "Total"}));
    	
    	List<Map> series = new ArrayList<Map>();
    	
		List<String> categories = new ArrayList<String>(departments.size());
		Map<String, List<Long>> typeMap = new HashMap<String, List<Long>>();
		
    	for (Department dept : departments){
    		
    		Map data = new HashMap();
    		data.put("id", dept.id);
    		long total = 0;
    		for (Map col : columns){
    			if ("name".equals(col.get("field"))){
    				data.put("name", dept.name);
    				continue;
    			}
    			if ("total".equals(col.get("field"))){
    				data.put("total", 0);
    				continue;
    			}
    			
    			long count = 0;
    			String _field = new Splitter(String.valueOf(col.get("field"))).by("_").connect("-").split().toString();
    			
    			String _sql = "";
    			List<Object> _params = new ArrayList<Object>(3);
    			_params.add(_field);
    			_params.add(dept.id);
    			
    			if (timeType  != null && !timeType.isEmpty() && time != null && !time.isEmpty()){
    				Date start = null;
    	    		Date end = null;
    				if (DriverReport.TIME_TYPE.DAILY.equals(timeType)){
    					start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					end = CommonUtil.addDate(start, 1); // 往后一天
    				}else if (DriverReport.TIME_TYPE.WEEKLY.equals(timeType)){
    					Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					Calendar cal = Calendar.getInstance();
    					cal.setTime(_choose);
    					int day = cal.get(Calendar.DAY_OF_WEEK);
    					start = CommonUtil.addDate(_choose, -day+1);
    					end = CommonUtil.addDate(start, 7);
    					
    				}else if (DriverReport.TIME_TYPE.MONTHLY.equals(timeType)){
    					start = new SimpleDateFormat("yyyy/MM").parse(time);
    					end = CommonUtil.addMonth(start, 1); // 往后一个月
    				}else if (DriverReport.TIME_TYPE.YEARLY.equals(timeType)) {
    					start = new SimpleDateFormat("yyyy").parse(time);
    					end = CommonUtil.addYear(start, 1); //往后一年
    				}
    				
    	    		_sql = " and er.time >= ? and er.time < ? " ;
    	    		
    	    		_params.add(start);
    	    		_params.add(end);
    	    	}
    			
    			System.out.println(_sql + " | " + _params);
    			
        		count = Event.count("select count(e) from Event e left join e.eventRecord er where er.type.techName = ? and e.department.id = ? " + _sql, _params.toArray());
        		
        		String field = new Splitter(String.valueOf(col.get("field"))).by("-").connect("_").split().toString();
        		
        		col.put("field", field);
        		data.put(field, count);
        	
        		if (!typeMap.containsKey(field))
        			typeMap.put(field, new ArrayList<Long>());
        		
        		typeMap.get(field).add(count);
        		
        		total += count;
    		}
    		
    		data.put("total", total);
    		categories.add(dept.name);
    		
    		datas.add(data);
    	}
    	
    	for (String key : typeMap.keySet()){
			Map ser = new HashMap();
			ser.put("name", key);
			ser.put("data", typeMap.get(key));
			series.add(ser);
		}
    	
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", columns);
		
		map.put("series", series);
		map.put("categories", categories);
		
    	renderJSON(map);
    }
    
    /**
     * 司机报表Grid
     */
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
     * 分司机报表
     * @throws ParseException 
     */
    public static void driverListJsonByFleet(Long fleetId, String timeType, String time) throws ParseException{
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
     * @throws ParseException 
     */
    public static void fleetListJson(Long parentId, String timeType, String time) throws ParseException{
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return;
    	
    	List<Fleet> fleets = null;
    	String sql = "";
    	List<Long> params = new ArrayList<Long>(1);
    	if (parentId != null && parentId > 0){
    		sql = "and f.parent.id = ? " ;
    		params.add(parentId);
    		
    		fleets = Fleet.find("select f from Fleet f where f.id not in (select fl.parent.id from Fleet fl where fl.parent.id is not null) " + sql, params.toArray()).fetch();
    	}else{
    		fleets = Fleet.findAll();
    	}
    	
    	if (fleets == null)
    		return ;
    	
    	List<Map> columns = new ArrayList<Map>(eventTypes.size()+2);
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"name", "Name"}));
    	List<Map> datas = new ArrayList<Map>(fleets.size());
    	
    	for (EventType et : eventTypes){
    		Map column = new HashMap();
    		column.put("field", et.techName);
    		column.put("title", CommonUtil.upperFirst(et.name));
    		
    		columns.add(column);
    	}
    	
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"total", "Total"}));
    	
    	List<Map> series = new ArrayList<Map>();
    	
		List<String> categories = new ArrayList<String>(fleets.size());
		Map<String, List<Long>> typeMap = new HashMap<String, List<Long>>();
    	for (Fleet f : fleets){
    		Map data = new HashMap();
    		data.put("id", f.id);
    		long total = 0;
    		for (Map col : columns){
    			if ("name".equals(col.get("field"))){
    				data.put("name", f.name);
    				continue;
    			}
    			if ("total".equals(col.get("field"))){
    				data.put("total", 0);
    				continue;
    			}
    			
    			long count = 0;
    			String _field = new Splitter(String.valueOf(col.get("field"))).by("_").connect("-").split().toString();
    			
    			String _sql = "";
    			List<Object> _params = new ArrayList<Object>(3);
    			_params.add(_field);
    			_params.add(f.id);
    			
    			if (timeType  != null && !timeType.isEmpty() && time != null && !time.isEmpty()){
    				Date start = null;
    	    		Date end = null;
    				if (DriverReport.TIME_TYPE.DAILY.equals(timeType)){
    					start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					end = CommonUtil.addDate(start, 1); // 往后一天
    				}else if (DriverReport.TIME_TYPE.WEEKLY.equals(timeType)){
    					Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					Calendar cal = Calendar.getInstance();
    					cal.setTime(_choose);
    					int day = cal.get(Calendar.DAY_OF_WEEK);
    					start = CommonUtil.addDate(_choose, -day+1);
    					end = CommonUtil.addDate(start, 7);
    					
    				}else if (DriverReport.TIME_TYPE.MONTHLY.equals(timeType)){
    					start = new SimpleDateFormat("yyyy/MM").parse(time);
    					end = CommonUtil.addMonth(start, 1); // 往后一个月
    				}else if (DriverReport.TIME_TYPE.YEARLY.equals(timeType)) {
    					start = new SimpleDateFormat("yyyy").parse(time);
    					end = CommonUtil.addYear(start, 1); //往后一年
    				}
    				
    	    		_sql = " and er.time >= ? and er.time < ? " ;
    	    		
    	    		_params.add(start);
    	    		_params.add(end);
    	    	}
    			
        		count = Event.count("select count(e) from Event e left join e.eventRecord er where er.type.techName = ? and e.fleet.id = ? " + _sql, _params.toArray());
        		
        		String field = new Splitter(String.valueOf(col.get("field"))).by("-").connect("_").split().toString();
        		
        		col.put("field", field);
        		data.put(field, count);
        	
        		if (!typeMap.containsKey(field))
        			typeMap.put(field, new ArrayList<Long>());
        		
        		typeMap.get(field).add(count);
        		
        		total += count;
    		}
    		
    		data.put("total", total);
    		categories.add(f.name);
    		
    		datas.add(data);
    	}
    	
    	for (String key : typeMap.keySet()){
			Map ser = new HashMap();
			ser.put("name", key);
			ser.put("data", typeMap.get(key));
			series.add(ser);
		}
    	
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", columns);
		
		map.put("series", series);
		map.put("categories", categories);
		
    	renderJSON(map);
    }
    
    /**
     * line 司机报表Grid
     */
    public static void driverByLine(String line){
    	List<String> lineList = Schedule.getAllServiceNumber();
    	
    	List<ComboVO> lines = new ArrayList<ComboVO>();
    	if (lines != null)
    		for (String l : lineList){
    			lines.add(new ComboVO(l, l));
    		}
    	
    	
    	Map map = new HashMap();
    	map.put("lines", CommonUtil.getGson().toJson(lines));
    	map.put("line", line);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/line-driver-grid.html")).render(map));
    }
    
    /**
     * line 分司机报表
     * @throws ParseException 
     */
    public static void driverListJsonByLine(String line, String timeType, String time) throws ParseException{
		
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
     * line  路线报表 Grid
     */
    public static void line(){
    	
    	List<String> lineList = Schedule.getAllServiceNumber();
    	
    	List<ComboVO> lines = new ArrayList<ComboVO>();
    	if (lines != null)
    		for (String l : lineList){
    			lines.add(new ComboVO(l, l));
    		}
    	
    	Map map = new HashMap();
    	map.put("lines", CommonUtil.getGson().toJson(lines));
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/line-grid.html")).render(map));
    }
    
    /**
     * line 路线 报表
     * @throws ParseException 
     */
    public static void lineListJson(String line, String timeType, String time) throws ParseException{
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return;
    	
    	List<String> lineList = Schedule.getAllServiceNumber();
    	if (lineList == null || lineList.size() == 0){
    		if (line == null)
    			return ;
    		
    		lineList = Arrays.asList(line);
    	}else if (line != null && line.trim().length() > 0 && !line.equals("all")){
    		lineList = Arrays.asList(line);
    	}
    	
    	List<Map> columns = new ArrayList<Map>(eventTypes.size()+2);
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"name", "Name"}));
    	List<Map> datas = new ArrayList<Map>(lineList.size());
    	
    	for (EventType et : eventTypes){
    		Map column = new HashMap();
		
    		column.put("field", et.techName);
    		column.put("title", CommonUtil.upperFirst(et.name));
    		
    		columns.add(column);
    	}
    	
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"total", "Total"}));
    	
    	List<Map> series = new ArrayList<Map>();
    	
		List<String> categories = new ArrayList<String>(lineList.size());
		Map<String, List<Long>> typeMap = new HashMap<String, List<Long>>();
		
    	for (String l : lineList){
    		
    		Map data = new HashMap();
    		data.put("id", l);
    		long total = 0;
    		for (Map col : columns){
    			if ("name".equals(col.get("field"))){
    				data.put("name", l);
    				continue;
    			}
    			if ("total".equals(col.get("field"))){
    				data.put("total", 0);
    				continue;
    			}
    			
    			long count = 0;
    			String _field = new Splitter(String.valueOf(col.get("field"))).by("_").connect("-").split().toString();
    			
    			String _sql = "";
    			List<Object> _params = new ArrayList<Object>(3);
    			_params.add(_field);
    			_params.add(l);
    			
    			if (timeType  != null && !timeType.isEmpty() && time != null && !time.isEmpty()){
    				Date start = null;
    	    		Date end = null;
    				if (DriverReport.TIME_TYPE.DAILY.equals(timeType)){
    					start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					end = CommonUtil.addDate(start, 1); // 往后一天
    				}else if (DriverReport.TIME_TYPE.WEEKLY.equals(timeType)){
    					Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					Calendar cal = Calendar.getInstance();
    					cal.setTime(_choose);
    					int day = cal.get(Calendar.DAY_OF_WEEK);
    					start = CommonUtil.addDate(_choose, -day+1);
    					end = CommonUtil.addDate(start, 7);
    					
    				}else if (DriverReport.TIME_TYPE.MONTHLY.equals(timeType)){
    					start = new SimpleDateFormat("yyyy/MM").parse(time);
    					end = CommonUtil.addMonth(start, 1); // 往后一个月
    				}else if (DriverReport.TIME_TYPE.YEARLY.equals(timeType)) {
    					start = new SimpleDateFormat("yyyy").parse(time);
    					end = CommonUtil.addYear(start, 1); //往后一年
    				}
    				
    	    		_sql = " and er.time >= ? and er.time < ? " ;
    	    		
    	    		_params.add(start);
    	    		_params.add(end);
    	    	}
    			
        		count = Event.count("select count(e) from Event e left join e.eventRecord er where er.type.techName = ? and e.serviceNumber = ? " + _sql, _params.toArray());
        		
        		String field = new Splitter(String.valueOf(col.get("field"))).by("-").connect("_").split().toString();
        		
        		col.put("field", field);
        		data.put(field, count);
        	
        		if (!typeMap.containsKey(field))
        			typeMap.put(field, new ArrayList<Long>());
        		
        		typeMap.get(field).add(count);
        		
        		total += count;
    		}
    		
    		data.put("total", total);
    		categories.add(l);
    		
    		datas.add(data);
    	}
    	
    	for (String key : typeMap.keySet()){
			Map ser = new HashMap();
			ser.put("name", key);
			ser.put("data", typeMap.get(key));
			series.add(ser);
		}
    	
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", columns);
		
		map.put("series", series);
		map.put("categories", categories);
		
    	renderJSON(map);
    }

    public static void driverJson() throws ParseException {
		List<Event> events = Event.findAll();
		List<DriverReportVO> drVOs = new ArrayList<DriverReportVO>();

		for (Event event : events)
			drVOs.add(new DriverReportVO().init(event));

		renderJSON(drVOs);
	}

	public static void getCount() {
		List<Event> events = Event.findAll();
		List<DriverReportPieChartVO> pieChart = pieChartVO(events);
		renderJSON(pieChart);
	}

	public static void searchDriver(long driverId, String timeType, String time) throws ParseException {
		if (driverId == 0)
			return;

		List<DriverReportVO> drVOs = new ArrayList<DriverReportVO>();
		List<DriverReportPieChartVO> pieCharts = new ArrayList<DriverReportPieChartVO>();
		Driver driver = Driver.find("id = ?", driverId).first();

		if (driver == null)
			return;

		Date start = null;
		Date end = null;

		List<Object> params = new ArrayList<Object>();
		params.add(driver);
		String _sql = "";
		if (timeType != null && !timeType.isEmpty() && time != null && !time.isEmpty()){
			if (DriverReport.TIME_TYPE.DAILY.equals(timeType)) {
				start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
				end = CommonUtil.addDate(start, 1);
			} else if (DriverReport.TIME_TYPE.WEEKLY.equals(timeType)) {
				Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
				Calendar cal = Calendar.getInstance();
				cal.setTime(_choose);
				int day = cal.get(Calendar.DAY_OF_WEEK);
				start = CommonUtil.addDate(_choose, -day + 1);
				end = CommonUtil.addDate(start, 7);
			} else if (DriverReport.TIME_TYPE.MONTHLY.equals(timeType)) {
				start = new SimpleDateFormat("yyyy/MM").parse(time);
				end = CommonUtil.addMonth(start, 1);
			} else if (DriverReport.TIME_TYPE.YEARLY.equals(timeType)) {
				start = new SimpleDateFormat("yyyy").parse(time);
				end = CommonUtil.addYear(start, 1);
			}
			_sql = " and er.time >= ? and er.time < ? " ;
			params.add(start);
			params.add(end);
		}
		
		Object[] p = params.toArray();
		List<Event> events = Event.find("select e from Event e left join e.eventRecord er where e.driver = ? " + _sql, p).fetch();
		
		List<DriverReportPieChartVO> pieChart = pieChartVO(events);
		for (Event event : events) {
			drVOs.add(new DriverReportVO().init(event));
		}
		
		pieCharts.addAll(pieChart);

		Map map = new HashMap();
		map.put("grid", drVOs);
		map.put("chart", pieCharts);

		renderJSON(map);
	}

	public static void driver(String id, String driverId) {
		final String preUrl = "/Reports/";
		
		List<Driver> drList = Driver.findAll();
		List<ComboVO> drivers = new ArrayList<ComboVO>();
		if (drList != null)
			for (Driver dr : drList) 
				drivers.add(new ComboVO(dr.name, dr.id));
			
		Grid grid = new Grid();
		grid.tabId = id;
		grid.readUrl = preUrl + "driverJson";
		grid.searchUrl = preUrl + "searchDriver";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(DriverReportVO.class, "id", "driverName"));
		
		Map map = new HashMap();
		map.put("grid", grid);
		map.put("drivers", CommonUtil.getGson().toJson(drivers));
		map.put("driverId", driverId);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Reports/driver-grid.html")).render(map));
	}

	public static List<DriverReportPieChartVO> pieChartVO(List<Event> events) {
		Map<String, Integer> map = eventCount(events);
		List<DriverReportPieChartVO> pieChartVOs = new ArrayList<DriverReportPieChartVO>();
		DriverReportPieChartVO pieChartVO = null;

		String key = "";
		Iterator interator = map.keySet().iterator();
		
		while (interator.hasNext()) {
			key = interator.next().toString();
			pieChartVO = new DriverReportPieChartVO(key, map.get(key));
			pieChartVOs.add(pieChartVO);
		}
		
		return pieChartVOs;
	}

	public static Map<String, Integer> eventCount(List<Event> events) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < events.size(); i++) {
			list.add(events.get(i).eventRecord.type.techName);
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		for (String str : list) 
			map.put(str, map.get(str) == null ? 1 : map.get(str) + 1);
		
		return map;
	}

}
