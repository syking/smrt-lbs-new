package controllers;

import static models.User.Constant.THEME;

import java.util.List;

import models.Fleet;
import play.mvc.Controller;
import play.mvc.With;
import vo.TreeView;
import annotations.Perm;

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
	@Perm
    public static void index() {
        List<TreeView> tree = Fleet.assemFleetTree();
        String fleetJson = new Gson().toJson(tree);
        renderTemplate(renderArgs.get(THEME) + "/Application/index.html", fleetJson);
    }
    
	/**
	 * Management
	 */
	@Perm
    public static void admin(){
    	render(renderArgs.get(THEME) + "/Application/admin.html");
    }
    
}