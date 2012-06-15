package controllers;

import java.util.List;

import play.mvc.*;
import services.LocationService;
import vo.VehicleGPS;

/**
 * 公交车站、总站信息控制器
 * @author weiwei
 *
 */
public class Locations extends Controller {

    public static void index() {
        render();
    }
    
    public static void gps(){
    	 // 车站、总站GPS数据
        List<VehicleGPS> locationGPS = LocationService.findGPS();
        
        renderJSON(locationGPS);
    }

}
