package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Fleet;

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
	 * 获取车队的树形结构 JSON 信息
	 */
	public static void tree() {
		renderJSON(Fleet.assemFleetTree());
	}

	/**
	 * 车队管理：更新车队信息
	 */
	public static void update(String models) {
		if (models == null)
			return;

		FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
		Long id = fleetVO.id;
		Fleet fleet = Fleet.findById(id);
		fleet.name = fleetVO.name;
		fleet.description = fleetVO.description;
		fleet.placeNumber = fleetVO.placeNumber;
		fleet.parent = Fleet.findByName(fleetVO.parent);
		
		fleet.save();
		
		renderJSON(models);
	}

	/**
	 * 获取车队 JSON 信息
	 */
	public static void read() {
		List<FleetVO> result = new ArrayList<FleetVO>();

		List<Fleet> fleetList = Fleet.findAndOrderByIdDesc();
		for (Fleet fleet : fleetList)
			result.add(new FleetVO().init(fleet));

		renderJSON(result);
	}

	/**
	 * 车队管理：删除车队信息
	 */
	public static void destroy(String models) {
		FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
		Long id = fleetVO.id;
		Fleet fleet = Fleet.findById(id);
		
		fleet.delete();
	}

	/**
	 * 车队管理：添加车队信息
	 */
	public static void add(String models) {
		FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
		Fleet fleet = new Fleet();
		fleet.name = fleetVO.name;
		fleet.description = fleetVO.description;
		fleet.placeNumber = fleetVO.placeNumber;
		
		fleet.save();
	}

	/**
	 * 访问车队管理页面
	 */
	public static void grid(String id) {
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // vehicles
		final String preUrl = "/Fleets/";
		grid.createUrl = preUrl + "add";
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
	 * 检索车队信息，返回 JSON
	 */
	public static void search(String placeNumber, String name) {
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		if (placeNumber != null && placeNumber.trim().length() > 0) {
			sqlSB.append("placeNumber like ?");
			params.add("%" + placeNumber + "%");
		}

		if (name != null && name.trim().length() > 0) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("name like ?");
			params.add("%" + name + "%");
		}

		List<Fleet> fleets = Fleet.find(sqlSB.toString(), params.toArray()).fetch();
		if (fleets == null)
			renderJSON("");

		List<FleetVO> fleetVOList = new ArrayList<FleetVO>();

		for (Fleet f : fleets) 
			fleetVOList.add(new FleetVO().init(f));

		renderJSON(fleetVOList);
	}

}
