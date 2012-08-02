package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import annotations.Perm;

import models.Permission;

import play.Play;
import play.classloading.enhancers.ControllersEnhancer;
import play.classloading.enhancers.ControllersEnhancer.ControllerInstrumentation;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.PermVO;

@With(Interceptor.class)
public class Permissions extends Controller {
	@Perm
	public static void grid(String id){
		List<String> actionSet = Permission.actions;
		List<ComboVO> permActions = new ArrayList<ComboVO>();
		if (actionSet != null)
    		for (String a : actionSet){
    			permActions.add(new ComboVO(a, a));
    		}
    		
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		final String preUrl = "/Permissions/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";
		
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(PermVO.class, "id"));
		map.put("grid", grid);
    	map.put("permActions", CommonUtil.getGson().toJson(permActions));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Permissions/grid.html")).render(map));
	}
	@Perm
	public static void actions(){
		List<String> _actions = Permission.assemActions();
		List<ComboVO> actions = new ArrayList<ComboVO>();
		for (String a : _actions){
			actions.add(new ComboVO(a, a));
		}
		
		renderJSON(actions);
	}
	@Perm
	public static void read(int page, int pageSize){
		renderJSON(Permission.search(page, pageSize, null, null));
	}
	@Perm
	public static void create(String models) {
		renderJSON(Permission.createByJson(models));
	}
	@Perm
	public static void update(String models){
		if (Permission.updateByJson(models))
			renderJSON(models);
		
	}
	@Perm
	public static void destroy(String models) {
		if (Permission.deleteByJson(models))
			renderJSON(models);
	}
	@Perm
	public static void search(int page, int pageSize, String permAction, String desc){
		renderJSON(Permission.search(page, pageSize, permAction, desc));
	}
}
