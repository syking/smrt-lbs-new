package controllers;

import static models.User.Constant.THEME;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Department;
import models.Driver;
import models.Event;
import models.EventType;
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
    public static void driver(Long departmentId){
    	List<Department> deptList = Department.find("select d from Department d where d.id not in (select dt.parent.id from Department dt where dt.parent.id is not null) ").fetch();
    	List<ComboVO> departments = new ArrayList<ComboVO>();
    	if (deptList != null)
    		for (Department d : deptList){
    			departments.add(new ComboVO(d.name, d.id));
    		}
    	
    	Map map = new HashMap();
    	map.put("departments", CommonUtil.getGson().toJson(departments));
    	map.put("departmentId", departmentId);
    	
    	renderHtml(TemplateLoader.load(template(renderArgs.get(THEME)+"/Reports/driver-grid.html")).render(map));
    }
    
    /**
     * 分司机报表
     * @throws ParseException 
     */
    public static void driverListJson(Long departmentId, String dateType, String time) throws ParseException{
    	// department list
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return;
    	
		if (departmentId == null || departmentId <= 0)
			return ;
		
		List<Driver> drivers = Driver.find("select d from Driver d where d.department.id = ?", departmentId).fetch();
		
		if (drivers == null || drivers.size() == 0)
			return ;
		
    	List<Map> columns = new ArrayList<Map>(eventTypes.size() + 2);
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"name", "Name"}));
    	List<Map> datas = new ArrayList<Map>(drivers.size());
    	
    	for (EventType et : eventTypes){
    		Map column = new HashMap();
		
    		column.put("field", et.techName);
    		column.put("title", CommonUtil.upperFirst(et.name));
    		
    		columns.add(column);
    	}
    	
    	columns.add(CommonUtil.map(new String[]{"field", "title"}, new String[]{"total", "Total"}));
    	
    	List<Map> series = new ArrayList<Map>();
    	
		List<String> categories = new ArrayList<String>(drivers.size());
		Map<String, List<Long>> typeMap = new HashMap<String, List<Long>>();
		
		for (Driver driver : drivers){
    		Map data = new HashMap();
    		data.put("id", driver.id);
    		
    		long total = 0;
    		for (Map col : columns){
    			if ("name".equals(col.get("field"))){
    				data.put("name", driver.name);
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
    			_params.add(driver.id);
    			
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
    			
        		count = Event.count("select count(e) from Event e left join e.eventRecord er where er.type.techName = ? and e.driver.id = ? " + _sql, _params.toArray());
        		
        		String field = new Splitter(String.valueOf(col.get("field"))).by("-").connect("_").split().toString();
        		
        		col.put("field", field);
        		data.put(field, count);
        	
        		if (!typeMap.containsKey(field))
        			typeMap.put(field, new ArrayList<Long>());
        		
        		typeMap.get(field).add(count);
        		
        		total += count;
    		}
    		
    		data.put("total", total);
    		categories.add(String.format(" (%s) ", total) + driver.name);
    		
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
    
    public static void viewEventOnMapByDept(String departId){
    	render(renderArgs.get(THEME)+"/Reports/event_view_on_map.html");
    }

}
