package controllers;

import static models.User.Constant.THEME;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import models.Driver;
import models.Event;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.DriverReportPieChartVO;
import vo.DriverReportVO;
import vo.Grid;

@With(Interceptor.class)
public class DriverReports extends Controller {

	public static final String DEFAULT_TYPE = "daily";
	public static final Date DEFAULT_DATE = new Date();
	public static final long DEFAULT_DRIVER_ID = 2;

	public static void read() throws ParseException {
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

	public static void search(long driverId, String reportType, String dateStr) throws ParseException {
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
		if (reportType != null && reportType.trim().length() > 0){
			if ("daily".equals(reportType)) {
				start = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
				end = CommonUtil.addDate(start, 1);
			} else if ("weekly".equals(reportType)) {
				Date _choose = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
				Calendar cal = Calendar.getInstance();
				cal.setTime(_choose);
				int day = cal.get(Calendar.DAY_OF_WEEK);
				start = CommonUtil.addDate(_choose, -day + 1);
				end = CommonUtil.addDate(start, 7);
			} else if ("monthly".equals(reportType)) {
				start = new SimpleDateFormat("yyyy-MM").parse(dateStr);
				end = CommonUtil.addMonth(start, 1);
			} else if ("yearly".equals(reportType)) {
				start = new SimpleDateFormat("yyyy").parse(dateStr);
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

	public static void grid(String id, String driverId) {
		final String preUrl = "/DriverReports/";
		
		List<Driver> drList = Driver.findAll();
		List<ComboVO> drivers = new ArrayList<ComboVO>();
		if (drList != null)
			for (Driver dr : drList) 
				drivers.add(new ComboVO(dr.name, dr.id));
			
		Grid grid = new Grid();
		grid.tabId = id;
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "inline";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(DriverReportVO.class, "id", "driverName"));
		
		Map map = new HashMap();
		map.put("grid", grid);
		map.put("drivers", CommonUtil.getGson().toJson(drivers));
		map.put("driverId", driverId);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Drivers/report.html")).render(map));
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
