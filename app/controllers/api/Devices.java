package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Device;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import controllers.Interceptor;

/**
 * Devices API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Devices extends Controller{
	
	/**
	 * Fetch device's info
	 * @param device
	 */
	public static void index(final int page, final int pageSize, final Device device){
		try{
			renderJSON(APICallback.success(Device.search(page, pageSize, device)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DEVICE_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Get device info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Device device = Device.fetchById(id);
			renderJSON(APICallback.success(device));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.DEVICE_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Create device info
	 * @param models
	 */
	public static void create(final Device device) {
		
		try{
			Device _device = Device.createByVO(device);
			renderJSON(APICallback.success(_device));
		} catch (Throwable e){
			renderJSON(APICallback.fail(device, APIError.DEVICE_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update device info
	 * @param device
	 */
	public static void update(final Device device){
		
		try{
			Device.updateByVO(device);
			renderJSON(APICallback.success(device));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.DEVICE_UPDATE_FAIL, e.getMessage()));
		}
	}

	/**
	 * Delete device info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Device.deleteById(id);
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.DEVICE_DESTROY_FAIL, e.getMessage()));
		}
	}
}
