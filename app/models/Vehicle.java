package models;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.commons.lang.StringUtils;

import play.db.jpa.Model;
import vo.ComboVO;
import vo.TreeView;
import vo.VehicleGPS;

/**
 * 车辆信息
 * 
 */
@Entity
@Table(name = "t_vehicle")
public class Vehicle extends Model {

	@Column(unique = true)
	public String number;// 车辆编号

	@Column(unique = true)
	public String license;// 车牌号

	@ManyToOne(fetch = FetchType.EAGER)
	public Fleet fleet;// 车队

	@OneToOne(fetch = FetchType.EAGER)
	public Device device;// 一辆车有一台唯一的GPS设备

	public String description;// 描述

	@Column(name = "cctv_ip")
	public String cctvIp;// 录像IP地址

	public String type;// 车辆类型

	@Transient
	public final static String[] DIRECTIONS = { "left", "right", "up", "down" };

	@Transient
	public final static String iconUrl = "../../public/images/vehicle.png";

	@Override
	public String toString() {
		return "Vehicle [number=" + number + ", license=" + license
				+ ", fleet=" + fleet + ", device=" + device + ", description="
				+ description + ", cctvIp=" + cctvIp + ", type=" + type
				+ ", id=" + id + "]";
	}

	public Vehicle(String number, String license, Fleet fleet, Device device,
			String description, String cctvIp, String type) {
		this.number = number;
		this.license = license;
		this.fleet = fleet;
		this.device = device;
		this.description = description;
		this.cctvIp = cctvIp;
		this.type = type;
	}

	public Vehicle(String number, String license, String description,
			String cctvIp, String type) {
		this.number = number;
		this.license = license;
		this.description = description;
		this.cctvIp = cctvIp;
		this.type = type;
	}

	
	public Vehicle() {
		// TODO Auto-generated constructor stub
	}

	public static List<Vehicle> findByCondition(List<String> criteria, List<Object> params) {
		Object[] p = params.toArray();
		
		String query = StringUtils.join(criteria, " AND ");
		List<Vehicle> vehicles = Vehicle.find(query, p).fetch();
		
		return vehicles;
	}
	
	public static List<ComboVO> getCombo() {
		List<Vehicle> vehicleList = Vehicle.findAll();
		List<ComboVO> vc = new ArrayList<ComboVO>();
		if (vehicleList != null)
			for (Vehicle v : vehicleList)
				vc.add(new ComboVO(v.number, v.number));

		return vc;
	}

	public static List<Vehicle> filterByFleet(long[] fleets) {
		if (fleets == null || fleets.length == 0)
			return Vehicle.findAll();

		StringBuilder sb = new StringBuilder();
		for (long id : fleets) {
			if (sb.length() > 0)
				sb.append(", ");

			sb.append(id);
		}

		return Vehicle.find(String.format(" fleet in(%s)", sb.toString()))
				.fetch();
	}

	public static List<Vehicle> filterVehicleByFleet(long[] fleets) {
		List<Vehicle> vehicles = null;
		if (fleets == null)
			vehicles = Vehicle.findAll();
		else
			vehicles = filterByFleet(fleets);

		return vehicles;
	}

	/**
	 * @param vehicles
	 * @return
	 */
	public static List<VehicleGPS> findGPS(List<Vehicle> vehicles) {

		if (vehicles == null)
			return null;

		List<VehicleGPS> result = new ArrayList<VehicleGPS>(vehicles.size());
		// 1. 遍历车辆，根据车辆的设备找出对应的最新的GPS信息
		for (Vehicle v : vehicles) {
			GPSData gps = GPSData.find(
					"device_key = ? order by id desc limit 1", v.device.key)
					.first();
			if (gps == null)
				continue;

			VehicleGPS vGps = new VehicleGPS();
			vGps.id = v.id;
			vGps.busPlateNumber = v.number;

			// TODO
			/*
			 * 暂时直接根据车辆编号找到调度 表的最新的排班记录，其实这样是不行的，
			 * 因为排班是会把时间排到以后的，因此以后需要修改为按当前时间找符合排班时间的记录
			 */
			Schedule schedule = Schedule.find(
					"vehicle_number = ? order by id desc", v.number).first();
			if (schedule == null) {
				vGps.driver = "driver001";
				vGps.serviceNumber = "route001";
			} else {
				vGps.driver = schedule.driver.name;
				vGps.serviceNumber = schedule.serviceNumber;
			}

			vGps.currentSpeed = gps.speed;
			vGps.xCoord = Double.parseDouble(gps.longitude);
			vGps.yCoord = Double.parseDouble(gps.latitude);
			vGps.vehicleType = v.type;
			vGps.activeStatus = "on";
			vGps.direction = Vehicle.DIRECTIONS[gps.direction];

			result.add(vGps);
		}

		return result;
	}

	public static List<TreeView> assemTreeView(){
		List<TreeView> result = new ArrayList<TreeView>();
		List<Vehicle> vehicles = Vehicle.findAll();
		if (vehicles == null)
			return result;
		
		TreeView root = new TreeView("", "All Vehicles", Vehicle.iconUrl);
		for (Vehicle v : vehicles){
			TreeView tv = new TreeView(String.valueOf(v.id), v.number, Vehicle.iconUrl);
			tv.items = null;
			root.items.add(tv);
		} 
		
		root.expanded = true;
		result.add(root);
		
		return result;
	}
	
	public static List<TreeView> assemVehicleTreeAndFleetTree(List<TreeView> result) {
		if (result == null)
			result = Fleet.assemFleetTree();

		for (TreeView tv : result) {
			Fleet fl = Fleet.findById(Long.parseLong(tv.id));
			if (fl == null)
				continue;

			if (tv.items != null && !tv.items.isEmpty()) {
				// 有子车队
				assemVehicleTreeAndFleetTree(tv.items);
			}
			
			if (!fl.vehicles.isEmpty()){
				if (tv.items == null)
					tv.items = new ArrayList<TreeView>(fl.vehicles.size());
				
				for (Vehicle vehicle : fl.vehicles) {
					TreeView treeView = new TreeView(vehicle.id.toString(),vehicle.number, Vehicle.iconUrl);
					treeView.items = null;
					tv.items.add(treeView);
				}
			} else if (tv.items != null && tv.items.isEmpty()){
				tv.items = null;
			}
		}

		return result;
	}

	public static List<TreeView> assemVehicleTreeByFleetIdAndNumber(long fleetid, String number) {

		List<TreeView> result = new ArrayList<TreeView>();

		// no search
		if (fleetid <= 0 && (number == null || number.trim().length() == 0)) {
			return assemVehicleTreeAndFleetTree(null);
		}
		
		// both search
		if (fleetid > 0 && number != null && number.trim().length() > 0) {
			// 某个车队下给定车牌号进行模糊查询
			Fleet fleet = Fleet.findById(fleetid);
			if (fleet == null)
				return result;
			
			Set<Fleet> setFleet = new HashSet<Fleet>();
			setFleet.add(fleet);
			
			Set<Fleet> fleets = new HashSet<Fleet>(Fleet.findAllFleet(fleet));
			
			label:for (Fleet f : fleets){
				for (Fleet fl : setFleet)
					if (fl.contains(f))
						continue label;
				
				for (Vehicle v : f.vehicles){
					if (v.number.equals(number) || v.number.contains(number)){
						setFleet.add(f);
						break;
					}
				}
			}
			
			return assemVehicleTreeAndFleetTree(Fleet.assemFleetTree(setFleet));
		}
		
		// by fleet
		if (fleetid > 0 && (number == null || number.trim().length() == 0)) {
			Fleet fleet = Fleet.findById(fleetid);
			Set<Fleet> set = new HashSet<Fleet>(1);
			set.add(fleet);
			
			return assemVehicleTreeAndFleetTree(Fleet.assemFleetTree(set));
		}
		
		// by number
		if (fleetid <= 0 && (number != null && number.trim().length() > 0)) {
			List<Vehicle> ves = Vehicle.find("byNumberLike", "%"+number+"%").fetch();
			Set<Fleet> set = new HashSet<Fleet>();
			label1:for (Vehicle v : ves){
				for (Fleet fl : set)
					if (fl.contains(v.fleet))
						continue label1;
				
				set.add(v.fleet);
			} 
			
			return assemVehicleTreeAndFleetTree(Fleet.assemFleetTree(set));
		}

		return result;
	}
}
