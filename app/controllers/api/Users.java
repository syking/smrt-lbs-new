package controllers.api;

import static models.User.Constant.LOGIN_USER_ATTR;

import java.util.ArrayList;
import java.util.List;

import models.CallBack;
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
@With(Interceptor.class)
public class Users extends Controller{
	
	/**
	 * Verify the User info
	 * @param user	Login User
	 */
	public static void authenticate(final User user){
        final CallBack callback = new CallBack();
        
        try{
	        User loginUser = user.authen();
	        if (loginUser == null){
	        	callback.setSuccess(false);
	        	callback.setMessage(Messages.get("login-unsuccessful"));
	        }else{
		        /* TODO change the session keep strategy */
		        Cache.set(LOGIN_USER_ATTR, loginUser);
		        callback.setData("{\"redirectUrl\":\"/\"}");
	        }
        } catch (Throwable t){
        	callback.setSuccess(false);
        	callback.setData(t.getMessage());
        }
        
        renderJSON(callback);
    }
	
	/**
	 * Get user info
	 * @param id
	 */
	public static void show(Long id){
		final CallBack callback = new CallBack();
		
		try{
			User user = User.findById(id);
			user.roles = null;
			callback.setData(user);
		}catch(Throwable e){
			callback.setSuccess(false);
			callback.setMessage(e.getMessage());
		}
		
		renderJSON(callback);
	}
	
	/**
	 * Create user info
	 * @param models
	 */
	public static void create(final User user) {
		final CallBack callback = new CallBack();
		
		if (user == null){
			callback.setSuccess(false);
			callback.setMessage("User info required !");
		}else{
			try{
				boolean flag = user.create();
				if (!flag){
					callback.setSuccess(false);
					callback.setMessage("Cannot create user info !");
				}
			} catch (Throwable e){
				callback.setSuccess(false);
				callback.setMessage(e.getMessage());
			}
		}
			
		renderJSON(callback);
	}
	
	/**
	 * Update user info
	 * @param user
	 */
	public static void update(final User user){
		final CallBack callback = new CallBack();
		
		if (user == null){
			callback.setSuccess(false);
			callback.setMessage("User info required !");
		}else{
			try{
				user.save();
			} catch (Throwable e){
				callback.setSuccess(false);
				callback.setMessage(e.getMessage());
			}
		}
			
		renderJSON(callback);
		
	}

	/**
	 * Delete user info
	 * @param id
	 */
	public static void delete(Long id) {
		final CallBack callback = new CallBack();
		
		final User user = User.findById(id);
		if (user == null){
			callback.setSuccess(false);
			callback.setMessage("User info is invalid !");
		}else{
			try{
				user.delete();
			} catch (Throwable e){
				callback.setSuccess(false);
				callback.setMessage(e.getMessage());
			}
		}
			
		renderJSON(callback);
	}
	
	/**
	 * Fetch user's info
	 * @param user
	 */
	public static void fetch(final String roleName, final User user){
		final CallBack callback = new CallBack();
		
		try{
			List<UserVO> result = new ArrayList<UserVO>();
			List<User> users = User.findByCondition(roleName, user.name, user.account, user.desc);
			if (users != null){
				for (User u : users){
					result.add(new UserVO(u));
				}
			}
			callback.setData(result);
		}catch(Throwable e){
			callback.setSuccess(false);
			callback.setMessage(e.getMessage());
		}
		
		renderJSON(callback);
	}
}
