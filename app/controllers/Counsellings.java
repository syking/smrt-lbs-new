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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

@With(Interceptor.class)
public class Counsellings extends Controller {

	/*public static void index() {
		render(renderArgs.get(THEME) + "/Counsels/index.html");
	}*/

	public static void counsel() throws ParseException {	
		List<CounselVO> result = new ArrayList<CounselVO>();
		List<Counselling> counsellings = Counselling.findAll();
		if (counsellings == null)
			renderJSON("");
		
		for (Counselling c : counsellings){
			result.add(new CounselVO().init(c));
		}
		renderJSON(result);
	}	

	public static void search(long username, long driverName,
			String date, String startTime, String endTime) throws ParseException {
		
		User user = User.find("id = ?", username).first();
		Driver driver = Driver.find("id = ?", driverName).first();
		Counselling coun = new Counselling();
		List<Counselling> counsellings = coun.getCounsellings(user, driver, date,
				startTime, endTime, user!=null?user.name:"", driver!=null?driver.name:"");
		
		List<CounselVO> result = new ArrayList<CounselVO>();
		for (Counselling counselling : counsellings){
			result.add(new CounselVO().init(counselling));
		}
        
		renderJSON(result);
	}

	public static void saveCounselling(String models) throws ParseException {
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);

		String userName = jo.getString("userName");
		String driverName = jo.getString("driverName");
		String date = jo.getString("date");
		String startTime = jo.getString("startTime");
		String endTime = jo.getString("endTime");
		String remark = jo.getString("remark");
	
		boolean flag = compareTime(startTime, endTime);
		if (flag) {
			User user = User.find("byName", userName).first();
			Driver driver = Driver.find("byName", driverName).first();
			new Counselling(user, date, startTime, endTime, remark, driver).save();
		} else {
			renderJSON("{\"error\":\"#_error_#\"}");
		}
	}

	public static void deleteCounsel(String models) {
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		Counselling c = Counselling.find("id = ?", id).first();
		c.delete();
	}

	public static void updateCounsel(String models) throws ParseException {
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		String userName = jo.getString("userName");
		String driverName = jo.getString("driverName");
		String date = jo.getString("date");
		String startTime = jo.getString("startTime");
		String endTime = jo.getString("endTime");
		String remark = jo.getString("remark");
		
		User user = User.find("byName", userName).first();
		Driver driver = Driver.find("byName", driverName).first();
		
		boolean flag = compareTime(startTime, endTime);
		if (flag) {
			Counselling oldCoun = Counselling.findById(id);
			if (oldCoun != null) {
				oldCoun.user = user;
				oldCoun.driver = driver;
				oldCoun.date = date;
				oldCoun.startTime = startTime;
				oldCoun.endTime = endTime;
				oldCoun.remark = remark;
				oldCoun.save();
			} else {
				flash.error("Sorry, there is no result!");
			}
		} else {
			renderJSON("{\"error\":\"#_error_#\"}");
		}
	}

	public static boolean compareTime(String start, String end) {
		boolean flag = false;
		SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
		try {
			if (df.parse(start).before(df.parse(end))) {
				flag = true;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	public static void grid(String id) {
		final String preUrl = "/Counsellings/";
		List<User> userList = User.findAll();
		List<ComboVO> users = new ArrayList<ComboVO>();
		if (userList != null)
    		for (User user : userList){
    			users.add(new ComboVO(user.name, user.id));
    		}
		List<Driver> drList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (drList != null)
    		for (Driver dr : drList){
    			drivers.add(new ComboVO(dr.name, dr.id));
    		}
		
		
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.createUrl = preUrl + "saveCounselling";
		grid.updateUrl = preUrl + "updateCounsel";
		grid.destroyUrl = preUrl + "deleteCounsel";
		grid.readUrl = preUrl + "counsel";
		grid.searchUrl = preUrl + "search";
		grid.editable = "inline";
		grid.columnsJson = CommonUtil.getGson().toJson(
				CommonUtil.assemColumns(CounselVO.class, "id"));
		map.put("grid", grid);
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	map.put("users", CommonUtil.getGson().toJson(users));
    	
		renderHtml(TemplateLoader.load(
				template(renderArgs.get(THEME) + "/Counsels/grid.html"))
				.render(map));
	}
}
