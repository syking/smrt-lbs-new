package controllers;

import static models.User.Constant.THEME;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;
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
	public static void mycounsels() throws ParseException{

		List<CounselVO> result = new ArrayList<CounselVO>();
		List<Counselling> counsellings = Counselling.find("byUser", renderArgs.get("user")).fetch();
		if (counsellings == null)
			renderJSON("");
		
		for (Counselling c : counsellings){
			result.add(new CounselVO().init(c));
		}
		renderJSON(result);
		
	}
	
	public static void mysearch(String driverName, String startDate, String startTime, String endDate, String endTime) throws ParseException{
		
		User user = (User)renderArgs.get("user");
		List<Counselling> counsellings = Counselling.findByCondition(user.name, driverName, startDate, startTime, endDate, endTime);
		
		List<CounselVO> result = new ArrayList<CounselVO>();
		for (Counselling counselling : counsellings)
			result.add(new CounselVO().init(counselling));
		
		renderJSON(result);
	}
	
	public static void saveMyCounsel(String models) throws ParseException{
		if(models==null){
			return;
		}
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);

		String driverName = jo.getString("driverName");
		String startTime = jo.getString("startTime");
		String endTime = jo.getString("endTime");
		String remark = jo.getString("remark");
		User user = (User)renderArgs.get("user");
		Driver driver = Driver.find("byName", driverName).first();
		if(user==null||driver==null){
			return;
		}
	}
	public static void deleteCounsel(String models){
		String json = models.substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		Counselling c = Counselling.find("id = ?", id).first();
		c.delete();
    }
	
	public static void updateCounsel(String models) throws ParseException{
		if(models == null)
			return;
		String json = models.substring(1, models.length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		String userName = jo.getString("userName");
		String driverName = jo.getString("driverName");
		String startTime = jo.getString("startTime");
		String endTime = jo.getString("endTime");
		String remark = jo.getString("remark");
		
		User user = User.find("byName", userName).first();
		Driver driver = Driver.find("byName", driverName).first();
		
		Counselling oldCoun = Counselling.findById(id);
		oldCoun.user = user;
		oldCoun.driver = driver;
		oldCoun.remark = remark;
		
		oldCoun.save();
	}
	
	public static void driverList(){
		List<Driver> drivers = Driver.findAll();
		
		renderJSON(drivers);
	}
	
	public static void grid(String id) {
		final String preUrl = "/MyCounsellings/";

		List<Driver> drList = Driver.findAll();
    	List<ComboVO> drivers = new ArrayList<ComboVO>();
    	if (drList != null)
    		for (Driver dr : drList){
    			drivers.add(new ComboVO(dr.name, dr.id));
    		}
		
		
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.createUrl = preUrl + "saveMyCounsel";
		grid.updateUrl = preUrl + "updateCounsel";
		grid.destroyUrl = preUrl + "deleteCounsel";
		grid.readUrl = preUrl + "mycounsels";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(
				CommonUtil.assemColumns(CounselVO.class, "id", "userName"));
		map.put("grid", grid);
    	map.put("drivers", CommonUtil.getGson().toJson(drivers));
    	
		renderHtml(TemplateLoader.load(
				template(renderArgs.get(THEME) + "/MyCounsels/grid.html"))
				.render(map));
	}
}
