package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Permission;

import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.PermVO;

@With(Interceptor.class)
public class Permissions extends Controller {
	public static void grid(String id){
		List<Permission> permList = Permission.findAll();
		List<ComboVO> perms = new ArrayList<ComboVO>();
		if (permList != null)
    		for (Permission p : permList)
    			perms.add(new ComboVO(p.name, p.name));
    		
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
    	map.put("perms", CommonUtil.getGson().toJson(perms));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Permissions/grid.html")).render(map));
	}
	
	public static void read(){
		List<PermVO> result = new ArrayList<PermVO>();
		List<Permission> perms = Permission.findAll();
		if (perms == null)
			return ;
		
		for (Permission p : perms)
			result.add(new PermVO(p));
		
		renderJSON(result);
	}
	
	public static void create(String models) {
		if(models == null)
			return;
		
		Permission.createByJson(models);
		
		renderJSON(models);
	}
	
	public static void update(String models){
		if(models==null)
			return;
		Permission.updateByJson(models);
		
		renderJSON(models);
		
	}

	public static void destroy(String models) {
		if (models == null)
			return ;
		Permission.deleteByJson(models);
		
		renderJSON(models);
	}
	
	public static void search(String permName, String uri, String desc){
		List<Permission> perms = Permission.findByCondition(permName, uri, desc);
		if (perms == null || perms.isEmpty())
			return ;
		
		List<PermVO> result = new ArrayList<PermVO>(perms.size());
		for (Permission p : perms){
			result.add(new PermVO(p));
		}
		
		renderJSON(result);
	}
}
