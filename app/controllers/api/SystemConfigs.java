package controllers.api;

import annotations.Perm;
import models.SystemConfig;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;

/**
 * SystemConfigs API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class SystemConfigs extends Controller{
	
	/**
	 * Fetch systemconfig's info
	 * @param systemconfig
	 */
	@Perm
	public static void index(final int page, final int pageSize){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(SystemConfig.search(page, pageSize))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.SYSTEMCONFIG_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get systemconfig info
	 * @param id
	 */
	@Perm
	public static void show(Long id){
		try{
			SystemConfig systemconfig = SystemConfig.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(systemconfig)));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.SYSTEMCONFIG_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create systemconfig info
	 * @param models
	 */
	@Perm
	public static void create(final SystemConfig systemconfig) {
		
		try{
			SystemConfig _systemconfig = SystemConfig.createByVO(systemconfig);
			renderHtml(CommonUtil.toJson(APICallback.success(_systemconfig)));
		} catch (Throwable e){
			e.printStackTrace();
			renderHtml(CommonUtil.toJson(APICallback.fail(systemconfig, APIError.SYSTEMCONFIG_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update systemconfig info
	 * @param systemconfig
	 */
	@Perm
	public static void update(final SystemConfig systemconfig){
		
		try{
			SystemConfig.updateByVO(systemconfig);
			renderHtml(CommonUtil.toJson(APICallback.success(systemconfig)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.SYSTEMCONFIG_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete systemconfig info
	 * @param id
	 */
	@Perm
	public static void destroy(Long id) {
		try{
			SystemConfig.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.SYSTEMCONFIG_DESTROY_FAIL, e.getMessage())));
		}
	}
	
}
