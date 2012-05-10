package services;

import models.Fleet;
import models.GPSData;
import models.Schedule;
import models.Vehicle;
import vo.VehicleGPS;
import vo.VehicleTree;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 涉及到与Vehicle领域相关的多表、复杂的ViewModel对象装配的工作放在此处。
 * @author weiwei
 *
 */
public class VehicleService {
	
	public static List<Vehicle> filterByFleet(long[] fleets){
		if (fleets == null || fleets.length == 0)
			return Vehicle.findAll();
		
		StringBuilder sb = new StringBuilder();
		for (long id : fleets){
			if (sb.length() > 0)
				sb.append(", ");
			
			sb.append(id);
		}
		
		return Vehicle.find(String.format(" fleet in(%s)", sb.toString())).fetch();
	}

    public static List<Vehicle> filterVehicleByFleet(long[] fleets){
    	List<Vehicle> vehicles = null;
		if (fleets == null)
			vehicles = Vehicle.findAll();
		else
			vehicles = filterByFleet(fleets);
		
		return vehicles;
    }
    
	/**
	 * 
	 * @param fleets
	 * @return
	 */
	public static List<VehicleGPS> findGPS(List<Vehicle> vehicles){
		
		if (vehicles == null)
			return null;
		
		List<VehicleGPS> result = new ArrayList<VehicleGPS>(vehicles.size());
		// 1. 遍历车辆，根据车辆的设备找出对应的最新的GPS信息
		for (Vehicle v : vehicles){
			GPSData gps = GPSData.find("device_key = ? order by id desc limit 1", v.device.key).first();
			if (gps == null)
				continue;
			
			VehicleGPS vGps = new VehicleGPS();
			vGps.id = v.id;
			vGps.busPlateNumber = v.number;
			
			// TODO
			/* 暂时直接根据车辆编号找到调度 表的最新的排班记录，其实这样是不行的，
			 * 因为排班是会把时间排到以后的，因此以后需要修改为按当前时间找符合排班时间的记录
			 * */
			Schedule schedule = Schedule.find("vehicle_number = ? order by id desc", v.number).first();
			if (schedule == null){
				vGps.driver = "不在排班计划内";
				vGps.serviceNumber = "不在排班计划内";
			}else{
				vGps.driver = schedule.driver.name;
				vGps.serviceNumber = schedule.serviceNumber;
			}
			
			vGps.currentSpeed = gps.speed;
			vGps.xCoord = gps.longitude;
			vGps.yCoord = gps.latitude;
			vGps.vehicleType = v.type;
			vGps.activeStatus = "on";
			vGps.direction = Vehicle.DIRECTIONS[gps.direction];
			
			result.add(vGps);
		}
	
		return result;
	}

    public static List<VehicleTree> assemVehicleTree(){

        List<VehicleTree> result = new ArrayList<VehicleTree>();
        List<Fleet> fleets = Fleet.findAll();

        for (Fleet fl : fleets){
            VehicleTree vt = new VehicleTree(String.valueOf(fl.id), fl.name);
            Set<Vehicle> vehicles = fl.vehicles;
            for (Vehicle vehicle : vehicles)  {
                VehicleTree vtree = new VehicleTree(vehicle.id.toString(), vehicle.number);
                vt.items.add(vtree);
            }
            result.add(vt);
        }

        return result;
    }


    public static void main(String[] args) throws ParseException{
		Date date = new SimpleDateFormat("m").parse("5");
		System.out.println(date);
	}
	
}
