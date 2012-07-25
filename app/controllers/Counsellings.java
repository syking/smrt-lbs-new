package controllers;

import models.Counselling;
import models.Driver;
import models.User;
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

import annotations.Permission;

import static models.User.Constant.THEME;

/**
 * User to Driver Counsel Controller
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Counsellings extends Controller {

	@Permission
	public static void read() throws ParseException {
		List<CounselVO> result = new ArrayList<CounselVO>();
		List<Counselling> counsellings = Counselling.find("order by id desc").fetch();
		if (counsellings == null)
			return ;
		
		for (Counselling c : counsellings)
			result.add(new CounselVO().init(c));
		
		renderJSON(result);
	}	
	
	@Permission
	public static void search(String userName, String driverName, String startDate, String startTime, String endDate, String endTime){
		try{
			List<Counselling> counsellings = Counselling.findByCondition(userName, driverName, startDate, startTime, endDate, endTime);
			List<CounselVO> result = new ArrayList<CounselVO>();
		
			for (Counselling counselling : counsellings)
				result.add(new CounselVO().init(counselling));
			
			renderJSON(result);
		} catch (Throwable e) {
			throw new RuntimeException("Counsel Search Error -> " + e.getMessage());
		}
	}

	@Permission
	public static void createCounselling(String models) {
		try {
			renderJSON(Counselling.createByJson(models, null));
		} catch (Throwable e) {
			throw new RuntimeException("Counsel Create Error -> " + e.getMessage());
		}
	}

	@Permission
	public static void deleteCounsel(String models) {
		try {
			if (Counselling.deleteByJson(models))
				renderJSON(models);
		} catch (Throwable e) {
			throw new RuntimeException("Counsel Delete Error -> " + e.getMessage());
		}
	}

	@Permission
	public static void updateCounsel(String models) {
		try {
			if (Counselling.updateByJson(models, null))
				renderJSON(models);
		} catch (Throwable e) {
			throw new RuntimeException("Counsel Update Error -> " + e.getMessage());
		}
	}

	@Permission
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
		grid.createUrl = preUrl + "createCounselling";
		grid.updateUrl = preUrl + "updateCounsel";
		grid.destroyUrl = preUrl + "deleteCounsel";
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";
		
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(CounselVO.class, "id"));
		map.put("grid", grid);
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	map.put("users", CommonUtil.getGson().toJson(users));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Counsels/grid.html")).render(map));
	}
}
