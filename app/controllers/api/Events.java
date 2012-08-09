package controllers.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Event;
import play.cache.Cache;
import play.i18n.Messages;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.EventGPS;
import vo.EventVO;
import controllers.Interceptor;

/**
 * Events API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Events extends Controller{
	
	/**
	 * Fetch event's info
	 * @param event
	 */
	public static void index(final int page, final int pageSize, Date startTime, Date endTime,  final EventVO event){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Event.search(page, pageSize, startTime, endTime, event))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.EVENT_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get event info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Event event = Event.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new EventVO().init(event))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.EVENT_FETCH_FAIL, e.getMessage())));
		}
	}

}
