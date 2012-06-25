package controllers;

import static models.User.Constant.LOGIN_USER_ATTR;
import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Fleet;

import play.cache.Cache;
import play.mvc.Controller;
import play.mvc.With;

import com.google.gson.Gson;

/**
 * Application entry contoller
 * @author weiwei
 *
 */
@With({Interceptor.class})
public class Application extends Controller {

	/**
	 * Home page
	 */
    public static void index() {
        Object user = Cache.get(LOGIN_USER_ATTR);
        String fleetJson = new Gson().toJson(Fleet.assemFleetTree());
        renderTemplate(renderArgs.get(THEME) + "/Application/index.html", user, fleetJson);
    }
    
    /**
     * Login page
     */
    public static void login() {
		renderTemplate(renderArgs.get(THEME)+"/users/login.html");
	}

    /**
     * Logout
     * @throws Throwable
     */
	public static void logout() throws Throwable {
		Cache.delete(LOGIN_USER_ATTR);
		login();
	}

	
	/**
	 * Management
	 */
    public static void admin(){
    	render(renderArgs.get(THEME) + "/Application/admin.html");
    }
    
}