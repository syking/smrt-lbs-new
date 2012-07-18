package models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.CounselVO;
import vo.DriverVO;
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

	public static String createByJson(String models, String userName){
		List<CounselVO> vos = CommonUtil.parseArray(models, CounselVO.class);
		if (vos == null)
			return models;
		
		for (CounselVO vo : vos){
			if (userName != null)
				vo.userName = userName;
			
			String startTime = vo.startDate + " " + vo.startTime;
			String endTime = vo.endDate + " " + vo.endTime;
			
			User user = User.find("byName", vo.userName).first();
			if (user == null)
				continue ;
			
			Driver driver = Driver.find("byName", vo.driverName).first();
			if (driver == null)
				continue ;
			
			Counselling c = new Counselling(user, CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime), CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime), vo.remark, driver);
			c.create();
			vo.id = String.valueOf(c.id);
		}
		
		String _models = CommonUtil.toJson(vos);
		
		return _models;
	}
	
	public static boolean updateByJson(String models, String userName){
		List<CounselVO> vos = CommonUtil.parseArray(models, CounselVO.class);
		if (vos == null)
			return false;
		
		for (CounselVO vo : vos){
			if (vo.id == null)
				continue;
			
			Counselling c = Counselling.findById(Long.parseLong(vo.id));
			if (c == null)
				continue ;
			
			vo.startTime = vo.startDate + " " + vo.startTime;
			vo.endTime = vo.endDate + " " + vo.endTime;
			
			if (userName != null)
				vo.userName = userName;
			
			User user = User.find("byName", vo.userName).first();
			c.user = user;
			
			Driver driver = Driver.find("byName", vo.driverName).first();
			c.driver = driver;
			
			c.endTime = CommonUtil.parse(vo.endTime); 
			c.startTime = CommonUtil.parse(vo.startTime);
			c.remark = vo.remark;
			
			c.save();
		}
		
		return true;
	}
	
	public static boolean deleteByJson(String models){
		List<CounselVO> vos = CommonUtil.parseArray(models, CounselVO.class);
		if (vos == null)
			return false;
		
		for (CounselVO vo : vos){
			if (vo.id == null)
				continue;
			
			Counselling c = Counselling.findById(Long.parseLong(vo.id));
			if (c == null)
				continue ;
			
			c.delete();
		}
		
		return true;
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