package controllers.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Counselling;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import vo.CounselVO;
import controllers.Interceptor;

/**
 * Counsellings API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Counsellings extends Controller{
	
	/**
	 * Fetch counselling's info
	 * @param counselling
	 */
	public static void index(final int page, final int pageSize, final CounselVO counselling){
		try{
			renderJSON(APICallback.success(Counselling.search(page, pageSize, counselling)));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.COUNSELLING_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Get counselling info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Counselling counselling = Counselling.fetchById(id);
			renderJSON(APICallback.success(counselling));
		}catch(Throwable e){
			renderJSON(APICallback.fail(APIError.COUNSELLING_FETCH_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Create counselling info
	 * @param models
	 */
	public static void create(final CounselVO counselling) {
		
		try{
			CounselVO _counselling = Counselling.createByVO(counselling, counselling.userName);
			renderJSON(APICallback.success(_counselling));
		} catch (Throwable e){
			renderJSON(APICallback.fail(counselling, APIError.COUNSELLING_CERATE_FAIL, e.getMessage()));
		}
	}
	
	/**
	 * Update counselling info
	 * @param counselling
	 */
	public static void update(final CounselVO counselling){
		
		try{
			Counselling.updateByVO(counselling, counselling.userName);
			renderJSON(APICallback.success(counselling));
		} catch (Throwable e){
			renderJSON(APICallback.fail(APIError.COUNSELLING_UPDATE_FAIL, e.getMessage()));
		}
	}

	/**
	 * Delete counselling info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Counselling.deleteById(id);
			renderJSON(APICallback.success(id));
		} catch (Throwable e){
			renderJSON(APICallback.fail(id, APIError.COUNSELLING_DESTROY_FAIL, e.getMessage()));
		}
	}
}