package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Permission;
import models.Role;
import models.User;
import play.Logger;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.Grid;
import vo.RoleVO;

import com.google.gson.Gson;

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
		List<Role> Roles = Role.find("order by id desc").fetch();
		if (Roles == null)
			return ;
		
		for (Role u : Roles)
			result.add(new RoleVO(u));
		
		renderJSON(result);
	}
	
	@annotations.Permission
	public static void create(String models) {
		renderJSON(Role.createByJson(models));
	}
	
	@annotations.Permission
	public static void update(String models){
		if (Role.updateByJson(models))
			renderJSON(models);
		
	}

	@annotations.Permission
	public static void destroy(String models) {
		if (Role.deleteByJson(models))
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
	
	@annotations.Permission
	public static void assign(String id){
		Map map = new HashMap();
		map.put("tabid", id);
		Gson gson = new Gson();
		map.put("roles", gson.toJson(Role.assemTreeView()));
		map.put("users", gson.toJson(User.assemTreeView()));
		map.put("perms", gson.toJson(Permission.assemTreeView()));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Roles/assign.html")).render(map));
	}
	
	@annotations.Permission
	public static void assignUserAndPerm(String roleName, List<Long> users, List<Long> perms){
		Map map = new HashMap();
		try{
			boolean flag = Role.assignUserAndPerm(roleName, users, perms);
			map.put("success", flag);
		}catch(Exception e){
			map.put("success", false);
			map.put("msg", e.getMessage());
		}
		
		renderJSON(map);
	}
	
	public static void users(String roleName){
		Role role = Role.findByName(roleName);
		renderJSON(CommonUtil.getGson("roles", "password", "account", "desc", "iconUrl").toJson(role.users));
	}
	
	public static void perms(String roleName){
		Role role = Role.findByName(roleName);
		renderJSON(CommonUtil.getGson("uri", "desc", "iconUrl").toJson(role.permissions));
	}
	
	public static void filter(String roleName){
		renderJSON(Role.assemTreeView(Role.findByCondition(roleName, null)));
	}
}
