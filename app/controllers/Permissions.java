package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	@annotations.Permission
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
	@annotations.Permission
	public static void actions(){
		List<String> actionSet = Permission.actions;
		List<Permission> perms = Permission.findAll();
		List<ComboVO> actions = new ArrayList<ComboVO>();
		if (actionSet != null)
    		actionLoop:for (String a : actionSet){
    			for (Permission p : perms){
    				if (p.action.equals(a))
    					continue actionLoop;
    			}
    			
    			actions.add(new ComboVO(a, a));
    		}
		
		renderJSON(actions);
	}
	@annotations.Permission
	public static void read(){
		List<PermVO> result = new ArrayList<PermVO>();
		List<Permission> perms = Permission.findAll();
		if (perms == null)
			return ;
		
		for (Permission p : perms)
			result.add(new PermVO(p));
		
		renderJSON(result);
	}
	@annotations.Permission
	public static void create(String models) {
		if(models == null)
			return;
		System.out.println(">>>>>>>>>>>>>>>>----------------->"+models);
		Permission.createByJson(models);
		
		renderJSON(models);
	}
	@annotations.Permission
	public static void update(String models){
		if(models==null)
			return;
		Permission.updateByJson(models);
		
		renderJSON(models);
		
	}
	@annotations.Permission
	public static void destroy(String models) {
		if (models == null)
			return ;
		Permission.deleteByJson(models);
		
		renderJSON(models);
	}
	@annotations.Permission
	public static void search(String permAction, String desc){
		List<Permission> perms = Permission.findByCondition(permAction, desc);
		if (perms == null || perms.isEmpty())
			return ;
		
		List<PermVO> result = new ArrayList<PermVO>(perms.size());
		for (Permission p : perms){
			result.add(new PermVO(p));
		}
		
		renderJSON(result);
	}
}
