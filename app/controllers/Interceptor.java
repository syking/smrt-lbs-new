package controllers;

import static models.User.Constant.*;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Set;

import models.Log;
import models.Permission;
import models.Role;
import models.User;
import play.Play;
import play.cache.Cache;
import play.i18n.Lang;
import play.mvc.Before;
import play.mvc.Catch;
import play.mvc.Controller;
import play.mvc.Http;
import play.mvc.results.Result;

public class Interceptor extends Controller {

	@Before(priority = 0)
	static void setup() {
		Lang.set("en");
		renderArgs.put(THEME, "default");
		renderArgs.put("base", "");
		renderArgs.put("static_dir", "/public");
		renderArgs.put("apibase", "");
		renderArgs.put("language", Lang.get());
		renderArgs.put("baseUrl", "http://localhost:9000");
	}

	@Before(priority = 1, unless = { "Sessions.create", "Sessions.editNew", "Sessions.destroy" })
	static void checkAuthentification() {
		String userName = session.get(LOGIN_USER_ATTR);
		if (userName == null) {
			flash.put("url", "GET".equals(request.method) ? request.url : "/"); 
			Sessions.editNew();
		}

		User loginUser = Cache.get(session.getId()+"_"+LOGIN_USER_ATTR, User.class);
		if (loginUser == null)
			loginUser = User.findByName(userName);
		
		if (loginUser == null){
			flash.put("url", "GET".equals(request.method) ? request.url : "/"); 
			Sessions.editNew();
		}else{
			Cache.set(session.getId()+"_"+LOGIN_USER_ATTR, loginUser);
		}
		
		renderArgs.put("user", session.get(LOGIN_USER_ATTR));
		checkPermission();
	}
	
	static void checkPermission() {
		Permission currentPerm = null;
		final String action = request.action;
		List<Permission> permDefinitions = Permission.findAll();
		if (permDefinitions == null || permDefinitions.isEmpty())
			return ;
		
		boolean flag = false;
		
		User loginUser = Cache.get(session.getId()+"_"+LOGIN_USER_ATTR, User.class);
		if (loginUser.superPower == 1)
			flag = true ;
		
		if (!flag){
			for (Permission def : permDefinitions){
				if (def.action.equalsIgnoreCase(action)){
					currentPerm = def;
					break;
				}
			}
			
			//if current URI is not defined as a permission, just let it go...
			if (currentPerm == null)
				flag = true ;
			
			if (!flag){
				Set<Role> roles = loginUser.roles;
				if (roles != null && !roles.isEmpty()){
					for (Role r : roles){
						if (r.hasPermissions(currentPerm)){
							flag = true ;
							break;
						}
					}
				}
			}
		}
		
		final String ip = request.remoteAddress;
		String content = "";
		try {
			content = URLDecoder.decode(request.url, "utf-8");
		} catch (UnsupportedEncodingException e) {
			content = e.toString();
		}
		
		new Log("HTTP Access", action, content, loginUser, ip, flag).create();
		
		if (!flag)
			forbidden("Access denied");
	}
	
	@Catch(Throwable.class)
    public static void logIllegalState(Throwable e) {
		e.printStackTrace();
		new Log("System", "-", e.toString(), null, "-", false).create();
		forbidden("data error -> " + e.getMessage());
    }
}
