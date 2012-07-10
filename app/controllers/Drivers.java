package controllers;

import com.google.gson.Gson;
import models.Driver;
import models.User;
import org.apache.commons.lang.StringUtils;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.DriverVO;
import vo.Grid;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

/**
 * Drivers Http Request Handler
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Drivers extends Controller {
	
	public static void search(String number, String name) {
		List<String> criteria = new ArrayList<String>(9);
		List<Object> params = new ArrayList<Object>(9);

		if (null != number && !number.isEmpty()) {
			criteria.add("number LIKE ?");
			params.add("%" + number + "%");
		}

		if (null != name && !name.isEmpty()) {
			criteria.add("name LIKE ?");
			params.add("%" + name + "%");
		}

		List<Driver> driverList = Driver.filter(criteria, params);

		List<DriverVO> driverVOList = new ArrayList<DriverVO>();
		for (Driver driver : driverList) 
			driverVOList.add(new DriverVO().init(driver));

		renderJSON(driverVOList);
	}

	public static void listJson() {
		List<Driver> drivers = Driver.findAll();
		if (drivers == null)
			renderJSON("");

		List<DriverVO> driverVOList = new ArrayList<DriverVO>();

		for (Driver d : drivers) 
			driverVOList.add(new DriverVO().init(d));

		Map data = CommonUtil.assemGridData(driverVOList, "id", "fleet");

		renderJSON(data);
	}

	public static void add(String models) {
		Driver driver = CommonUtil.jsonStr2JavaObj(models, Driver.class);
		Driver d = new Driver(driver.number, driver.name, driver.description);
		d.save();
		
		renderJSON(models);
	}

	public static void destroy(String models) {
		Driver driver = CommonUtil.jsonStr2JavaObj(models, Driver.class);
		Driver d = Driver.findById(driver.id);
		
		try {
			d.delete();
		} catch (Exception e) {
			renderJSON("[]");
		}
		
		renderJSON(models);
	}

	public static void update(String models) {
		Driver driver = CommonUtil.jsonStr2JavaObj(models, Driver.class);
		
		Driver d = Driver.findById(driver.id);
		d.number = driver.number;
		d.name = driver.name;
		d.description = driver.description;
		d.save();
		
		renderJSON(models);
	}

	public static void read() {
		List<Driver> driverList = Driver.findAll();
		
		renderJSON(CommonUtil.getGson("fleet").toJson(driverList));
	}

	public static void grid(String id) {
		final String preUrl = "/Drivers/";
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // drivers
		grid.createUrl = preUrl + "add";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(DriverVO.class, "id"));

		List<User> userList = User.findAll();
		List<ComboVO> users = new ArrayList<ComboVO>();
		if (userList != null)
			for (User user : userList) 
				users.add(new ComboVO(user.name, user.id));
			
		map.put("users", CommonUtil.getGson().toJson(users));
		map.put("grid", grid);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Drivers/grid.html")).render(map));
	}

}
