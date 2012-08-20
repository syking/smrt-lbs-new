package models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
import utils.CommonUtil;
import vo.ComboVO;
import vo.TreeView;
import vo.VehicleGPS;
import vo.VehicleVO;

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

	public Vehicle() {}
	
	public Vehicle(String number, String license, Fleet fleet, Device device, String description, String cctvIp, String type) {
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

	public static long countByCondition(List<String> criteria, List<Object> params) {
		Object[] p = params.toArray();
		
		String query = StringUtils.join(criteria, " AND ");
		long count = Vehicle.count(query, p);
		
		return count;
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

	public static List<VehicleGPS> findGPS(){
		List<Vehicle> vehicles = Vehicle.findAll();
		return findGPS(vehicles);
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
			if (v.device == null)
				continue;
			
			LiveGPSData gps = LiveGPSData.find("device_key = ? order by id desc limit 1", v.device.key).first();
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
			Schedule schedule = Schedule.find("vehicle_number = ? order by id desc", v.number).first();
			if (schedule == null) {
				vGps.driver = "driver001";
				vGps.serviceNumber = "route001";
			} else {
				vGps.driver = schedule.driver.name;
				vGps.serviceNumber = schedule.serviceNumber;
			}

			vGps.currentSpeed = gps.speed;
			vGps.lng = Double.parseDouble(gps.longitude);
			vGps.lat = Double.parseDouble(gps.latitude);
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
	
	public static void deleteById(Long id) {
		Vehicle vehicle = Vehicle.fetchById(id);
		
		try {
			vehicle.delete();
		} catch (Throwable e) {
			throw new RuntimeException("Could not Delete This Vehicle Cause It is Assigned to Fleet!");
		}
	}

	public static boolean deleteByJson(String models) {
		List<VehicleVO> vehicleVOs = CommonUtil.parseArray(models, VehicleVO.class);
		if (vehicleVOs == null)
			return false;
		
		for (VehicleVO vo : vehicleVOs){
			deleteById(vo.id);
		}
		
		return true;
	}

	public static VehicleVO createByVO(VehicleVO vo) {
		if (vo == null)
			throw new RuntimeException("Vehicle info required");
		
		vo.validate();
		
		Vehicle v = new Vehicle();
		v.number = vo.number;
		v.license = vo.license;

		
		Fleet fleet = Fleet.find("byName", vo.fleetName).first();
		if (!CommonUtil.isBlank(vo.fleetName) && fleet == null)
			throw new RuntimeException("Fleet Name is invalid!");
		
		v.fleet = fleet;

		Device device = Device.find("byName", vo.deviceName).first();
		if (device == null)
			throw new RuntimeException("Device Name is invalid!");
		
		v.device = device;

		v.cctvIp = vo.cctvIp;
		v.description = vo.description;
		v.type = vo.type;
		
		Vehicle db_v = Vehicle.findByNumber(v.number);
		if (db_v != null)
			throw new RuntimeException("Number duplicate!");
		
		Vehicle db_v2 = Vehicle.findbyLicense(v.license);
		if (db_v2 != null)
			throw new RuntimeException("License duplicate!");
		
		v.create();
		vo.id = v.id;
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<VehicleVO> vos = CommonUtil.parseArray(models, VehicleVO.class);
		if (vos == null)
			return models;
		
		for (VehicleVO vo : vos){
			createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}

	private static Vehicle findbyLicense(String license) {
		return Vehicle.find("byLicense", license).first();
	}

	public static void updateByVO(VehicleVO vo) {
		if (vo == null)
			throw new RuntimeException("Vehicle info required");
		
		vo.validate();
		
		Vehicle v = Vehicle.fetchById(vo.id);
		v.number = vo.number;
		v.license = vo.license;

		Fleet fleet = Fleet.find("byName", vo.fleetName).first();
		if (!CommonUtil.isBlank(vo.fleetName) && fleet == null)
			throw new RuntimeException("FleetName is invalid!");
		
		v.fleet = fleet;

		Device device = Device.find("byName", vo.deviceName).first();
		if (device == null)
			throw new RuntimeException("DeviceName is invalid!");
		
		v.device = device;

		v.cctvIp = vo.cctvIp;
		v.description = vo.description;
		v.type = vo.type;
		
		Vehicle db_v = findByNumber(v.number);
		if (db_v != null && db_v.id != v.id)
			throw new RuntimeException("VehicleNumber duplicate!");
		
		Vehicle db_v2 = Vehicle.findbyLicense(v.license);
		if (db_v2 != null && db_v2.id != v.id)
			throw new RuntimeException("VehicleLicense duplicate!");
		
		v.save();
	}
	
	public static boolean updateByJson(String models) {
		List<VehicleVO> vehicleVOs = CommonUtil.parseArray(models, VehicleVO.class);
		if (vehicleVOs == null)
			return false;
		
		for (VehicleVO vo : vehicleVOs){
			updateByVO(vo);
		}
		
		return true;
	}

	public static Vehicle findByNumber(String number){
		return Vehicle.find("number = ?", number).first();
	}
	
	public static List<ComboVO> assemComboVO() {
		return assemComboVO(null);
	}
	public static List<ComboVO> assemComboVO(List<Vehicle> vehicleList) {
		List<ComboVO> result = new ArrayList<ComboVO>();
		if (vehicleList == null)
			vehicleList = findAll();
		
		if (vehicleList != null)
    		for (Vehicle v : vehicleList){
    			result.add(new ComboVO(v.number, v.number));
    		}
		
		return result;
	}

	public static Vehicle fetchByNumber(String vehicleNumber) {
		if (CommonUtil.isBlank(vehicleNumber))
			throw new RuntimeException("vehicle number required");
		Vehicle vehicle = Vehicle.find("byNumber", vehicleNumber).first();
		if (vehicle == null)
			throw new RuntimeException("vehicle number is invalid");
		return vehicle;
	}
	
	public static Map search(int page, int pageSize, VehicleVO vehicle) {
		if (vehicle == null)
			return search(page, pageSize, null, null, null, null, null, null, null);
		
		return search(page, pageSize, vehicle.number, vehicle.license, vehicle.fleetName, vehicle.deviceName, vehicle.description, vehicle.cctvIp, vehicle.type);
	}
	
	public static Map search(int page, int pageSize, String number, String license, String fleetName, String deviceName, String description, String cctvIp, String type){
		List<String> criteria = new ArrayList<String>(9);
		List<Object> params = new ArrayList<Object>(9);
		parseCondition(number, license, fleetName, deviceName, description,cctvIp, type, criteria, params);
		
		Object[] p = params.toArray();
		String query = StringUtils.join(criteria, " AND ");
		List<Vehicle> vehicles = null;
		if (page > 0 && pageSize > 0)
			vehicles = Vehicle.find(query + " order by id desc", p).fetch(page, pageSize);
		else
			vehicles = Vehicle.find(query + " order by id desc", p).fetch();
	
		
		List<VehicleVO> vehicleVOList = new ArrayList<VehicleVO>();
		for (Vehicle vehicle : vehicles) 
			vehicleVOList.add(new VehicleVO().init(vehicle));
		
		Map map = new HashMap();
		map.put("vehicles", vehicleVOList);
		map.put("total", Vehicle.countByCondition(criteria, params));
		
		return map;
	}

	private static void parseCondition(String number, String license, String fleetName, String deviceName, String description, String cctvIp, String type, List<String> criteria, List<Object> params) {
		if (!CommonUtil.isBlank(number)) {
			criteria.add("number LIKE ?");
			params.add("%" + number.trim() + "%");
		}

		if (!CommonUtil.isBlank(license)) {
			criteria.add("license LIKE ?");
			params.add("%" + license.trim() + "%");
		}
		
		if (!CommonUtil.isBlank(fleetName)){
			Fleet fleet = Fleet.findByName(fleetName.trim());
			if (fleet != null) {
				long fleet_id = fleet.id;
				criteria.add("fleet_id = ?");
				params.add(fleet_id);
			}
		}

		if (!CommonUtil.isBlank(deviceName)){
			Device device = Device.findByName(deviceName.trim());
			if (device != null) {
				long device_id = device.id;
				criteria.add("device_id = ?");
				params.add(device_id);
			}
		}

		if (!CommonUtil.isBlank(description)) {
			criteria.add("description LIKE ?");
			params.add("%" + description.trim() + "%");
		}

		if (!CommonUtil.isBlank(type)) {
			criteria.add("type LIKE ?");
			params.add("%" + type.trim() + "%");
		}

		if (!CommonUtil.isBlank(cctvIp)) {
			criteria.add("cctvIp LIKE ?");
			params.add("%" + cctvIp.trim() + "%");
		}
	}
	
	public static List<Long> toIds(Collection<Vehicle> vehicles) {
		if (vehicles == null)
			return null;
		
		List<Long> ids = new ArrayList<Long>(vehicles.size());
		for (Vehicle v : vehicles) {
			ids.add(v.id);
		}
		
		return ids;
	}

	public static List<Vehicle> assignables() {
		return Vehicle.find("fleet is null order by id desc").fetch();
	}

	public static Vehicle fetchById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		Vehicle vehicle = Vehicle.findById(id);
		if (vehicle == null)
			throw new RuntimeException("Vehicle not found");
		
		return vehicle;
	}
	
	public static List<String[]> routeGPS(int page, int pageSize, Long id, String startTime, String endTime) {
		Vehicle vehicle = Vehicle.fetchById(id);
		return routeGPS(page, pageSize, vehicle, startTime, endTime);
	}
	
	public static List<String[]> routeGPS(int page, int pageSize, String vehicleNo, String startTime, String endTime) {
		Vehicle vehicle = Vehicle.fetchByNumber(vehicleNo);
		return routeGPS(page, pageSize, vehicle, startTime, endTime);
	}
	
	public static List<String[]> routeGPS(int page, int pageSize, Vehicle vehicle, String startTime, String endTime) {
		List<String[]> points = new ArrayList<String[]>();
		StringBuilder sb = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseRouteCondition(vehicle, startTime, endTime, sb, params);
		
		List<GPSDataRecord> gps = null;
		if (page > 0 && pageSize > 0)
			gps = GPSDataRecord.find(sb.toString(), params.toArray()).fetch(page, pageSize);
		else
			gps = GPSDataRecord.find(sb.toString(), params.toArray()).fetch();
		
		if (gps != null){
			for (GPSDataRecord g : gps)
				points.add(new String[] { g.longitude, g.latitude });
		}
		
		return points;
	}

	public static long countRouteGPS(String vehicleNumber, String start, String end){
		Vehicle vehicle = Vehicle.fetchByNumber(vehicleNumber);
		return countRouteGPS(vehicle, start, end);
	}
	
	public static long countRouteGPS(Long id, String start, String end){
		Vehicle vehicle = Vehicle.fetchById(id);
		return countRouteGPS(vehicle, start, end);
	}
	
	public static long countRouteGPS(Vehicle vehicle, String start, String end){
		StringBuilder sb = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseRouteCondition(vehicle, start, end, sb, params);
		
		return GPSDataRecord.count(sb.toString(), params.toArray());
	}
	
	
	private static void parseRouteCondition(Vehicle vehicle, String startTime,String endTime, StringBuilder sb, List<Object> params) {
		if (vehicle != null && vehicle.device != null){
			sb.append("device_key = ?");
			params.add(vehicle.device.key);
		}
		
		Date start = null;
		Date end = null;
		if (!CommonUtil.isBlank(startTime)){
			try{
				start = CommonUtil.newDate("yyyy-MM-dd HH:mm", startTime);
				if (!CommonUtil.isBlank(endTime)){
					end = CommonUtil.newDate("yyyy-MM-dd HH:mm", endTime);
				}
			} catch (Throwable e){
				start = null;
				end = null;
			}
		}
		
		if (start != null){
			if (sb.length() > 0)
				sb.append(" and ");
			sb.append("time >= ?");
			params.add(start);
		}
		
		if (end != null){
			if (sb.length() > 0)
				sb.append(" and ");
			sb.append("time < ?");
			params.add(end);
		}
	}
	public static List<String[]> routeGPS(int page, int pageSize, String vehicleNo, String startDate, String startTime, String endDate, String endTime) {
		String start =  startDate + " " + startTime;
		String end = endDate + " " + endTime;
		
		return routeGPS(page, pageSize, vehicleNo, start, end);
	}

}
