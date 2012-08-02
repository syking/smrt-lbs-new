package controllers.api;

import static models.User.Constant.LOGIN_USER_ATTR;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.User;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import vo.UserVO;
import controllers.Interceptor;

/**
 * Users API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Users extends Controller{
	
	public static void index(final int page, final int pageSize){
		try{
			renderJSON(APICallback.success(User.search(page, pageSize, null)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.USER_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Fetch user's info
	 * @param user
	 */
	public static void search(final int page, final int pageSize, final UserVO user){
		try{
			renderJSON(APICallback.success(User.search(page, pageSize, user)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.USER_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Get user info
	 * @param id
	 */
	public static void show(Long id){
		try{
			User user = User.fetchById(id);
			renderJSON(APICallback.success(new UserVO(user)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.USER_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Create user info
	 * @param models
	 */
	public static void create(final UserVO user) {
		
		try{
			UserVO _user = User.createByVO(user);
			renderJSON(APICallback.success(_user));
		} catch (Throwable e){
			renderJSON(APICallback.fail(user, APIError.USER_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update user info
	 * @param user
	 */
	public static void update(final UserVO user){
		
		try{
			User.updateByVO(user);
			renderJSON(APICallback.success(user));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.USER_UPDATE_FAIL, e.getMessage()));
		}
	}

	/**
	 * Delete user info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			User.deleteById(id);
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.USER_DESTROY_FAIL, e.getMessage()));
		}
	}
}
