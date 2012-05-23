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
import java.util.List;
import java.util.Map;
import java.util.Set;

import models.Department;
import models.Driver;
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
    public static void driverListJsonByDept(Long departmentId, String dateType, String time) throws ParseException{
		
		List<Driver> drivers = null;
		if (departmentId == null || departmentId <= 0)
			drivers = Driver.findAll();
		else
			drivers = Driver.find("select d from Driver d where d.department.id = ?", departmentId).fetch();
		
		Map map = Driver.assemReport(drivers, dateType, time);
		
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
    public static void departmentListJson(Long parentId, String dateType, String time) throws ParseException{
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
    			
    			if (dateType  != null && dateType.trim().length() > 0 && time != null && time.trim().length() > 0){
    				Date start = null;
    	    		Date end = null;
    				if ("day".equals(dateType)){
    					start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					end = CommonUtil.addDate(start, 1); // 往后一天
    				}else if ("week".equals(dateType)){
    					Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					Calendar cal = Calendar.getInstance();
    					cal.setTime(_choose);
    					int day = cal.get(Calendar.DAY_OF_WEEK);
    					start = CommonUtil.addDate(_choose, -day+1);
    					end = CommonUtil.addDate(start, 7);
    					
    				}else if ("month".equals(dateType)){
    					start = new SimpleDateFormat("yyyy/MM").parse(time);
    					end = CommonUtil.addMonth(start, 1); // 往后一个月
    				}else if ("year".equals(dateType)) {
    					start = new SimpleDateFormat("yyyy").parse(time);
    					end = CommonUtil.addYear(start, 1); //往后一年
    				}
    				
    	    		_sql = " and er.time >= ? and er.time < ? " ;
    	    		
    	    		_params.add(start);
    	    		_params.add(end);
    	    	}
    			
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
    		categories.add(String.format(" (%s) ", total) + dept.name);
    		
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
    public static void driverListJsonByFleet(Long fleetId, String dateType, String time) throws ParseException{
		if (fleetId == null || fleetId <= 0)
			return ;
		
		List<Schedule> schs = Schedule.find("select s from Schedule s where s.vehicle.id in (select v.id from Vehicle v where v.fleet.id = ?)", fleetId).fetch();
		if (schs == null)
			return ;
		Set<Driver> drivers = new HashSet<Driver>(schs.size());
		for (Schedule s : schs){
			drivers.add(s.driver);
		}
		
		Map map = Driver.assemReport(drivers, dateType, time);
		
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
    public static void fleetListJson(Long parentId, String dateType, String time) throws ParseException{
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return;
    	
    	String sql = "";
    	List<Long> params = new ArrayList<Long>(1);
    	if (parentId != null && parentId > 0){
    		sql = "and f.parent.id = ? " ;
    		params.add(parentId);
    	}
    	
    	List<Fleet> fleets = Fleet.find("select f from Fleet f where f.id not in (select fl.parent.id from Fleet fl where fl.parent.id is not null) " + sql, params.toArray()).fetch();
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
    			
    			if (dateType  != null && dateType.trim().length() > 0 && time != null && time.trim().length() > 0){
    				Date start = null;
    	    		Date end = null;
    				if ("day".equals(dateType)){
    					start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					end = CommonUtil.addDate(start, 1); // 往后一天
    				}else if ("week".equals(dateType)){
    					Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					Calendar cal = Calendar.getInstance();
    					cal.setTime(_choose);
    					int day = cal.get(Calendar.DAY_OF_WEEK);
    					start = CommonUtil.addDate(_choose, -day+1);
    					end = CommonUtil.addDate(start, 7);
    					
    				}else if ("month".equals(dateType)){
    					start = new SimpleDateFormat("yyyy/MM").parse(time);
    					end = CommonUtil.addMonth(start, 1); // 往后一个月
    				}else if ("year".equals(dateType)) {
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
    		categories.add(String.format(" (%s) ", total) + f.name);
    		
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
    public static void driverListJsonByLine(String line, String dateType, String time) throws ParseException{
		if (line == null)
			return ;
		
		List<Schedule> schs = Schedule.find("line = ?", line).fetch();
		if (schs == null)
			return ;
		
		Set<Driver> drivers = new HashSet<Driver>(schs.size());
		for (Schedule s : schs){
			drivers.add(s.driver);
		}
		
		Map map = Driver.assemReport(drivers, dateType, time);
		
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
    public static void lineListJson(String line, String dateType, String time) throws ParseException{
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return;
    	
    	List<String> lineList = Schedule.getAllServiceNumber();
    	if (lineList == null || lineList.size() == 0){
    		if (line == null)
    			return ;
    		
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
    			
    			if (dateType  != null && dateType.trim().length() > 0 && time != null && time.trim().length() > 0){
    				Date start = null;
    	    		Date end = null;
    				if ("day".equals(dateType)){
    					start = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					end = CommonUtil.addDate(start, 1); // 往后一天
    				}else if ("week".equals(dateType)){
    					Date _choose = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					Calendar cal = Calendar.getInstance();
    					cal.setTime(_choose);
    					int day = cal.get(Calendar.DAY_OF_WEEK);
    					start = CommonUtil.addDate(_choose, -day+1);
    					end = CommonUtil.addDate(start, 7);
    					
    				}else if ("month".equals(dateType)){
    					start = new SimpleDateFormat("yyyy/MM").parse(time);
    					end = CommonUtil.addMonth(start, 1); // 往后一个月
    				}else if ("year".equals(dateType)) {
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
    		categories.add(String.format(" (%s) ", total) + l);
    		
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
    

}
