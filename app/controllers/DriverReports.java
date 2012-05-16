package controllers;

import static models.User.Constant.THEME;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import models.Counselling;
import models.Driver;
import models.DriverReport;
import models.Event;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.CounselVO;
import vo.DriverEventVO;
import vo.DriverReportVO;
import vo.Grid;
@With(Interceptor.class)
public class DriverReports extends Controller{
	public static final String DEFAULT_TYPE = "daily";
	public static final Date DEFAULT_DATE = new Date();
	public static final long DEFAULT_DRIVER_ID = 2;
	
	public static void read() throws ParseException{ 
		long driverId = DEFAULT_DRIVER_ID;
		Driver driver = Driver.find("id = ?", driverId).first();
		List<Event> events = Event.find("byDriver", driver).fetch();
		List<DriverReport> reports = DriverReport.findAll();
//		for(Event event : events){
//			DriverReport report = DriverReport.find("byEvent", event).first();
//			if(report==null){
//				continue;
//			}
//			reports.add(report);
//		}
		List<DriverReportVO> drVOs = new ArrayList<DriverReportVO>();
		for(DriverReport report : reports){
			drVOs.add(new DriverReportVO().init(report));
		}
		Map<String, Integer> map = eventCount(reports);
		//renderJSON(map);
		renderJSON(drVOs);
	}
	public static void getCount(){
//		System.out.println("driver Id:  "+driverId);
//		Driver driver = Driver.find("id = ?", driverId).first();
//		List<Event> events = Event.find("byDriver", driver).fetch();
		List<DriverReport> reports = DriverReport.findAll();
		System.out.println("---------------> "+reports.size());
		Map<String, Integer> map = eventCount(reports);
		Iterator iterator = map.keySet().iterator();
		List<DriverEventVO> counts = new ArrayList<DriverEventVO>();
		while(iterator.hasNext()){
			String next = iterator.next().toString();
			DriverEventVO count = new DriverEventVO(next, map.get(next));
			counts.add(count);
		}
		renderJSON(map);
	}
	public static void search(long driverId, String type, String dateStr) throws ParseException{
		List<Object> params = new ArrayList<Object>();
		if(driverId!=0){
			params.add(driverId);
		}
		if(!type.equals("")){
			params.add(type);
		}else{
			params.add(DEFAULT_TYPE);
		}
		Date date = null;
		if(dateStr.equals("")){
			date = DEFAULT_DATE;
			params.add(date);
		}else{
			date = Counsellings.dateConvertor(dateStr);
			params.add(date);
		}
		String sql = !type.equals("")?formQuery(driverId, type, date) 
				: formQuery(driverId, DEFAULT_TYPE, date);
		
		List<DriverReport> reports = DriverReport.find(sql, params).fetch();
		List<DriverReportVO> drVOs = new ArrayList<DriverReportVO>();
		for(DriverReport report : reports){
			drVOs.add(new DriverReportVO().init(report));
		}
		System.out.println(drVOs.get(0).longitude);
		renderJSON(drVOs);
	}
	
	public static String formQuery(long driverId, String type, Date date){
		String sql = "";
		Driver driver = Driver.find("id = ?", driverId).first();
		StringBuilder builder = new StringBuilder();
		if(driver!=null){
			builder.append("id = ?").append(" And ");
		}
		if(type.equals("weekly")){
			builder.append("DATE_SUB(CURDATE(), INTERVAL 7 DAY) <= ?").append(" And ");
		}else if(type.equals("daily")){
			builder.append("date = ?").append(" And ");
		}else if(type.equals("monthly")){
			builder.append("DATE_SUB(CURDATE(), INTERVAL INTERVAL 1 MONTH) <= ?").append(" And ");
		} 
		if(date==null){
			builder.append("date = ?").append(" And ");
		}
		if(!builder.toString().equals("")){
			sql = builder.toString().substring(0, builder.toString().length()-5);
		}
		return sql;
	}
	
	public static void grid(String id) {
		final String preUrl = "/DriverReports/";
		List<Driver> drList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (drList != null)
    		for (Driver dr : drList){
    			drivers.add(new ComboVO(dr.name, dr.id));
    		}
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "inline";
		grid.columnsJson = CommonUtil.getGson().toJson(
				CommonUtil.assemColumns(DriverReportVO.class, "id", "driverName"));
		map.put("grid", grid);
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Drivers/report.html")).render(map));
	}
	
	public static Map<String, Integer> eventCount(List<DriverReport> reports){
		List<String> list = new ArrayList<String>(); 
		for(int i = 0; i < reports.size(); i++){
			list.add(reports.get(i).event.eventRecord.type.techName);
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		for(String str :list){ 
		  map.put(str, map.get(str)==null?1:map.get(str)+1); 
		}
		return map;
	}
}













