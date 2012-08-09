package controllers.api;

import models.User;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.UserVO;

/**
 * Users API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Users extends Controller{
	
	/**
	 * Fetch user's info
	 * @param user
	 */
	public static void index(final int page, final int pageSize, final UserVO user){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(User.search(page, pageSize, user))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.USER_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get user info
	 * @param id
	 */
	public static void show(Long id){
		try{
			User user = User.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new UserVO(user))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.USER_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create user info
	 * @param models
	 */
	public static void create(final UserVO user) {
		
		try{
			UserVO _user = User.createByVO(user);
			renderHtml(CommonUtil.toJson(APICallback.success(_user)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(user, APIError.USER_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update user info
	 * @param user
	 */
	public static void update(final UserVO user){
		
		try{
			User.updateByVO(user);
			renderHtml(CommonUtil.toJson(APICallback.success(user)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.USER_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete user info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			User.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.USER_DESTROY_FAIL, e.getMessage())));
		}
	}
}
