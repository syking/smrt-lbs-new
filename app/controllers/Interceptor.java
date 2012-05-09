package controllers;

import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.i18n.Lang;
import play.mvc.Before;
import play.mvc.Controller;

import java.util.HashMap;
import java.util.Map;

import static models.User.Constant.*;

public class Interceptor extends Controller {
	
	@Before(priority = 0)
	static void setup(){
		Lang.set("en");
		renderArgs.put(THEME, "default");
		renderArgs.put("base", "");
        renderArgs.put("static_dir", "/public");
        renderArgs.put("apibase", "");
        renderArgs.put("language", Lang.get());
        renderArgs.put("baseUrl", "http://localhost:9000");
		
	}
	
	@Before(priority = 1, unless={"Users.login", "authenticate", "Users.logout"})
    static void checkAccess() throws Throwable {
		
        if(Cache.get(LOGIN_USER_ATTR) == null) {
            flash.put("url", "GET".equals(request.method) ? request.url : "/"); // seems a good default
            login();
        }
        
        renderArgs.put("user", Cache.get(LOGIN_USER_ATTR));
    }
	
	static void login(){
		renderTemplate(renderArgs.get(THEME) + "/users/login.html");
	}
	
	/**
	 * 用户认证
	 * @param username
	 * @param password
	 * @throws Throwable
	 */
	public static void authenticate(@Required String username, String password) throws Throwable {
		Map map = new HashMap();
		boolean success = true;
        if(validation.hasErrors()) 
           success = false;
        
        User loginUser = User.login(username, password);
        if (loginUser == null)
        	success = false;
        
        if (!success)
        	 map.put("message", play.i18n.Messages.get("login-unsuccessful"));
        
        Cache.set(LOGIN_USER_ATTR, loginUser, LOGIN_ACTIVE_TIME);
       
        map.put("authenticate", success);
        map.put("redirectUrl", "/");
        
        renderJSON(map);
    }
	
	static void index() throws Throwable {
        redirect("/");
    }
}
