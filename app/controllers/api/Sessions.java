package controllers.api;

import models.User;
import play.cache.Cache;
import play.mvc.Controller;
import utils.CommonUtil;

public class Sessions extends Controller {

	/**
	 * Verify the User info
	 * 
	 * @param user
	 *            Login User
	 */
	public static void create(final String account, final String password) {
		try {
			User loginUser = new User(account, password, null, null).authen();
			final String sid = CommonUtil.uuid();
			Cache.set(sid, loginUser);
			renderHtml(CommonUtil.toJson(APICallback.success(CommonUtil.map("session_id", sid))));
		} catch (Throwable e) {
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.USER_LOGIN_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Destroy session
	 * @param session_id
	 */
	public static void destroy(final String session_id){
		if (session_id == null || Cache.get(session_id) == null){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.USER_LOGOUT_FAIL, "Session ID invalid")));
			return ;
		}
		
		Cache.delete(session_id);
		
		renderHtml(CommonUtil.toJson(APICallback.success(CommonUtil.map("session_id", session_id))));
	}

}
