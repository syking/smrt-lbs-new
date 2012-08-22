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
import utils.CommonUtil;

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
	static void checkAuthenticated() {
		String sessionid = session.get(SESSION);// 从Cookie中获取sessionid
		User loginUser = Cache.get(sessionid, User.class);
		if (loginUser == null || CommonUtil.isBlank(sessionid) || !session.contains(SESSION)) {
			flash.put("url", "GET".equals(request.method) ? request.url : "/"); 
			Sessions.editNew();
		}
		
		renderArgs.put("user", loginUser.name);
		
		checkPermission(loginUser);
	}
	
	static void checkPermission(User loginUser) {
		Permission currentPerm = null;
		final String action = request.action;
		List<Permission> permDefinitions = Permission.findAll();
		if (permDefinitions == null || permDefinitions.isEmpty())
			return ;
		
		boolean flag = false;
		
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
				flag = loginUser.checkPerm(currentPerm);
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
		
		if (!flag){
			forbidden("Access denied");
		}
	}
	
	@Catch(Throwable.class)
    public static void logIllegalState(Throwable e) {
		e.printStackTrace();
		new Log("System", "-", e.toString(), null, "-", false).create();
		
		String msg = e.getMessage();
		if (CommonUtil.isBlank(msg)){
			msg = e.toString();
			if (CommonUtil.isBlank(msg)){
				msg = "Server Error!";
			}
		}
		
		response.status = 500;
		renderText(msg);
    }
}
