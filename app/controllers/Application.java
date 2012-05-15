package controllers;

import static models.User.Constant.LOGIN_USER_ATTR;
import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import play.cache.Cache;
import play.mvc.Controller;
import play.mvc.With;
import services.FleetService;

import com.google.gson.Gson;

@With({Interceptor.class})
public class Application extends Controller {

    public static void index() {
        Object user = Cache.get(LOGIN_USER_ATTR);
        String fleetJson = new Gson().toJson(FleetService.assemFleetTree());
        renderTemplate(renderArgs.get(THEME) + "/Application/index.html", user, fleetJson);
    }
    
    public static void admin(){
    	render(renderArgs.get(THEME) + "/Application/admin.html");
    }
    
    public static void report() {
    	render(renderArgs.get(THEME) + "/Application/report.html");
    }
    
}