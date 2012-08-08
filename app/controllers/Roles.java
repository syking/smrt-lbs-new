package controllers;

import static models.User.Constant.THEME;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Permission;
import models.Role;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.Grid;
import vo.RoleVO;
import annotations.Perm;

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
	
	public static void read(int page, int pageSize){
		renderJSON(Role.search(page, pageSize, null, null));
	}
	
	@Perm
	public static void create(String models) {
		renderJSON(Role.createByJson(models));
	}
	
	@Perm
	public static void update(String models){
		if (Role.updateByJson(models))
			renderJSON(models);
		
	}

	@Perm
	public static void destroy(String models) {
		if (Role.deleteByJson(models))
			renderJSON(models);
	}
	
	public static void search(int page, int pageSize, String roleName, String desc){
		renderJSON(Role.search(page, pageSize, roleName, desc));
	}
	
	@Perm
	public static void assign(String id){
		Map map = new HashMap();
		map.put("tabid", id);
		Gson gson = new Gson();
		map.put("roles", gson.toJson(Role.assemTreeView()));
		map.put("users", gson.toJson(User.assemTreeView()));
		map.put("perms", gson.toJson(Permission.assemTreeView()));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Roles/assign.html")).render(map));
	}
	
	@Perm
	public static void assignUserAndPerm(String roleName, List<Long> users, List<Long> perms){
		Map map = new HashMap();
		try{
			Role.assignUserAndPerm(roleName, users, perms);
			map.put("success", true);
		}catch(Exception e){
			map.put("success", false);
			map.put("msg", e.getMessage());
		}
		
		renderJSON(map);
	}
	
	public static void users(String roleName){
		Role role = Role.findByName(roleName);
		renderJSON(User.toIds(role.users));
	}
	
	public static void perms(String roleName){
		Role role = Role.findByName(roleName);
		renderJSON(Permission.toIds(role.permissions));
	}
	
	public static void filter(String roleName){
		renderJSON(Role.assemTreeView(Role.findByCondition(-1, -1, roleName, null)));
	}
}
