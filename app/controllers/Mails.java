package controllers;

import java.util.List;
import java.util.Map;

import models.Department;
import models.Driver;
import models.DriverReport;
import models.Log;
import notifiers.MyMailer;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;

@With(Interceptor.class)
public class Mails extends Controller{
	
	public static void driver(long driverId, String timeType, String time) {
		Driver driver = Driver.findById(driverId);
		if (driver == null)
			renderJSON(CommonUtil.map("message", "Driver not found!"));
		
		try{
			MyMailer.driverReport(driver, timeType, time);
		}catch(Throwable e){
			renderJSON(CommonUtil.map("message", e.toString()));
		}
		
		renderJSON(CommonUtil.map("success", true));
	}
	
	public static void driverByDept(long departmentId, String timeType, String time){
		try{
			Department.sendEmail(departmentId, timeType, time);
		}catch(Throwable e){
			renderJSON(CommonUtil.map("message", e.toString()));
		}
		
		renderJSON(CommonUtil.map("success", true));
    }
}
