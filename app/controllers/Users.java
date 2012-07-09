package controllers;

import static models.User.Constant.LOGIN_USER_ATTR;
import static models.User.Constant.THEME;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Counselling;
import models.Driver;
import models.Role;
import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.CounselVO;
import vo.Grid;
import vo.UserVO;

@With(Interceptor.class)
public class Users extends Controller {

	/**
	 * verify the user login
	 */
	public static void authenticate(@Required String username, @Required String password) throws Throwable {
		boolean success = true;
        if(validation.hasErrors()) 
           success = false;
        
        User loginUser = new User(username, password, null, null).authen();
        if (loginUser == null)
        	success = false;
        
        Map map = new HashMap();
        if (!success)
        	 map.put("message", play.i18n.Messages.get("login-unsuccessful"));
        
        Cache.set(LOGIN_USER_ATTR, loginUser);
       
        map.put("authenticate", success);
        map.put("redirectUrl", "/");
        
        renderJSON(map);
    }

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

	public static void read(){
		List<UserVO> result = new ArrayList<UserVO>();
		List<User> users = User.findAll();
		if (users == null)
			return ;

		for (User u : users)
			result.add(new UserVO(u));

		renderJSON(result);
	}

	public static void create(String models) {
		if(models == null)
			return;

		User.createByJson(models);

		renderJSON(models);
	}

	public static void update(String models){
		if(models==null)
			return;
		User.updateByJson(models);

		renderJSON(models);

	}

	public static void destroy(String models) {
		if (models == null)
			return ;
		User.deleteByJson(models);

		renderJSON(models);
	}

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