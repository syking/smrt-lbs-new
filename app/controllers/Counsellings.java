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

import annotations.Perm;

import static models.User.Constant.THEME;

/**
 * User to Driver Counsel Controller
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Counsellings extends Controller {

	@Perm
	public static void read(int page, int pageSize) throws ParseException {
		renderJSON(Counselling.search(page, pageSize, null, null, null, null, null, null));
	}	
	
	@Perm
	public static void search(int page, int pageSize, String userName, String driverName, String startDate, String startTime, String endDate, String endTime){
		renderJSON(Counselling.search(page, pageSize, userName, driverName, startDate, startTime, endDate, endTime));
	}

	@Perm
	public static void createCounselling(String models) {
		renderJSON(Counselling.createByJson(models, null));
	}

	@Perm
	public static void deleteCounsel(String models) {
		if (Counselling.deleteByJson(models))
			renderJSON(models);
	}

	@Perm
	public static void updateCounsel(String models) {
		if (Counselling.updateByJson(models, null))
			renderJSON(models);
	}

	@Perm
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
