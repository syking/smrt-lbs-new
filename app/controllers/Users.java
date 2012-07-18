package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Role;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.UserVO;
import annotations.Permission;

@With(Interceptor.class)
public class Users extends Controller {

	public static void grid(String id){
		List<Role> roleList = Role.findAll();
		List<ComboVO> roles = new ArrayList<ComboVO>();
		if (roleList != null)
    		for (Role role : roleList)
    			roles.add(new ComboVO(role.name, role.name));
    		
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		final String preUrl = "/Users/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.searchUrl = preUrl + "search";
		grid.editable = "popup";

		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(UserVO.class, "id"));
		map.put("grid", grid);
    	map.put("roles", CommonUtil.getGson().toJson(roles));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Users/grid.html")).render(map));
	}

	@Permission
	public static void read(){
		List<UserVO> result = new ArrayList<UserVO>();
		List<User> users = User.find("order by id desc").fetch();
		if (users == null)
			return ;

		for (User u : users)
			result.add(new UserVO(u));

		renderJSON(result);
	}

	@Permission
	public static void create(String models) {
		if (User.createByJson(models))
			renderJSON(models);
	}

	@Permission
	public static void update(String models){
		if (User.updateByJson(models))
			renderJSON(models);

	}

	@Permission
	public static void destroy(String models) {
		if (User.deleteByJson(models))
			renderJSON(models);
	}

	@Permission
	public static void search(String roleName, String userName, String account, String desc){
		List<User> users = User.findByCondition(roleName, userName, account, desc);
		if (users == null || users.isEmpty()) 
			return ;

		List<UserVO> result = new ArrayList<UserVO>(users.size());
		for (User u : users){
			result.add(new UserVO(u));
		}

		renderJSON(result);
	}

}