package controllers;

import static models.User.Constant.*;

import java.util.HashMap;
import java.util.Map;

import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.mvc.Controller;
import play.mvc.With;

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
		Cache.delete(session.getId()+"_"+LOGIN_USER_ATTR);
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
        
        User loginUser = new User(username, password, null, null).authen();
        if (loginUser == null)
        	success = false;
        
        Map map = new HashMap();
        if (!success)
        	 map.put("message", play.i18n.Messages.get("login-unsuccessful"));
        else{
        	session.put(LOGIN_USER_ATTR, loginUser.name);
        	// keep the user roles and permissions info to the Cache !!
        	Cache.set(session.getId()+"_"+LOGIN_USER_ATTR, loginUser);
        	
        	map.put("redirectUrl", "/admin");
        }
       
        map.put("authenticate", success);
        
        renderJSON(map);
    }
}
