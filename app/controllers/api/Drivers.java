package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Driver;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import vo.DriverVO;
import controllers.Interceptor;

/**
 * Drivers API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Drivers extends Controller{
	
	/**
	 * Fetch driver's info
	 * @param driver
	 */
	public static void index(final int page, final int pageSize, final DriverVO driver){
		try{
			renderJSON(APICallback.success(Driver.search(page, pageSize, driver)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DRIVER_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Get driver info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Driver driver = Driver.fetchById(id);
			renderJSON(APICallback.success(new DriverVO().init(driver)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DRIVER_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Create driver info
	 * @param models
	 */
	public static void create(final DriverVO driver) {
		
		try{
			DriverVO _driver = Driver.createByVO(driver);
			renderJSON(APICallback.success(_driver));
		} catch (Throwable e){
			renderJSON(APICallback.fail(driver, APIError.DRIVER_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update driver info
	 * @param driver
	 */
	public static void update(final DriverVO driver){
		
		try{
			Driver.updateByVO(driver);
			renderJSON(APICallback.success(driver));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DRIVER_UPDATE_FAIL, e.getMessage()));
		}
	}

	/**
	 * Delete driver info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Driver.deleteById(id);
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.DRIVER_DESTROY_FAIL, e.getMessage()));
		}
	}
}
