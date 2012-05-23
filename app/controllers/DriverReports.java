package controllers;

import static models.User.Constant.THEME;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import vo.DriverReportPieChartVO;
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
		List<DriverReportVO> drVOs = new ArrayList<DriverReportVO>();
		for(DriverReport report : reports){
			drVOs.add(new DriverReportVO().init(report));
			System.out.println(report.event.driver.name);
		}
		renderJSON(drVOs);
	}
	public static void getCount(){
		List<DriverReport> reports = DriverReport.findAll();
		List<DriverReportPieChartVO> pieChart = pieChartVO(reports);
		renderJSON(pieChart);
	}
	public static void search(long driverId, String reportType, String dateStr) throws ParseException{
		if(driverId == 0){
			return;
		}
		String sql = "";
		List<DriverReport> drs = new ArrayList<DriverReport>();
		List<DriverReportVO> drVOs = new ArrayList<DriverReportVO>();
		List<DriverReportPieChartVO> pieCharts = new ArrayList<DriverReportPieChartVO>();
		Driver driver = Driver.find("id = ?", driverId).first();
		if(driver!=null){
			Date start = null;
    		Date end = null;
			List<Event> events = Event.find("byDriver", driver).fetch();
			for(Event event : events){
				StringBuilder builder = new StringBuilder();
				List<Object> params = new ArrayList<Object>();
				if(event != null){
					builder.append("event = ?").append(" And ");
					params.add(event);
				}
				if ("daily".equals(reportType)){
					start = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
					end = CommonUtil.addDate(start, 1);
					builder.append("time >= ? And time < ? ");
					params.add(start);
					params.add(end);
				}else if ("weekly".equals(reportType)){
					Date _choose = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
					Calendar cal = Calendar.getInstance();
					cal.setTime(_choose);
					int day = cal.get(Calendar.DAY_OF_WEEK);
					start = CommonUtil.addDate(_choose, -day+1);
					end = CommonUtil.addDate(start, 7);
					builder.append("time >= ? And time < ? ");
					params.add(start);
					params.add(end);
				}else if ("monthly".equals(reportType)){
					start = new SimpleDateFormat("yyyy-MM").parse(dateStr);
					end = CommonUtil.addMonth(start, 1); 
					builder.append("time >= ? And time < ? ");
					params.add(start);
					params.add(end);
				}else if ("yearly".equals(reportType)) {
					start = new SimpleDateFormat("yyyy").parse(dateStr);
					end = CommonUtil.addYear(start, 1); 
					builder.append("time >= ? And time < ? ");
					params.add(start);
					params.add(end);
				}
				if(!builder.toString().equals("")&&!builder.toString().endsWith("And ")){
					System.out.println("---------------------->");
					sql = builder.toString();
				}else{
					sql = (String) builder.toString().subSequence(0, builder.toString().length()-5);
				}
				System.out.println(sql);
				for(int i = 0; i < params.size(); i++){
					System.out.println(params.get(i));
				}
				Object[] p = params.toArray();
				List<DriverReport> reports = DriverReport.find(sql, p).fetch();
				List<DriverReportPieChartVO> pieChart = pieChartVO(reports);
				for(DriverReport report : reports){
					drVOs.add(new DriverReportVO().init(report));
					drs.add(report);
				}
				pieCharts.addAll(pieChart);
			}
		}
		Map map = new HashMap();
		map.put("grid", drVOs);
		map.put("chart", pieCharts);
		renderJSON(map);
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
	
	public static List<DriverReportPieChartVO> pieChartVO(List<DriverReport> reports){
		Map<String, Integer> map = eventCount(reports);
		List<DriverReportPieChartVO> pieChartVOs = new ArrayList<DriverReportPieChartVO>();
		DriverReportPieChartVO pieChartVO = null;
		
		String key = "";
		Iterator interator = map.keySet().iterator();
		while(interator.hasNext()){
			key = interator.next().toString();
			pieChartVO = new DriverReportPieChartVO(key, map.get(key));
			pieChartVOs.add(pieChartVO);
		}
		return pieChartVOs;
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













