package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Role;
import models.Device;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import annotations.Permission;

@With(Interceptor.class)
public class Devices extends Controller {

	public static void grid(String id){
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		final String preUrl = "/Devices/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";

		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(Device.class));
		map.put("grid", grid);
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Devices/grid.html")).render(map));
	}

	@Permission
	public static void read(int page, int pageSize){
		List<Device> devices = Device.find("order by id desc").fetch(page, pageSize);
		Map map = new HashMap();
		map.put("data", devices);
		map.put("total", Device.count());
		
		renderJSON(map);
	}

	@Permission
	public static void create(String models) {
		renderJSON(Device.createByJson(models));
	}

	@Permission
	public static void update(String models){
		if (Device.updateByJson(models))
			renderJSON(models);

	}

	@Permission
	public static void destroy(String models) {
		if (Device.deleteByJson(models))
			renderJSON(models);
	}

	@Permission
	public static void search(int page, int pageSize, String name, String key, String host){
		List<Device> devices = Device.findByCondition(page, pageSize, name, key, host);
		Map map = new HashMap();
		map.put("data", devices);
		map.put("total", Device.countByCondition(name, key, host));
		
		renderJSON(map);
	}

}