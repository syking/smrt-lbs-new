package controllers.api;

import models.Schedule;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.ScheduleVO;

/**
 * Schedules API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Schedules extends Controller{
	
	/**
	 * Fetch schedule's info
	 * @param schedule
	 */
	public static void index(final int page, final int pageSize, final ScheduleVO schedule){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Schedule.search(page, pageSize, schedule))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.SCHEDULE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get schedule info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Schedule schedule = Schedule.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new ScheduleVO(schedule))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.SCHEDULE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create schedule info
	 * @param models
	 */
	public static void create(final ScheduleVO schedule) {
		
		try{
			ScheduleVO _schedule = Schedule.createByVO(schedule);
			renderHtml(CommonUtil.toJson(APICallback.success(_schedule)));
		} catch (Throwable e){
			e.printStackTrace();
			renderHtml(CommonUtil.toJson(APICallback.fail(schedule, APIError.SCHEDULE_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update schedule info
	 * @param schedule
	 */
	public static void update(final ScheduleVO schedule){
		
		try{
			Schedule.updateByVO(schedule);
			renderHtml(CommonUtil.toJson(APICallback.success(schedule)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.SCHEDULE_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete schedule info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Schedule.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.SCHEDULE_DESTROY_FAIL, e.getMessage())));
		}
	}
	
}
