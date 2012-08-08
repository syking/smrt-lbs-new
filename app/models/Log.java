package models;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.LogVO;

/**
 * Created with IntelliJ IDEA. User: JunXi Date: 5/10/12 Time: 3:49 PM
 */

@Entity
@Table(name = "t_log")
public class Log extends Model {
	public String type = "normal";// normal
	public String name = "system";// ?
	@Column(columnDefinition="longtext")
	public String content;// contains whole HTTP Request content-body
	public String action;// what ? permission name
	public String userAccount;// who ?
	public String userName;// who ?
	public String ip;// where ?
	public Date dateTime;// when ?
	public boolean isSuccess;// the result of this action

	public Log(String type, String action, String content, User user, String ip, boolean isSuccess){
		this.type = type == null ? "normal" : type;
		this.dateTime = new Date();
		this.content = content;
		this.action = action;
		this.userName = user == null ? "-" : user.name;
		this.userAccount = user == null ? "-" : user.account;
		this.ip = ip;
		this.isSuccess = isSuccess;
	}
	
	public static boolean deleteByJson(String models) {
		List<LogVO> vos = JSON.parseArray(models, LogVO.class);
		if (vos == null)
			return false;
		
		for (LogVO vo : vos){
			Long id = vo.id;
			Log log = Log.findById(id);
			if (log == null)
				throw new RuntimeException("log not found") ;
			
			log.delete();
		}
		
		return true;
	}
	
	public static Map search(int page, int pageSize, String type, String name, String content,String startDate, String startTime, String endDate, String endTime, String actions, long userid, String ip) {

		List<String> criteria = new ArrayList<String>(9);
		List<Object> params = new ArrayList<Object>(9);

		parseCondition(type, name, content, startDate, startTime, endDate, endTime, actions, userid, ip, criteria, params);
		List<Log> logList = filter(page, pageSize, criteria, params);
		List<LogVO> logVOList = new ArrayList<LogVO>();
		for (Log log : logList) {
			logVOList.add(new LogVO().init(log));
		}
		
		Map map = new HashMap();
		map.put("logs", logVOList);
		map.put("total", filterCount(criteria, params));
		
		return map;
	}
	
	private static void parseCondition(String type, String name, String content, String startDate, String startTime, String endDate, String endTime, String actions, long userid, String ip, List<String> criteria, List<Object> params) {
		if (!CommonUtil.isBlank(type)) {
			criteria.add("type LIKE ?");
			params.add("%" + type.trim() + "%");
		}

		if (!CommonUtil.isBlank(name)) {
			criteria.add("name LIKE ?");
			params.add("%" + name.trim() + "%");
		}

		if (!CommonUtil.isBlank(content)) {
			criteria.add("content LIKE ?");
			params.add("%" + content.trim() + "%");
		}

		if (!CommonUtil.isBlank(actions)) {
			criteria.add("action LIKE ?");
			params.add("%" + actions.trim() + "%");
		}

		if (!CommonUtil.isBlank(ip)) {
			criteria.add("ip LIKE ?");
			params.add("%" + ip.trim() + "%");
		}

		if (userid != 0) {
			User user = User.findById(userid);
			String userName = user.name;
			criteria.add("userName = ?");
			params.add(userName.trim());
		}

		// date and time
		if (!CommonUtil.isBlank(startDate)) {
			if (CommonUtil.isBlank(startTime))
				startTime = "00:00";
			
			String startDateTimeString = startDate.trim() + " " + startTime.trim();
			DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date startDateTime = null;
			try {
				startDateTime = formatDate.parse(startDateTimeString);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			criteria.add("dateTime >= ?");
			params.add(startDateTime);
		}

		if (!CommonUtil.isBlank(endDate)) {
			if (CommonUtil.isBlank(endTime))
				endTime = "00:00";
			
			String endDateTimeString = endDate.trim() + " " + endTime.trim();
			DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			Date endDateTime = null;
			try {
				endDateTime = formatDate.parse(endDateTimeString);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			criteria.add("dateTime <= ?");
			params.add(endDateTime);
		}
	}

	private static List<Log> filter(int page, int pageSize, List<String> criteria, List<Object> params) {
		Object[] p = params.toArray();
		String query = StringUtils.join(criteria, " AND ");
		List<Log> vehicles = Log.find(query + " order by id desc", p).fetch(page, pageSize);
		return vehicles;
	}
	
	private static long filterCount(List<String> criteria, List<Object> params) {
		Object[] p = params.toArray();
		String query = StringUtils.join(criteria, " AND ");
		return Log.count(query, p);
	}
	
	public static List<Log> findAllOrderByIdDesc(){
		return Log.findAllOrderBy("id", "desc");
	}
	
	public static List<Log> findAllOrderBy(String field, String order) {
		return Log.find(String.format("order by %s %s", field, order)).fetch();
	}
	
}
