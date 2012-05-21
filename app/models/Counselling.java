package models;

import play.db.jpa.Model;
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
	
	public List<Counselling> search(User user, 
			Driver driver, Date start, Date end, String username, String driverName){
		String index = "";

		String sql = "";
		List<Counselling> counsellings = null;
		if(start==null||end==null){
			index = "by" + formQuery(user, driver, start, end);
			if(index.contains("byAnd")){
				sql = "by" + index.substring(5);
			}else{
				sql = index;
			}
		}else{
			sql = formQuery(user, driver, start, end);
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
			if(user!=null){
				params.add(user);
			}
			if(driver!=null){
				params.add(driver);
			}
			if(start!=null){
				params.add(start);
			}
			if(end!=null){
				params.add(end);
			}
			Object[] p = params.toArray();
			counsellings = Counselling.find(sql, p).fetch();
		}
		return counsellings;	
	}

	public String formQuery(User user, Driver driver, Date start, Date end){
		if(start!=null&&end!=null){
			StringBuilder builder = new StringBuilder();
			if(user!=null){
				builder.append("user = ?").append(" And ");
			}
			if(driver!=null){
				builder.append("driver = ?").append(" And ");
			}
			builder.append("startTime >= ?").append(" And ").append("endTime <= ?");
			System.out.println(builder.toString());
			return builder.toString();
		}else{
			return String.format("%s%s%s%s", user!=null?"AndUser":"",
					driver!=null?"AndDriver":"", start!=null?"AndStartTime":"", end!=null?"AndEndTime":"");
		}
	}

	public static long counselSize() {
		return Counselling.findAll().size();
	}
}









