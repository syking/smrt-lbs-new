package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotations.Perm;

import models.Device;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
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
	@Perm
	public static void index(final int page, final int pageSize, final Device device){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Device.search(page, pageSize, device))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.DEVICE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get device info
	 * @param id
	 */
	@Perm
	public static void show(Long id){
		try{
			Device device = Device.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(device)));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.DEVICE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create device info
	 * @param models
	 */
	@Perm
	public static void create(final Device device) {
		
		try{
			Device _device = Device.createByVO(device);
			renderHtml(CommonUtil.toJson(APICallback.success(_device)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(device, APIError.DEVICE_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update device info
	 * @param device
	 */
	@Perm
	public static void update(final Device device){
		
		try{
			Device.updateByVO(device);
			renderHtml(CommonUtil.toJson(APICallback.success(device)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.DEVICE_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete device info
	 * @param id
	 */
	@Perm
	public static void destroy(Long id) {
		try{
			Device.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.DEVICE_DESTROY_FAIL, e.getMessage())));
		}
	}
}
