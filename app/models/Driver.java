package models;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	@Column(unique = true)
	public String name;
	public String email;
	public String description;
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Department department;
	
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

	public static void deleteById(Long id) {
		Driver obj = Driver.fetchById(id);
		try {
			obj.delete();
		} catch (Throwable e) {
			throw new RuntimeException("Could not Delete This Driver Cause It is Assigned to Department or Fleet !");
		}
	}
	
	public static boolean deleteByJson(String models) {
		List<DriverVO> vos = CommonUtil.parseArray(models, DriverVO.class);
		if (vos == null)
			throw new RuntimeException("Could not Parse the Json Content!");
		
		for (DriverVO vo : vos){
			deleteById(vo.id);
		}
		
		return true;
	}

	public static DriverVO createByVO(DriverVO vo) {
		if (vo == null)
			throw new RuntimeException("Driver info required");
		
		vo.validate();
		
		Driver obj = new Driver();
		obj.number = vo.number;
		obj.name = vo.name;
		obj.description = vo.description;
		obj.email = vo.email;
		
		obj.department = Department.findByName(vo.department);
		if (!CommonUtil.isBlank(vo.department) && obj.department == null)
			throw new RuntimeException("Department Name is invalid");
		
		Driver db_driver = Driver.findByName(obj.name);
		if (db_driver != null)
			throw new RuntimeException("Name duplicate!");
		
		Driver db_driver2 = Driver.findByNumber(obj.number);
		if (db_driver2 != null)
			throw new RuntimeException("Number duplicate!");
		
		obj.create();
		vo.id = obj.id;
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<DriverVO> vos = CommonUtil.parseArray(models, DriverVO.class);
		if (vos == null)
			throw new RuntimeException("Could not Parse the Json Content!");
		
		for (DriverVO vo : vos){
			vo = createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}

	public static void updateByVO(DriverVO vo) {
		if (vo == null)
			throw new RuntimeException("Driver info required");
		
		if (vo.id == null)
			throw new RuntimeException("id required");
		
		vo.validate();
		
		Driver obj = Driver.findById(vo.id);
		if (obj == null)
			throw new RuntimeException("id is invalid");
		
		obj.number = vo.number;
		obj.name = vo.name;
		obj.description = vo.description;
		obj.email = vo.email;
		
		obj.department = Department.findByName(vo.department);
		if (!CommonUtil.isBlank(vo.department) && obj.department == null)
			throw new RuntimeException("Department Name is invalid");
		
		Driver db_driver = Driver.findByName(obj.name);
		if (db_driver != null && db_driver.id != obj.id)
			throw new RuntimeException("DriverName duplicate!");
		
		Driver db_driver2 = Driver.findByNumber(obj.number);
		if (db_driver2 != null && db_driver2.id != obj.id)
			throw new RuntimeException("DriverNumber duplicate!");
		
		obj.save();
	}
	
	public static boolean updateByJson(String models) {
		List<DriverVO> vos = CommonUtil.parseArray(models, DriverVO.class);
		if (vos == null)
			throw new RuntimeException("Could not Parse the Json Content!");
		
		for (DriverVO vo : vos){
			updateByVO(vo);
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
		if (!CommonUtil.isBlank(driverNumber))
			return Driver.find("byNumber", driverNumber.trim()).first();
		return null;
	}

	public static Map search(int page, int pageSize, DriverVO driver) {
		if (driver == null)
			return search(page, pageSize, null, null, null, null);
		
		return search(page, pageSize, driver.department, driver.number, driver.name, driver.description);
	}
	
	public static Map search(int page, int pageSize, String departmentName, String number, String name, String description) {
		List<Driver> drivers = Driver.findByCondition(page, pageSize, departmentName, number, name, description);
		List<DriverVO> vos = Driver.assemDriverVO(drivers);
		long count = Driver.countByCondition(departmentName, number, name, description);
		Map map = new HashMap();
		map.put("total", count);
		map.put("drivers", vos);
		
		return map;
	}
	
	public static long countByCondition(String departmentName, String number, String name, String description){
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(departmentName, number, name, description, sqlSB, params);
		
		return Driver.count(sqlSB.toString(), params.toArray());
	}
	
	public static Map search(String departmentName, String number, String name, String description) {
		List<Driver> drivers = Driver.findByCondition(-1, -1, departmentName, number, name, description);
		List<DriverVO> vos = Driver.assemDriverVO(drivers);
		Map data = CommonUtil.assemGridData(vos, "id");
		return data;
	}

	public static List<Driver> findByCondition(int page, int pageSize, String departmentName, String number, String name, String description) {
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(departmentName, number, name, description, sqlSB, params);

		List<Driver> drivers = null;
		if (page > 0 && pageSize > 0)
			drivers = Driver.find(sqlSB.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		else
			drivers = Driver.find(sqlSB.toString() + " order by id desc", params.toArray()).fetch();
		
		return drivers;
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

	private static void parseCondition(String departmentName, String number, String name, String description, StringBuilder sqlSB,
			List<Object> params) {
		if (!CommonUtil.isBlank(departmentName)){
			Department dept = Department.findByName(departmentName.trim());
			if (dept != null) {
				sqlSB.append("department = ?");
				params.add(dept);
			}
		}
		
		if (!CommonUtil.isBlank(number)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("number like ?");
			params.add("%" + number.trim() + "%");
		}

		if (!CommonUtil.isBlank(name)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("name like ?");
			params.add("%" + name.trim() + "%");
		}
		
		if (!CommonUtil.isBlank(description)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("description like ?");
			params.add("%" + description.trim() + "%");
		}
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

	public static List<Long> toIds(Collection<Driver> drivers) {
		if (drivers == null)
			return null;
		
		List<Long> ids = new ArrayList<Long>(drivers.size());
		for (Driver d : drivers) {
			ids.add(d.id);
		}
		
		return ids;
	}

	public static Driver fetchById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Driver driver = Driver.findById(id);
		if (driver == null)
			throw new RuntimeException("id invalid");
		
		return driver;
	}

	public static List<Driver> assignables() {
		return find("department is null order by id desc").fetch();
	}

}
