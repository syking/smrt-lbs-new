package controllers.api;

import models.Vehicle;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.VehicleVO;

/**
 * Vehicles API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class Vehicles extends Controller{
	
	/**
	 * Fetch vehicle's info
	 * @param vehicle
	 */
	public static void index(final int page, final int pageSize, final VehicleVO vehicle){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Vehicle.search(page, pageSize, vehicle))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.VEHICLE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get vehicle info
	 * @param id
	 */
	public static void show(Long id){
		try{
			Vehicle vehicle = Vehicle.fetchById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(new VehicleVO().init(vehicle))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.VEHICLE_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Create vehicle info
	 * @param models
	 */
	public static void create(final VehicleVO vehicle) {
		
		try{
			VehicleVO _vehicle = Vehicle.createByVO(vehicle);
			renderHtml(CommonUtil.toJson(APICallback.success(_vehicle)));
		} catch (Throwable e){
			e.printStackTrace();
			renderHtml(CommonUtil.toJson(APICallback.fail(vehicle, APIError.VEHICLE_CERATE_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Update vehicle info
	 * @param vehicle
	 */
	public static void update(final VehicleVO vehicle){
		
		try{
			Vehicle.updateByVO(vehicle);
			renderHtml(CommonUtil.toJson(APICallback.success(vehicle)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.VEHICLE_UPDATE_FAIL, e.getMessage())));
		}
	}

	/**
	 * Delete vehicle info
	 * @param id
	 */
	public static void destroy(Long id) {
		try{
			Vehicle.deleteById(id);
			renderHtml(CommonUtil.toJson(APICallback.success(id)));
		} catch (Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(id, APIError.VEHICLE_DESTROY_FAIL, e.getMessage())));
		}
	}
	
}
