package controllers.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Permission;
import models.Role;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.RoleVO;

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
			renderHtml(CommonUtil.toJson(APICallback.success(Role.search(page, pageSize, role))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.ROLE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get role info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Role role = Role.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new RoleVO(role))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.ROLE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create role info
	 * @param models
	 */
	public static void create(final RoleVO role) {
		
		try{
			RoleVO _role = Role.createByVO(role);
			renderHtml(CommonUtil.toJson(APICallback.success(_role)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(role, APIError.ROLE_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update role info
	 * @param role
	 */
	public static void update(final RoleVO role){
		
		try{
			Role.updateByVO(role);
			renderHtml(CommonUtil.toJson(APICallback.success(role)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.ROLE_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete role info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Role.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.ROLE_DESTROY_FAIL, e.getMessage())));
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
			renderHtml(CommonUtil.toJson(APICallback.success()));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.ROLE_ASSIGN_FAIL, e.getMessage())));
		}
	}
	
	public static void destroyRelations(Long id, List<Long> user_ids, List<Long> perm_ids) {
		try{
			Role.unassign(id, user_ids, perm_ids);
			renderHtml(CommonUtil.toJson(APICallback.success()));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.ROLE_UNASSIGN_FAIL, e.getMessage())));
		}
	}
	
	public static void relations(Long id) {
		try{
			Role role = Role.fetchById(id);
			Map map = new HashMap();
			map.put("users", User.toIds(role.users));
			map.put("perms", Permission.toIds(role.permissions));
			
			renderHtml(CommonUtil.toJson(APICallback.success(map)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.ROLE_FETCH_FAIL, e.getMessage())));
		}
	}
}
