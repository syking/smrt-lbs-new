package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Role;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.Grid;
import vo.RoleVO;

@With(Interceptor.class)
public class Roles extends Controller{
	public static void grid(String id){
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		final String preUrl = "/Roles/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";
		
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(RoleVO.class, "id"));
		map.put("grid", grid);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Roles/grid.html")).render(map));
	}
	
	public static void read(){
		List<RoleVO> result = new ArrayList<RoleVO>();
		List<Role> Roles = Role.findAll();
		if (Roles == null)
			return ;
		
		for (Role u : Roles)
			result.add(new RoleVO(u));
		
		renderJSON(result);
	}
	
	public static void create(String models) {
		if(models == null)
			return;
		
		Role.createByJson(models);
		
		renderJSON(models);
	}
	
	public static void update(String models){
		if(models==null)
			return;
		Role.updateByJson(models);
		
		renderJSON(models);
		
	}

	public static void destroy(String models) {
		if (models == null)
			return ;
		Role.deleteByJson(models);
		
		renderJSON(models);
	}
	
	public static void search(String roleName, String desc){
		List<Role> Roles = Role.findByCondition(roleName, desc);
		if (Roles == null || Roles.isEmpty())
			return ;
		
		List<RoleVO> result = new ArrayList<RoleVO>(Roles.size());
		for (Role u : Roles){
			result.add(new RoleVO(u));
		}
		
		renderJSON(result);
	}
}
