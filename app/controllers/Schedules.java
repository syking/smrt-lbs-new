package controllers;

import static models.User.Constant.THEME;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotations.Perm;

import models.Driver;
import models.Schedule;
import models.Vehicle;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.ScheduleVO;

@With(Interceptor.class)
public class Schedules extends Controller {

	/**
	 * 访问排班管理页面
	 */
	public static void grid(String id) {
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // vehicles
		final String preUrl = "/Schedules/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(ScheduleVO.class, "id"));
		map.put("grid", grid);

		List<ComboVO> drivers = Driver.assemComboVO();
		map.put("drivers", CommonUtil.toJson(drivers));
		
		List<ComboVO> vehicles = Vehicle.assemComboVO();
		map.put("vehicles", CommonUtil.toJson(vehicles));
		
		List<ComboVO> routes = Schedule.assemRouteComboVO();
		map.put("routes", CommonUtil.toJson(routes));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Schedules/grid.html")).render(map));
	}
	
	/**
	 * 获取排班 JSON 信息
	 */
	public static void read(int page, int pageSize) {
		renderJSON(Schedule.search(page, pageSize, null, null, null, null, null, null, null, null));
	}
	
	@Perm
	public static void clear(){
		Schedule.deleteAll();
		
		renderJSON(CommonUtil.map("success", true));
	}

	@Perm
	public static void upload(File file){
		try {
			Schedule.parseAndCreateByCSV(file);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 排班管理：添加排班信息
	 */
	public static void create(String models) {
		renderJSON(Schedule.createByJson(models));
	}
	
	/**
	 * 排班管理：更新排班信息
	 */
	public static void update(String models) {
		if (Schedule.updateByJson(models))
			renderJSON(models);
	}

	/**
	 * 排班管理：删除排班信息
	 */
	public static void destroy(String models) {
		if (Schedule.deleteByJson(models))
			renderJSON(models);
	}

	/**
	 * 检索排班信息，返回 JSON
	 */
	public static void search(int page, int pageSize, String driverNumber, String vehicleNumber, String route, String duty, String startDate, String startTime, String endDate, String endTime) {
		Map map = Schedule.search(page, pageSize, driverNumber, vehicleNumber, route, duty, startDate, startTime, endDate, endTime);
		renderJSON(map);
	}

}
