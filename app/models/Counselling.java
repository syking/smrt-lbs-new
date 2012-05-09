package models;

import play.db.jpa.Model;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;
/**
 * 辅导安排信息
 * @author weiwei
 *
 */
@Entity
@Table(name="t_counsel")
public class Counselling extends Model{
    @ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="users_id")
	public User user;
	
	@Column(name = "start_time")
	public String startTime;
	
	@Column(name = "end_time")
	public String endTime;

	public String remark;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="driver_id")
	public Driver driver;
	
	public Counselling() {
		super();
	}

	public Counselling(User user, String startTime,
			String endTime, String remark, Driver driver) {
		super();
		this.user = user;
		this.startTime = startTime;
		this.endTime = endTime;
		this.remark = remark;
		this.driver = driver;
	}
	
	public List<Counselling> getAllCoun(){
		return Counselling.findAll();
	}
	
	public List<Counselling> getCounsellings(User user, 
			Driver driver, String start, String end, String username, String driverName){
		System.out.println("user: "+user+ " driver: "+driver + 
				" StartTime: "+ start+" EndTime: "+end);
		
		String index = "by" + formQuery(user, driver, start, end);
		String sql = "";
		
		List<Counselling> counsellings = null;
		if(index.contains("byAnd")){
			sql = "by" + index.substring(5);
		}else{
			sql = index;
		}
		System.out.println(sql);
		List<Object> params = new ArrayList<Object>();
		if(sql.equals("by")){
			if(!username.equals("")||!driverName.equals("")){
				counsellings = null;
			}else{
				counsellings = Counselling.findAll();
			}
		}else{
			if(sql.contains("User")){
				params.add(user);
			}
			if(sql.contains("Driver")){
				params.add(driver);
			}
			if(sql.contains("StartTime")){
				params.add(start);
			}
			if(sql.contains("EndTime")){
				params.add(end);
			}
			Object[] p = params.toArray();
			counsellings = Counselling.find(sql, p).fetch();
		}
		return counsellings;	
	}
	
	public String formQuery(User user, Driver driver, String start, String end){
		return String.format("%s%s%s%s", user!=null?"AndUser":"",
				driver!=null?"AndDriver":"", !start.equals("")?"AndStartTime":"", !end.equals("")?"AndEndTime":"");
	}

	public static long counselSize() {
		return Counselling.findAll().size();
	}
}









