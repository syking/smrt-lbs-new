package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import models.Driver;
import models.Permission;
import models.Department;
import models.Role;
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
	
	/**
	 * Fetch dept's info
	 */
	public static void index(final int page, final int pageSize, final DepartmentVO department){
		try{
			renderJSON(APICallback.success(Department.search(page, pageSize, department)));
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
	public static void create(final DepartmentVO department) {
		
		try{
			DepartmentVO _dept = Department.createByVO(department);
			renderJSON(APICallback.success(_dept));
		} catch (Throwable e){
			renderJSON(APICallback.fail(department, APIError.DEPT_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update dept info
	 */
	public static void update(final DepartmentVO department){
		
		try{
			Department.updateByVO(department);
			renderJSON(APICallback.success(department));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_UPDATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Delete department info
	 * @param id
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
	 * Assign Drivers to a Permission
	 */
	public static void createRelations(Long id, List<Long> driver_ids, List<Long> leader_ids) {
		try{
			Department.assign(id, driver_ids, leader_ids, false);
			renderJSON(APICallback.success());
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_ASSIGN_FAIL, e.getMessage()));
		}
	}
	
	public static void destroyRelations(Long id, List<Long> driver_ids, List<Long> leader_ids) {
		try{
			Department.unassign(id, driver_ids, leader_ids);
			renderJSON(APICallback.success());
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_UNASSIGN_FAIL, e.getMessage()));
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
	
	public static void assignables(){
		try{
			List<Driver> validList = Driver.assignables();
			Map map = new HashMap();
			map.put("drivers", Driver.toIds(validList));
			
			renderJSON(APICallback.success(map));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEPT_FETCH_FAIL, e.getMessage()));
		}
	}
}
