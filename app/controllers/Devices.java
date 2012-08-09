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
import annotations.Perm;

@With(Interceptor.class)
public class Devices extends Controller {

	@Perm
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

	@Perm
	public static void read(int page, int pageSize){
		renderHtml(CommonUtil.toJson(Device.search(page, pageSize, null, null, null)));
	}

	@Perm
	public static void create(String models) {
		renderHtml(CommonUtil.toJson(Device.createByJson(models)));
	}

	@Perm
	public static void update(String models){
		if (Device.updateByJson(models))
			renderHtml(CommonUtil.toJson(models));

	}

	@Perm
	public static void destroy(String models) {
		if (Device.deleteByJson(models))
			renderHtml(CommonUtil.toJson(models));
	}

	@Perm
	public static void search(int page, int pageSize, String name, String key, String host){
		renderHtml(CommonUtil.toJson(Device.search(page, pageSize, name, key, host)));
	}

}