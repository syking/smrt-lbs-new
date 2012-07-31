package controllers.api;

import static models.User.Constant.LOGIN_USER_ATTR;

import java.util.ArrayList;
import java.util.List;

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
	
	/**
	 * Get user info
	 * @param id
	 */
	public static void show(Long id){
		try{
			User user = User.findById(id);
			renderJSON(APICallback.success(new UserVO(user)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.ACCESS_DENIED, e.getMessage()));
		}
	}
	
	/**
	 * Create user info
	 * @param models
	 */
	public static void create(final UserVO user) {
		if (user == null){
			renderJSON(APICallback.user_info_required());
			return ;
		}
		
		try{
			UserVO _user = User.createByVO(user);
			if (_user == null || _user.id == null || _user.id.isEmpty()){
				renderJSON(APICallback.fail(user, APIError.USER_CERATE_FAIL, "User create fail"));
				return ;
			}
			
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
		if (user == null){
			renderJSON(APICallback.user_info_required());
			return ;
		}
		
		try{
			boolean flag = User.updateByVO(user);
			if (!flag){
				renderJSON(APICallback.fail(user, APIError.USER_CERATE_FAIL, "User update fail"));
				return ;
			}
			
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
			if (id == null){
				renderJSON(APICallback.fail(APIError.USER_DESTROY_FAIL, "User id required"));
				return ;
			}
			final User user = User.findById(id);
			if (user == null){
				renderJSON(APICallback.fail(APIError.USER_DESTROY_FAIL, "User id invalid"));
				return ;
			}
		
			user.delete();
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.USER_DESTROY_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Fetch user's info
	 * @param user
	 */
	public static void fetch(final String roleName, final String name, final String account, final String desc){
		try{
			List<User> users = User.findByCondition(roleName, name, account, desc);
			List<UserVO> result = User.assemVO(users);
			renderJSON(APICallback.success(result));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.USER_FETCH_FAIL, e.getMessage()));
		}
	}
}
