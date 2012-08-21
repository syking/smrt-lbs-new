package controllers;

import static models.User.Constant.SESSION;
import static models.User.Constant.THEME;

import java.util.HashMap;
import java.util.Map;

import models.User;
import play.cache.Cache;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.Grid;
import vo.UserVO;
import annotations.Perm;

@With(Interceptor.class)
public class Users extends Controller {

	public static void grid(String id){
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
    	//map.put("roles", CommonUtil.getGson().toJson(roles));
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Users/grid.html")).render(map));
	}

	@Perm
	public static void read(int page, int pageSize){
		renderJSON(User.search(page, pageSize, null, null, null));
	}

	@Perm
	public static void create(String models) {
		renderJSON(User.createByJson(models));
	}

	@Perm
	public static void update(String models){
		if (User.updateByJson(models))
			renderJSON(models);
	}

	@Perm
	public static void destroy(String models) {
		if (User.deleteByJson(models))
			renderJSON(models);
	}

	@Perm
	public static void search(int page, int pageSize, String userName, String account, String desc){
		renderJSON(User.search(page, pageSize, userName, account, desc));
	}
	
	public static void editPassword(String id){
		Map map = new HashMap();
		map.put("tabId", id);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Users/editPassword.html")).render(map));
	}
	
	public static void changePassword(String password, String newPassword, String confirmNewPassword){
		String userName = (String) renderArgs.get("user");
		User loginUser = User.findByName(userName);
		User.changePassword(loginUser, password, newPassword, confirmNewPassword);
		
		renderHtml(CommonUtil.toJson(CommonUtil.map("success", true)));
	}
	
	public static void editProfile(String id) {
		String userName = (String) renderArgs.get("user");
		User loginUser = User.findByName(userName);
		loginUser.password = null;
		loginUser.roles = null;
		Map map = new HashMap();
		map.put("tabId", id);
		map.put("user", new UserVO(loginUser));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Users/editProfile.html")).render(map));
	}
	
	public static void updateProfile(UserVO user){
		String userName = (String) renderArgs.get("user");
		User loginUser = User.findByName(userName);
		UserVO loginUserVO = new UserVO(loginUser);
		loginUserVO.id = user.id;
		loginUserVO.name = user.name;
		loginUserVO.desc = user.desc;
		User.updateByVO(loginUserVO);
		String sessionid = session.get(SESSION);
		User _user = User.fetchById(loginUser.id);
		Cache.set(sessionid, _user);
		
		renderHtml(CommonUtil.toJson(CommonUtil.map("success", true)));
	}
}