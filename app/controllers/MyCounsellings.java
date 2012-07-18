package controllers;

import static models.User.Constant.THEME;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.Counselling;
import models.Driver;
import models.User;
import play.data.validation.Required;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.CounselVO;
import vo.Grid;

@With(Interceptor.class)
public class MyCounsellings extends Controller{
	
	public static void read() throws ParseException{
		List<CounselVO> result = new ArrayList<CounselVO>();
		User user = User.findByName((String)renderArgs.get("user"));
		List<Counselling> counsellings = Counselling.find("user = ? order by id desc", user).fetch();
		if (counsellings == null)
			renderJSON("");
		
		for (Counselling c : counsellings){
			result.add(new CounselVO().init(c));
		}
		renderJSON(result);
		
	}
	
	public static void mysearch(String driverName, String startDate, String startTime, String endDate, String endTime) throws ParseException{
		String userName = (String)renderArgs.get("user");
		Counsellings.search(userName, driverName, startDate, startTime, endDate, endTime);
	}
	
	public static void createMyCounsel(String models) throws ParseException{
		String userName = (String)renderArgs.get("user");
		renderJSON(Counselling.createByJson(models, userName));
	}
	
	public static void deleteCounsel(String models){
		if (Counselling.deleteByJson(models))
			renderJSON(models);
    }
	
	public static void updateCounsel(String models) throws ParseException{
		String userName = (String)renderArgs.get("user");
		if (Counselling.updateByJson(models, userName))
			renderJSON(models);
	}
	
	public static void driverList(){
		renderJSON(Driver.findAll());
	}
	
	public static void grid(String id) {
		final String preUrl = "/MyCounsellings/";

		List<Driver> drList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (drList != null)
    		for (Driver dr : drList)
    			drivers.add(new ComboVO(dr.name, dr.name));
		
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.createUrl = preUrl + "createMyCounsel";
		grid.updateUrl = preUrl + "updateCounsel";
		grid.destroyUrl = preUrl + "deleteCounsel";
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "mysearch";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(CounselVO.class, "id", "userName"));
		map.put("grid", grid);
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/MyCounsels/grid.html")).render(map));
	}
}
