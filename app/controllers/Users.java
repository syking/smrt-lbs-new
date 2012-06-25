package controllers;

import java.util.HashMap;
import java.util.Map;

import models.User;
import play.cache.Cache;
import play.data.validation.Required;
import play.i18n.Lang;
import play.mvc.Before;
import play.mvc.Controller;
import play.mvc.With;
import static models.User.Constant.*;

@With(Interceptor.class)
public class Users extends Controller {
	/**
	 * 用户认证
	 * @param username
	 * @param password
	 * @throws Throwable
	 */
	public static void authenticate(@Required String username, String password) throws Throwable {
		boolean success = true;
        if(validation.hasErrors()) 
           success = false;
        
        Map map = new HashMap();
        User loginUser = User.authenticate(username, password);
        if (loginUser == null)
        	success = false;
        
        if (!success)
        	 map.put("message", play.i18n.Messages.get("login-unsuccessful"));
        
        Cache.set(LOGIN_USER_ATTR, loginUser);
       
        map.put("authenticate", success);
        map.put("redirectUrl", "/");
        
        renderJSON(map);
    }
}
