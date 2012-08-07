package controllers.api;

import static models.User.Constant.LOGIN_USER_ATTR;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import models.Log;
import models.Permission;
import models.User;
import controllers.Sessions;
import play.cache.Cache;
import play.mvc.Before;
import play.mvc.Catch;
import play.mvc.Controller;

/**
 * @author weiwei
 *
 */
public class APIInterceptor extends Controller{
	@Before(priority = 1, unless = { "api.Sessions.create", "api.Sessions.destroy" })
	static void checkAuthenticated(final String session_id) {
//		APICallback cb = new APICallback();
//		cb.setRequest_uri(request.url);
//		if (session_id == null){
//			cb.setSuccess(false);
//			cb.setError(APIError.USER_LOGIN_REQUIRED);
//			cb.setError_desc("Session ID required");
//			renderJSON(cb);
//			return ;
//		}
//			
//		User loginUser = null;
//		if (session_id != null)
//			loginUser = Cache.get(session_id, User.class);
//		
//		if (loginUser == null){
//			cb.setSuccess(false);
//			cb.setError(APIError.USER_LOGIN_REQUIRED);
//			cb.setError_desc("Session ID invalid or not login");
//			renderJSON(cb);
//			return ;
//		}
//		
//		checkPermission(session_id);
	}
	
	static void checkPermission(final String sessionid) {
		Permission currentPerm = null;
		final String action = request.action;
		List<Permission> permDefinitions = Permission.findAll();
		if (permDefinitions == null || permDefinitions.isEmpty())
			return ;
		
		boolean flag = false;
		
		User loginUser = Cache.get(sessionid, User.class);
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
			APICallback cb = new APICallback();
			cb.setSuccess(false);
			cb.setError(APIError.ACCESS_DENIED);
			cb.setError_desc("You don't have permission to access this resource");
			cb.setRequest_uri(request.url);
			
			renderJSON(cb);
		}
	}
}
