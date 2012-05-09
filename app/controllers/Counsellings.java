package controllers;

import models.Counselling;
import models.Driver;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;

import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

@With(Interceptor.class)
public class Counsellings extends Controller{
    
	public static void counsel() {
		List<User> userList = User.findAll();
		List<Driver> driverList = Driver.findAll();
		Counselling coun = new Counselling();
		List<Counselling> counsellings = coun.getAllCoun();
		if(counsellings.size()==0){
			flash.error("Sorry, there is no result...");
		}
		renderTemplate(renderArgs.get(THEME)+"/Application/counsel.html", counsellings, userList, driverList);
    }
	
	public static void counselJson(){
		List<Counselling> list = Counselling.findAll(); 
		Map data = CommonUtil.assemGridData(list);
		renderJSON(data);
	}
	
	public static void search(String username, String driverName, 
			String startDate, String endDate, String startTime, String endTime){
		flash.clear();
		System.out.println("user: "+ username + " Driver: " + driverName);
		
		User user_ = User.find("byName",username).first();
		
		Driver driver = Driver.find("byName", driverName).first();
		
		String start = startTime+startDate;
		String end = endTime+endDate;
		Counselling coun = new Counselling();
		List<Counselling> counsellings = coun.getCounsellings(user_, driver, 
				start, end, username, driverName);

		if(counsellings==null){
			flash.error("Sorry, there is no result...");
		}
		renderTemplate(renderArgs.get(THEME)+"/Application/counsel.html", counsellings, driver, user_);
    } 

    public static void saveCounselling(String username, String date, String start,
                       String end, String remark, String driverName) {
        System.out.println("=========" + driverName);
    	String startTime = start+date;
    	String endTime = end+date;
        User user = User.find("byName", username).first();
        Driver driver1 = Driver.find("byName", driverName).first();
        new Counselling(user, startTime, endTime, remark, driver1).save();
    }
    
    public static void deleteCounsel(long id){
    	System.out.println("id >>>> "+id);
        Counselling c = Counselling.find("id = ?", id).first();
        c.delete();
    }
    
   public static void updateCounsel(String username, String driverName, String start, String end){
	   
   }
}
