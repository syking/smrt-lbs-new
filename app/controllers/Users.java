package controllers;

import static models.User.Constant.LOGIN_USER_ATTR;

import java.util.HashMap;
import java.util.Map;

import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.mvc.Controller;
import play.mvc.With;

@With(Interceptor.class)
public class Users extends Controller {
	
	/**
	 * verify the user login
	 */
	public static void authenticate(@Required String username, @Required String password) throws Throwable {
		boolean success = true;
        if(validation.hasErrors()) 
           success = false;
        
        User loginUser = User.authenticate(username, password);
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
}
