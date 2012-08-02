package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import models.Driver;
import models.Fleet;
import models.Permission;
import models.Role;
import models.User;
import models.Vehicle;

import play.mvc.*;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.FleetVO;
import vo.Grid;

/**
 * Fleet Controller
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Fleets extends Controller {

	/**
	 * 访问车队管理页面
	 */
	public static void grid(String id) {
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // vehicles
		final String preUrl = "/Fleets/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(FleetVO.class, "id"));

		List<String> pnList = Fleet.find("select DISTINCT f.placeNumber from Fleet f ").fetch();
		List<ComboVO> placeNumbers = new ArrayList<ComboVO>();
		if (pnList != null)
			for (String s : pnList) 
				placeNumbers.add(new ComboVO(s, s));

		map.put("placeNumbers", CommonUtil.getGson().toJson(placeNumbers));

		List<String> nList = Fleet.find("select DISTINCT f.name from Fleet f ").fetch();
		List<ComboVO> names = new ArrayList<ComboVO>();
		if (nList != null)
			for (String s : nList) 
				names.add(new ComboVO(s, s));
		
		map.put("names", CommonUtil.getGson().toJson(names));
		map.put("grid", grid);

		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Fleets/grid.html")).render(map));
	}
	
	/**
	 * 获取车队的树形结构 JSON 信息
	 */
	public static void tree() {
		renderJSON(Fleet.assemFleetTree());
	}
	
	/**
	 * 获取车队 JSON 信息
	 */
	public static void read(int page, int pageSize) {
		renderJSON(Fleet.search(page, pageSize, null, null));
	}

	/**
	 * 车队管理：添加车队信息
	 */
	public static void create(String models) {
		renderJSON(Fleet.createByJson(models));
	}
	
	/**
	 * 车队管理：更新车队信息
	 */
	public static void update(String models) {
		if (Fleet.updateByJson(models))
			renderJSON(models);
	}

	/**
	 * 车队管理：删除车队信息
	 */
	public static void destroy(String models) {
		if (Fleet.deleteByJson(models))
			renderJSON(models);
	}

	/**
	 * 检索车队信息，返回 JSON
	 */
	public static void search(int page, int pageSize, String placeNumber, String name) {
		renderJSON(Fleet.search(page, pageSize, placeNumber, name));
	}
	
	/**
	 * 打开车队分配页面
	 * @param id
	 */
	public static void assign(String id){
		Map map = new HashMap();
		map.put("tabid", id);
		Gson gson = new Gson();
		
		// 车队列表
		map.put("fleets", gson.toJson(Fleet.assemFleetTree()));
		
		// 司机列表（为车队分配队长）
		map.put("drivers", gson.toJson(Driver.assemTreeView()));
		
		// 车辆列表（为车队分配车辆）
		map.put("vehicles", gson.toJson(Vehicle.assemTreeView()));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Fleets/assign.html")).render(map));
	}
	
	public static void assignDriverAndVehicle(String fleetName, List<Long> drivers, List<Long> vehicles){
		Map map = new HashMap();
		try{
			boolean flag = Fleet.assignDriverAndVehicle(fleetName, drivers, vehicles);
			map.put("success", flag);
		}catch(Exception e){
			map.put("success", false);
			map.put("msg", e.getMessage());
		}
		
		renderJSON(map);
	}
	
	public static void leaders(String fleetName){
		Fleet fleet = Fleet.findByName(fleetName);
		renderJSON(CommonUtil.getGson("number", "description", "name", "department", "fleet", "iconUrl").toJson(fleet.leaders));
	}
	
	public static void vehicles(String fleetName){
		Fleet fleet = Fleet.findByName(fleetName);
		List<Vehicle> validList = Vehicle.find("fleet is null").fetch();
		final String valids = CommonUtil.getGson("number", "license", "name", "fleet", "device", "cctvIp", "DIRECTIONS", "description", "type", "iconUrl").toJson(validList);
		final String vehicles = CommonUtil.getGson("number", "license", "name", "fleet", "device", "cctvIp", "DIRECTIONS", "description", "type", "iconUrl").toJson(fleet.vehicles);
		Map map = new HashMap();
		map.put("vehicles", vehicles);
		map.put("valids", valids);
		renderJSON(map);
	}
	
	public static void filter(String fleetName){
		if (fleetName == null || fleetName.isEmpty())
			renderJSON(Fleet.assemFleetTree());
		else
			renderJSON(Fleet.assemFleetTree(Fleet.findByCondition(-1, -1, null, fleetName), false));
	}

}
