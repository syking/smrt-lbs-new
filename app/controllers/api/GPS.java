package controllers.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotations.Perm;

import models.Event;
import models.Location;
import models.Vehicle;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.EventGPS;
import vo.EventVO;
import vo.VehicleGPS;

/**
 * GPS API
 * @author weiwei
 *
 */
@With(APIInterceptor.class)
public class GPS extends Controller{
	
	/**
	 * Get Vehicle Current GPS Data by fleet
	 * @param id
	 */
	@Perm
	public static void vehicles(long[] fleet_ids) {
		try{
			List<Vehicle> vehicles = Vehicle.filterByFleet(fleet_ids);
			renderHtml(CommonUtil.toJson(APICallback.success(Vehicle.findGPS(vehicles))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get Vehicle Current GPS Data by id
	 * @param id
	 */
	@Perm
	public static void vehiclesById(Long id){
		try{
			Vehicle vehicle = Vehicle.fetchById(id);
			List<Vehicle> vehicles = new ArrayList<Vehicle>(1);
			vehicles.add(vehicle);
			renderHtml(CommonUtil.toJson(APICallback.success(Vehicle.findGPS(vehicles))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get All Vehicle Current GPS Data
	 */
	@Perm
	public static void vehicles(){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Vehicle.findGPS())));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get vehicle's route gps data by vehicle number and paging
	 */
	@Perm
	public static void routeByVehicleNumber(int page, int pageSize, String vehicleNumber, String start, String end) {
		try{
			List<String[]> points = Vehicle.routeGPS(page, pageSize, vehicleNumber, start, end);
			long total = Vehicle.countRouteGPS(vehicleNumber, start, end);
			Map map = new HashMap();
			map.put("points", points);
			map.put("total", total);
			renderHtml(CommonUtil.toJson(APICallback.success(map)));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get vehicle's route gps data by vehicle id and paging
	 */
	@Perm
	public static void routeByVehicleId(int page, int pageSize, Long id, String start, String end) {
		try{
			List<String[]> points = Vehicle.routeGPS(page, pageSize, id, start, end);
			long total = Vehicle.countRouteGPS(id, start, end);
			Map map = new HashMap();
			map.put("points", points);
			map.put("total", total);
			
			renderHtml(CommonUtil.toJson(APICallback.success(map)));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get Event GPS Data by Event ID
	 * @param id
	 */
	@Perm
	public static void eventsById(Long id){
		try{
			Event event = Event.fetchById(id);
			renderHtml(CommonUtil.toJson((APICallback.success(new EventGPS().init(event)))));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	/**
	 * Get All Event GPS Data
	 */
	@Perm
	public static void events(final int page, final int pageSize, Date startTime, Date endTime,  final EventVO event){
		try{
			Map map = Event.searchEvent(page, pageSize, event, startTime, endTime);
			List<Event> events = (List<Event>) map.get("data");
			List<EventGPS> eGps = new ArrayList<EventGPS>();
			if (events != null)
				for (Event e : events)
					eGps.add(new EventGPS().init(e));
			
			map.remove("data");
			map.put("events", eGps);
			
			renderHtml(CommonUtil.toJson(APICallback.success(map)));
		}catch(Throwable e){
			renderHtml(CommonUtil.toJson(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage())));
		}
	}
	
	@Perm
	public static void locations(){
		try{
			renderHtml(CommonUtil.toJson(APICallback.success(Location.findGPS())));
		}catch(Throwable e){
			renderHtml(APICallback.fail(APIError.GPS_FETCH_FAIL, e.getMessage()));
		}
	}
	
}
