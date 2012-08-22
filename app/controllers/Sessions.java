package controllers;

import static models.User.Constant.*;

import java.util.HashMap;
import java.util.Map;

import annotations.Perm;

import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;

@With(Interceptor.class)
public class Sessions extends Controller{
	/**
     * Login page
     */
    public static void editNew() {
		renderTemplate(renderArgs.get(THEME)+"/Sessions/login.html");
	}

    /**
     * Logout
     */
	public static void destroy() {
		session.clear();
		editNew();
	}
	
	/**
	 * verify the user login
	 */
	public static void create(@Required String username, @Required String password) throws Throwable {
		boolean success = true;
        if(validation.hasErrors()) 
           success = false;
        
        User loginUser = null;
        try {
        	loginUser = new User(username, password, null, null).authen();
        } catch (Exception e){
        	success = false;
        }
        
        Map map = new HashMap();
        if (!success)
        	 map.put("message", play.i18n.Messages.get("login-unsuccessful"));
        else{
        	String sessionid = CommonUtil.uuid();
        	session.put(SESSION, sessionid);
        	Cache.set(sessionid, loginUser);
        	map.put("redirectUrl", "/admin");
        }
       
        map.put("authenticate", success);
        
        renderJSON(map);
    }
}
