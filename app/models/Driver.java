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

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.ChartSerie;
import vo.DriverPerformanceVO;
import vo.EventReportVO;
import vo.TreeView;

/**
 * 司机信息
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
    
    public static Map queryReport(Long driverId, String timeType, String startTime, String endTime){
    	List<EventReportVO> datas = new ArrayList<EventReportVO>();
    	
    	List<Driver> drivers = null;
    	Driver driver = Driver.findById(driverId);
    	if (driver != null){
    		drivers = new ArrayList<Driver>(1);
    		drivers.add(driver);
    	}
    	
		List<DriverReport> drs = DriverReport.findByDriver(driver, timeType, startTime, endTime);
		if (drs != null && !drs.isEmpty()){
			for (DriverReport dr : drs){
				EventReportVO drVO = new EventReportVO(dr);
				datas.add(drVO);
			}
		}
		
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "department","fleet","route", "id"));
		
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
		return "Driver [number=" + number + "]";
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

}
