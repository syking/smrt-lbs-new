package models;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.ChartSerie;
import vo.ComboVO;
import vo.DriverPerformanceVO;
import vo.DriverVO;
import vo.EventReportVO;
import vo.EventTypeReportVO;
import vo.ScheduleVO;
import vo.TreeView;
import vo.VehicleVO;

/**
 * 司机信息
 *
 */
/**
 * @author weiwei
 *
 */
@Entity
@Table(name="t_driver")
public class Driver extends Model{
	public Driver(){}
	
    public Driver(String number, String name, String description){
        this.number = number;
        this.name = name;
        this.description = description;
    }
    
	@Column(unique = true)
	public String number;
	public String name;
	public String email;
	public String description;
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Department department;
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Fleet fleet;// 车队
	
	@Transient
	public final static String iconUrl = "../../public/images/wheel.png";

	public static List<TreeView> assemTreeView(){
		List<TreeView> result = new ArrayList<TreeView>();
		List<Driver> drivers = Driver.findAll();
		if (drivers == null)
			return result;
		
		TreeView root = new TreeView("", "All Drivers", Driver.iconUrl);
		for (Driver d : drivers){
			TreeView tv = new TreeView(String.valueOf(d.id), d.name, Driver.iconUrl);
			tv.items = null;
			root.items.add(tv);
		} 
		
		root.expanded = true;
		result.add(root);
		
		return result;
	}
	
    public static List<Driver> filter(List<String> criteria, List<Object> params) {
		Object[] p = params.toArray();
		String query = StringUtils.join(criteria, " AND ");
		
		return Driver.find(query, p).fetch();
	}
    
    public static Map queryReport(int page, int pageSize, Long driverId, String timeType, String startTime, String endTime){
    	List<EventReportVO> datas = new ArrayList<EventReportVO>();
    	
    	List<Driver> drivers = null;
    	Driver driver = Driver.findById(driverId);
    	if (driver != null){
    		drivers = new ArrayList<Driver>(1);
    		drivers.add(driver);
    	}
    	
		List<DriverReport> drs = DriverReport.findByDriver(page, pageSize, driver, timeType, startTime, endTime);
		if (drs != null && !drs.isEmpty()){
			for (DriverReport dr : drs){
				EventReportVO drVO = new EventReportVO(dr);
				datas.add(drVO);
			}
		}
		
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "department","fleet","route", "id"));
		map.put("total", DriverReport.countByCondition(driver, timeType, startTime, endTime));
		
    	return map;
    }
    
    public static Map assemReport(Collection<Driver> drivers, String timeType, String time){
    	//---------------chart----------------------------
    	List<EventReportVO> datas = new ArrayList<EventReportVO>();
		List<String> categories = new ArrayList<String>(drivers.size());
		ChartSerie serie = new ChartSerie();
		//------------------------------------------------
		
		for (Driver driver : drivers){
			final String name = driver.name;
			List<DriverReport> drs = DriverReport.findByDriver(driver, timeType, time);
			if (drs == null || drs.isEmpty())
				continue;
			
			//--------char-------------
			EventReportVO drVO = new EventReportVO(drs);
			categories.add(name);
			serie.assemDriverReportData(drVO);
			datas.add(drVO);
    	}
		
		List<Map> series = serie.generateChartSeries();
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "department","fleet","route", "id"));
		
		map.put("series", series);
		map.put("categories", categories);
		
		return map;
    }
    
    /**
	 * unit of time -> second
	 * @param driverNumber
	 * @return
	 */
	public static long calculateDrivingTime(String driverNumber, final Date start, final Date end){
		long count = 0;
		List<Schedule> schs = Schedule.findByDriverNumber(driverNumber);
		if (schs == null || schs.isEmpty())
			return 0;
		
		for (Schedule s : schs){
			if (start.after(s.endTime) || end.before(s.startTime))
				continue;
			
			if (start.after(s.startTime))
				s.startTime = start;
			
			if (end.before(s.endTime))
				s.endTime = end;
			
			long time = CommonUtil.difference(s.endTime, s.startTime) / 1000;
			count += time;
		}
		
		return count;
	}

	@Override
	public String toString() {
		return "Driver [number=" + number + ", name=" + name + ", description="
				+ description + "]";
	}

	/**
	 * 计算得分
	 * @param drs
	 * @return
	 */
	public static long calculateScore(Collection<DriverReport> drs){
		long reduceTotal = 0;
		for (DriverReport dr : drs){
			reduceTotal += dr.reduceScore();
		}
		
		return 100 - reduceTotal;
	}

	public static boolean deleteByJson(String models) {
		List<DriverVO> vos = CommonUtil.parseArray(models, DriverVO.class);
		if (vos == null)
			return false;
		
		for (DriverVO vo : vos){
			if (vo.id == null)
				continue;
			
			Driver obj = Driver.findById(Long.parseLong(vo.id));
			if (obj == null)
				continue;
			
			obj.delete();
		}
		
		return true;
	}

	public static String createByJson(String models) {
		List<DriverVO> vos = CommonUtil.parseArray(models, DriverVO.class);
		if (vos == null)
			return models;
		
		for (DriverVO vo : vos){
			vo.validate();
			
			Driver obj = new Driver();
			obj.number = vo.number;
			obj.name = vo.name;
			obj.description = vo.description;
			obj.email = vo.email;
			obj.create();
			vo.id = String.valueOf(obj.id);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}

	public static boolean updateByJson(String models) {
		List<DriverVO> vos = CommonUtil.parseArray(models, DriverVO.class);
		if (vos == null)
			return false;
		
		for (DriverVO vo : vos){
			vo.validate();
			
			if (vo.id == null)
				continue;
			
			Driver obj = Driver.findById(Long.parseLong(vo.id));
			if (obj == null)
				continue;
			
			obj.number = vo.number;
			obj.name = vo.name;
			obj.description = vo.description;
			obj.email = vo.email;
			
			obj.save();
		}
		
		return true;
	}

	public static List<ComboVO> assemComboVO() {
		return assemComboVO(null);
	}
	public static List<ComboVO> assemComboVO(List<Driver> driverList) {
		List<ComboVO> result = new ArrayList<ComboVO>();
		if (driverList == null)
			driverList = findAll();
		
		if (driverList != null)
    		for (Driver d : driverList){
    			result.add(new ComboVO(d.number, d.number));
    		}
		
		return result;
	}

	public static Driver findByNumber(String driverNumber) {
		return Driver.find("byNumber", driverNumber).first();
	}

	public static Map search(String number, String name, String description) {
		List<Driver> drivers = Driver.findByCondition(number, name, description);
		List<DriverVO> vos = Driver.assemDriverVO(drivers);
		Map data = CommonUtil.assemGridData(vos, "id");
		return data;
	}

	public static List<DriverVO> assemDriverVO(List<Driver> drivers) {
		if (drivers == null)
			return null;
		
		List<DriverVO> vos = new ArrayList<DriverVO>(drivers.size());
		for (Driver d : drivers){
			DriverVO vo = new DriverVO().init(d);
			vos.add(vo);
		}
		
		return vos;
	}

	public static List<Driver> findByCondition(String number, String name, String description) {
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		if (number != null && number.length() > 0) {
			sqlSB.append("number like ?");
			params.add("%" + number + "%");
		}

		if (name != null && name.length() > 0) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("name like ?");
			params.add("%" + name + "%");
		}
		
		if (description != null && description.length() > 0) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("description like ?");
			params.add("%" + description + "%");
		}

		List<Driver> drivers = null;
		if (sqlSB.length() > 0 && !params.isEmpty())
			drivers = Driver.find(sqlSB.toString(), params.toArray()).fetch();
		else
			drivers = Driver.findAll();
		
		return drivers;
	}
	
	public Map generatePerformanceReport(String timeType, String time){
		Date[] dates = CommonUtil.getStartAndEndDate(timeType, time);
		Date start = dates[0];
		Date end = dates[1];
		
		List<DriverReport> drs = DriverReport.findByDriver(this, timeType, time);
		DriverPerformanceVO performance = new DriverPerformanceVO(this, timeType, start, end, drs);
		Map map = new HashMap();
		map.put("performance", performance);
		map.put("columns", CommonUtil.assemColumns(DriverPerformanceVO.class, "id"));
		
		List<EventTypeReportVO> etrVOs = DriverReport.generateDriverEventPerformance(this, timeType, time);
		Map events = new HashMap();
		events.put("data", etrVOs);
		events.put("columns", CommonUtil.assemColumns(EventTypeReportVO.class, "id"));
		
		map.put("events", events);
		
		return map;
	}

	public static Driver findByName(String name) {
		return Driver.find("byName", name).first();
	}
	
}
