package models;

import play.db.jpa.Model;
import utils.CommonUtil;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
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
	public Date startTime;

	@Column(name = "end_time")
	public Date endTime;

	public String remark;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="driver_id")
	public Driver driver;
	
	public Counselling() {
		super();
	}

	public static List<Counselling> findByCondition(String userName, String driverName, String startDate, String startTime, String endDate, String endTime){
		List<Object> params = new ArrayList<Object>();
		StringBuilder sb = new StringBuilder();
		
		User user = User.find("byName", userName).first();
		if (user != null){
			sb.append("user = ?");
			params.add(user);
		}
		
		Driver driver = Driver.find("byName", driverName).first();
		if (driver != null){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("driver = ?");
			params.add(driver);
		}
		
		if (startDate != null && !startDate.isEmpty()){
			if (startTime != null && !startTime.isEmpty())
				startTime = startDate + " " + startTime;
			else 
				startTime = startDate + " 00:00:00";
			
			Date start = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime);
			params.add(start);
			
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("start_time >= ?");
		}
		
		if (endDate != null && !endDate.isEmpty()){
			if (endTime != null && !endTime.isEmpty())
				endTime = endDate + " " + endTime;
			else 
				endTime = endDate + " 00:00:00";
			
			Date end = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime);
			params.add(end);
			
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("end_time < ?");
		}
		
		System.out.println(sb.toString() + "|" + params.toString());
		List<Counselling> counsellings = Counselling.find(sb.toString(), params.toArray()).fetch();
		
		return counsellings;
	}
	
	public Counselling(User user, Date startTime,
			Date endTime, String remark, Driver driver) {
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
	
	public static long counselSize() {
		return Counselling.findAll().size();
	}
}