package controllers.api;

import models.Log;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.LogVO;
import annotations.Perm;

/**
 * Logs API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Logs extends Controller{
	
	/**
	 * Fetch log's info
	 * @param log
	 */
	@Perm
	public static void index(final int page, final int pageSize, final LogVO log, final String start, final String end){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Log.search(page, pageSize, log, start, end))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.LOG_FETCH_FAIL, e.getMessage())));
		}
	}
	/**
	 * Delete log info
	 * @param id
	 */
	@Perm
	public static void destroy(Long id) {
		try{
			Log.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.LOG_DESTROY_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get log info
	 * @param id
	 */
	@Perm
	public static void show(Long id){
		try{
			Log log = Log.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new LogVO().init(log))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.LOG_FETCH_FAIL, e.getMessage())));
		}
	}

}
