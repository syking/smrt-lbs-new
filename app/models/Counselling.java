package models;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.CounselVO;
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
	
	public static Counselling fetchById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Counselling c = Counselling.findById(id);
		if (c == null)
			throw new RuntimeException("Counsel  not found");
		
		return c;
	}
	
	public static CounselVO createByVO(CounselVO vo, String userName) {
		if (vo == null)
			throw new RuntimeException("Counsel info required");
		
		if (userName != null)
			vo.userName = userName;
		
		vo.validate();
		
		String startTime = vo.startDate + " " + vo.startTime;
		String endTime = vo.endDate + " " + vo.endTime;
		
		User user = User.find("byName", vo.userName).first();
		if (user == null)
			throw new RuntimeException("UserName is invalid!, ");
		
		Driver driver = Driver.find("byName", vo.driverName).first();
		if (driver == null)
			throw new RuntimeException("DriverName is invalid!, ");
		
		Counselling c = new Counselling(user, CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime), CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime), vo.remark, driver);
		
		if (c.startTime.after(c.endTime))
			throw new RuntimeException("EndTime must after the StartTime!");
		
		c.create();
		vo.id = c.id;
		
		return vo;
	}
	
	public static String createByJson(String models, String userName){
		List<CounselVO> vos = CommonUtil.parseArray(models, CounselVO.class);
		if (vos == null)
			throw new RuntimeException("Could not Parse the Json Content!");
		
		for (CounselVO vo : vos){
			createByVO(vo, userName);
		}
		
		String _models = CommonUtil.toJson(vos);
		
		return _models;
	}
	
	public static void updateByVO(CounselVO vo, String userName) {
		Counselling c = Counselling.fetchById(vo.id);
		
		vo.validate();
		
		vo.startTime = vo.startDate + " " + vo.startTime;
		vo.endTime = vo.endDate + " " + vo.endTime;
		
		if (userName != null)
			vo.userName = userName;
		
		User user = User.find("byName", vo.userName).first();
		if (user == null)
			throw new RuntimeException("UserName is invalid!, ");
		c.user = user;
		
		Driver driver = Driver.find("byName", vo.driverName).first();
		if (driver == null)
			throw new RuntimeException("DriverName is invalid!, ");
		c.driver = driver;
		
		c.endTime = CommonUtil.parse(vo.endTime); 
		c.startTime = CommonUtil.parse(vo.startTime);
		c.remark = vo.remark;
		
		if (c.startTime.after(c.endTime))
			throw new RuntimeException("EndTime must after the StartTime!");
		
		c.save();
	}
	
	public static boolean updateByJson(String models, String userName){
		List<CounselVO> vos = CommonUtil.parseArray(models, CounselVO.class);
		if (vos == null)
			throw new RuntimeException("Could not Parse the Json Content!");
		
		for (CounselVO vo : vos){
			updateByVO(vo, userName);
		}
		
		return true;
	}
	
	public static void deleteById(Long id) {
		Counselling c = Counselling.fetchById(id);
		
		c.delete();
	}
	
	public static boolean deleteByJson(String models){
		List<CounselVO> vos = CommonUtil.parseArray(models, CounselVO.class);
		if (vos == null)
			throw new RuntimeException("Could not Parse the Json Content!");;
		
		for (CounselVO vo : vos){
			deleteById(vo.id);
		}
		
		return true;
	}
	
	public static List<Counselling> findByCondition(int page, int pageSize, String userName, String driverName, String startDate, String startTime, String endDate, String endTime){
		List<Object> params = new ArrayList<Object>();
		StringBuilder sb = new StringBuilder();
		parseCondition(userName, driverName, startDate, startTime, endDate, endTime, params, sb);
		
		List<Counselling> counsellings = null;
		if (page > 0 && pageSize > 0)
			counsellings = Counselling.find(sb.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		else
			counsellings = Counselling.find(sb.toString() + " order by id desc", params.toArray()).fetch();
		
		return counsellings;
	}
	
	public static long countByCondition(String userName, String driverName, String startDate, String startTime, String endDate, String endTime){
		List<Object> params = new ArrayList<Object>();
		StringBuilder sb = new StringBuilder();
		parseCondition(userName, driverName, startDate, startTime, endDate, endTime, params, sb);
		
		return Counselling.count(sb.toString(), params.toArray());
	}
	
	public static Map search(int page, int pageSize, CounselVO counsel){
		if (counsel == null)
			return search(page, pageSize, null, null, null, null, null, null);
		
		return search(page, pageSize, counsel.userName, counsel.driverName, counsel.startDate, counsel.startTime, counsel.endDate, counsel.endTime);
	}
	
	public static Map search(int page, int pageSize, String userName, String driverName, String startDate, String startTime, String endDate, String endTime) {
		Map map = new HashMap();
		map.put("total", Counselling.countByCondition(userName, driverName, startDate, startTime, endDate, endTime));
		map.put("counsellings", Counselling.assemVO(Counselling.findByCondition(page, pageSize, userName, driverName, startDate, startTime, endDate, endTime)));
		
		return map;
	}
	
	private static void parseCondition(String userName, String driverName,
			String startDate, String startTime, String endDate, String endTime,
			List<Object> params, StringBuilder sb) {
		if (!CommonUtil.isBlank(userName)){
			User user = User.find("byName", userName.trim()).first();
			if (user != null){
				sb.append("user = ?");
				params.add(user);
			}
		}
		
		if (!CommonUtil.isBlank(driverName)){
			Driver driver = Driver.find("byName", driverName.trim()).first();
			if (driver != null){
				if (sb.length() > 0)
					sb.append(" and ");
				
				sb.append("driver = ?");
				params.add(driver);
			}
		}
		
		if (!CommonUtil.isBlank(startDate)){
			if (!CommonUtil.isBlank(startTime))
				startTime = startDate.trim() + " " + startTime.trim();
			else 
				startTime = startDate.trim() + " 00:00:00";
			
			Date start = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime);
			params.add(start);
			
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("start_time >= ?");
		}
		
		if (!CommonUtil.isBlank(endDate)){
			if (!CommonUtil.isBlank(endTime))
				endTime = endDate.trim() + " " + endTime.trim();
			else 
				endTime = endDate.trim() + " 00:00:00";
			
			Date end = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime);
			params.add(end);
			
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("end_time < ?");
		}
	}
	
	public Counselling(User user, Date startTime, Date endTime, String remark, Driver driver) {
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
	
	public static List<CounselVO> assemVO(List<Counselling> cs){
		if (cs == null)
			return null;
		
		List<CounselVO> result = new ArrayList<CounselVO>(cs.size());
		for (Counselling c : cs)
			result.add(new CounselVO().init(c));
		
		return result;
	}
}