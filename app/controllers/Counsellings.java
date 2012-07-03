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
		List<Counselling> counsellings = Counselling.findByCondition(userName, driverName, startDate, startTime, endDate, endTime);
		List<CounselVO> result = new ArrayList<CounselVO>();
	
		for (Counselling counselling : counsellings)
			result.add(new CounselVO().init(counselling));
		
		renderJSON(result);
	}

	public static void saveCounselling(String models) throws ParseException {
		if(models == null)
			return;
		
		Counselling.saveByJson(models, null);
		
		renderJSON(models);
	}

	public static void deleteCounsel(String models) {
		if (models == null)
			return ;
		
		Counselling.deleteByJson(models);
		
		renderJSON(models);
	}

	public static void updateCounsel(String models) throws ParseException {
		if(models==null)
			return;
		
		Counselling.updateByJson(models, null);
		
		renderJSON(models);
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
