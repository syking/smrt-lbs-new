package controllers;

import java.util.List;

import annotations.Perm;

import models.Location;

import play.mvc.*;
import vo.VehicleGPS;

/**
 * 公交车站、总站信息控制器
 * 
 * @author weiwei
 * 
 */
@With(Interceptor.class)
public class Locations extends Controller {
	
	@Perm
	public static void gps() {
		// 车站、总站GPS数据
		List<VehicleGPS> locationGPS = Location.findGPS();

		renderJSON(locationGPS);
	}

}
