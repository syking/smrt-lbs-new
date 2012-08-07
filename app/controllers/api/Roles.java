package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Permission;
import models.Role;
import models.User;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import vo.RoleVO;
import controllers.Interceptor;

/**
 * Roles API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Roles extends Controller{
	
	/**
	 * Fetch role's info
	 * @param role
	 */
	public static void index(final int page, final int pageSize, final RoleVO role){
		try{
			renderJSON(APICallback.success(Role.search(page, pageSize, role)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.ROLE_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Get role info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Role role = Role.fetchById(id);
			renderJSON(APICallback.success(new RoleVO(role)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.ROLE_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Create role info
	 * @param models
	 */
	public static void create(final RoleVO role) {
		
		try{
			RoleVO _role = Role.createByVO(role);
			renderJSON(APICallback.success(_role));
		} catch (Throwable e){
			renderJSON(APICallback.fail(role, APIError.ROLE_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update role info
	 * @param role
	 */
	public static void update(final RoleVO role){
		
		try{
			Role.updateByVO(role);
			renderJSON(APICallback.success(role));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.ROLE_UPDATE_FAIL, e.getMessage()));
		}
	}

	/**
	 * Delete role info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Role.deleteById(id);
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.ROLE_DESTROY_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Assign Role User and Role Permission
	 * @param roleId
	 * @param userIds
	 * @param permIds
	 */
	public static void createRelations(Long id, List<Long> user_ids, List<Long> perm_ids) {
		try{
			Role.assign(id, user_ids, perm_ids, false);
			renderJSON(APICallback.success());
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.ROLE_ASSIGN_FAIL, e.getMessage()));
		}
	}
	
	public static void destroyRelations(Long id, List<Long> user_ids, List<Long> perm_ids) {
		try{
			Role.unassign(id, user_ids, perm_ids);
			renderJSON(APICallback.success());
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.ROLE_UNASSIGN_FAIL, e.getMessage()));
		}
	}
	
	public static void relations(Long id) {
		try{
			Role role = Role.fetchById(id);
			Map map = new HashMap();
			map.put("users", User.toIds(role.users));
			map.put("perms", Permission.toIds(role.permissions));
			
			renderJSON(APICallback.success(map));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.ROLE_FETCH_FAIL, e.getMessage()));
		}
	}
}
