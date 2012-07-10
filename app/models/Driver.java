package models;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.google.gson.JsonElement;

import play.db.jpa.Model;
import utils.CommonUtil;
import utils.Splitter;
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
    
    public static Map assemReport(Collection<Driver> drivers, String timeType, String time) throws ParseException{
    	List<EventType> eventTypes = EventType.findAll();
    	if (eventTypes == null)
    		return null;
		
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
    		categories.add(driver.name);
    		
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
		
		return map;
    }
    
    /**
	 * unit of time -> second
	 * @param driverNumber
	 * @return
	 */
	public static float calculateDrivingTime(String driverNumber){
		float count = 0;
		List<Schedule> schs = Schedule.findByDriverNumber(driverNumber);
		if (schs == null || schs.isEmpty())
			return 0;
		
		for (Schedule s : schs){
			long time = CommonUtil.difference(s.endTime, s.startTime) / 1000;
			count += time;
		}
		
		return count;
	}
    
	@Override
	public String toString() {
		return "Driver [number=" + number + ", name=" + name + ", description="
				+ description + ", department=" + department + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		
		int result = super.hashCode();
		result = prime * result + ((department == null) ? 0 : department.hashCode());
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((number == null) ? 0 : number.hashCode());
		
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Driver other = (Driver) obj;
		if (department == null) {
			if (other.department != null)
				return false;
		} else if (!department.equals(other.department))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (number == null) {
			if (other.number != null)
				return false;
		} else if (!number.equals(other.number))
			return false;
		return true;
	}

}
