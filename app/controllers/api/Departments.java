package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Driver;
import models.Permission;
import models.Department;
import models.User;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import vo.DepartmentVO;
import controllers.Interceptor;

/**
 * Departments API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Departments extends Controller{
	
	public static void index(final int page, final int pageSize){
		try{
			renderJSON(APICallback.success(Department.search(page, pageSize, null)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Fetch dept's info
	 */
	public static void search(final int page, final int pageSize, final DepartmentVO dept){
		try{
			renderJSON(APICallback.success(Department.search(page, pageSize, dept)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Get dept info
	 */
	public static void show(Long id){
		try{
			Department dept = Department.fetchById(id);
			renderJSON(APICallback.success(new DepartmentVO(dept)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Create dept info
	 */
	public static void create(final DepartmentVO dept) {
		
		try{
			DepartmentVO _dept = Department.createByVO(dept);
			renderJSON(APICallback.success(_dept));
		} catch (Throwable e){
			renderJSON(APICallback.fail(dept, APIError.DEPT_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update dept info
	 */
	public static void update(final DepartmentVO dept){
		
		try{
			Department.updateByVO(dept);
			renderJSON(APICallback.success(dept));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_UPDATE_FAIL, e.getMessage()));
		}
	}

	/**
	 * Delete dept info
	 */
	public static void destroy(Long id) {
		try{
			Department.deleteById(id);
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.DEPT_DESTROY_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Assign Department Driver and Department Leader
	 */
	public static void assign(Long id, List<Long> driver_ids, List<Long> leader_ids) {
		renderText(id + ", " + driver_ids + ", " + leader_ids);
		try{
			Department.assign(id, driver_ids, leader_ids);
			renderJSON(APICallback.success());
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_ASSIGN_FAIL, e.getMessage()));
		}
	}
	
	public static void relations(Long id) {
		try{
			Department dept = Department.fetchById(id);
			Map map = new HashMap();
			map.put("drivers", Driver.toIds(dept.drivers));
			map.put("leaders", Driver.toIds(dept.leaders));
			
			renderJSON(APICallback.success(map));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_FETCH_FAIL, e.getMessage()));
		}
	}
}
