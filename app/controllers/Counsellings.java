package controllers;

import models.Counselling;
import models.Driver;
import models.User;
import net.sf.json.JSONObject;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.CounselVO;
import vo.Grid;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

@With(Interceptor.class)
public class Counsellings extends Controller {

	public static void counsel() throws ParseException {
		List<CounselVO> result = new ArrayList<CounselVO>();
		List<Counselling> counsellings = Counselling.findAll();
		if (counsellings == null)
			return ;
		
		for (Counselling c : counsellings)
			result.add(new CounselVO().init(c));
		
		renderJSON(result);
	}	
	
	public static void search(String userName, String driverName, String startDate, String startTime, String endDate, String endTime) throws ParseException {
	
		System.out.println("--------- search counselling ..... " + userName + " | " + driverName + " | " + startDate + " | " + startTime + " | " + endDate + " | " + endTime);
	
		List<Counselling> counsellings = Counselling.findByCondition(userName, driverName, startDate, startTime, endDate, endTime);
		List<CounselVO> result = new ArrayList<CounselVO>();
	
		for (Counselling counselling : counsellings)
			result.add(new CounselVO().init(counselling));
		
		renderJSON(result);
	}

	public static void saveCounselling(String models) throws ParseException {
		if(models == null)
			return;
		
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		String userName = jo.getString("userName");
		String driverName = jo.getString("driverName");
		String startDate = jo.getString("startDate");
		String startTime =  startDate + " " + jo.getString("startTime");
		String endDate = jo.getString("endDate");
		String endTime = endDate + " " + jo.getString("endTime");
		String remark = jo.getString("remark");
		
		User user = User.find("byName", userName).first();
		if (user == null)
			return ;
		
		Driver driver = Driver.find("byName", driverName).first();
		if (driver == null)
			return ;
		
		new Counselling(user, CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime), CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime), remark, driver).save();
		
		renderJSON(models);
	}

	public static void deleteCounsel(String models) {
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		Counselling c = Counselling.find("id = ?", id).first();
		
		c.delete();
	}

	public static void updateCounsel(String models) throws ParseException {
		if(models==null)
			return;
		
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		String userName = jo.getString("userName");
		String driverName = jo.getString("driverName");
		String startDate = jo.getString("startDate");
		String startTime =  startDate + " " + jo.getString("startTime");
		String endDate = jo.getString("endDate");
		String endTime = endDate + " " + jo.getString("endTime");
		String remark = jo.getString("remark");
		
		User user = User.find("byName", userName).first();
		Driver driver = Driver.find("byName", driverName).first();
		
		Counselling oldCoun = Counselling.findById(id);
		if (oldCoun == null)
			return ;
		
		oldCoun.user = user;
		oldCoun.driver = driver;
		oldCoun.startTime = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", startTime);
		oldCoun.endTime = CommonUtil.newDate("yyyy-MM-dd HH:mm:ss", endTime);
		oldCoun.remark = remark;
		
		oldCoun.save();
	}

	public static boolean compareTime(String start, String end) {
		boolean flag = false;
		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
		try {
			if (df.parse(start).before(df.parse(end))) 
				flag = true;
			
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
		
		return flag;
	}

	public static void grid(String id) {
		final String preUrl = "/Counsellings/";
		List<User> userList = User.findAll();
		List<ComboVO> users = new ArrayList<ComboVO>();
		if (userList != null)
    		for (User user : userList)
    			users.add(new ComboVO(user.name, user.name));
    		
		List<Driver> drList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (drList != null)
    		for (Driver dr : drList)
    			drivers.add(new ComboVO(dr.name, dr.name));
		
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.createUrl = preUrl + "saveCounselling";
		grid.updateUrl = preUrl + "updateCounsel";
		grid.destroyUrl = preUrl + "deleteCounsel";
		grid.readUrl = preUrl + "counsel";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";
		
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(CounselVO.class, "id"));
		map.put("grid", grid);
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	map.put("users", CommonUtil.getGson().toJson(users));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Counsels/grid.html")).render(map));
	}
}
