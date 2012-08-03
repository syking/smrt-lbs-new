package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotations.Perm;

import models.Counselling;
import models.Driver;
import models.SystemConfig;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.CounselVO;
import vo.Grid;

@With(Interceptor.class)
public class SystemConfigs extends Controller{
	
	@Perm
	public static void read(int page, int pageSize){
		renderJSON(SystemConfig.search(page, pageSize));
	}
	
	@Perm
	public static void create(String models){
		renderJSON(SystemConfig.createByJson(models));
	}
	
	@Perm
	public static void delete(String models){
		if (SystemConfig.deleteByJson(models))
			renderJSON(models);
	}
	
	@Perm
	public static void update(String models){
		if (SystemConfig.updateByJson(models))
			renderJSON(models);
	}
	
	@Perm
	public static void grid(String id) {
		final String preUrl = "/SystemConfigs/";
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "delete";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(SystemConfig.class, "id"));
		map.put("grid", grid);
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/SystemConfigs/grid.html")).render(map));
	}
	
	@Perm
	public static void setting(String id) {
		Map map = new HashMap();
		map.put("tabId", id);
		List<Map> brakings = new ArrayList<Map>();
		List<Map> accelerations = new ArrayList<Map>();
		List<Map> lefts = new ArrayList<Map>();
		List<Map> rights = new ArrayList<Map>();
		List<SystemConfig> scs = SystemConfig.findAll();
		for (SystemConfig sc : scs){
			if (sc.name.equals("threshold-speeding")){
				map.put("speeding", sc);
			}else if (sc.name.equals("threshold-speeding-on-highway")){
				map.put("speeding_on_highway", sc);
			}else if (sc.name.equals("threshold-idle")){
				map.put("idle", sc);
			}else if (sc.name.matches("^threshold-sudden-braking-\\d+-\\d+$")){
				String[] names = sc.name.split("-");
				Map data = new HashMap();
				data.put("id", sc.id);
				data.put("gforce", sc.value);
				data.put("min", names[names.length-2]);
				data.put("max", names[names.length-1]);
				brakings.add(data);
			}else if (sc.name.matches("^threshold-sudden-acceleration-\\d+-\\d+$")){
				String[] names = sc.name.split("-");
				Map data = new HashMap();
				data.put("id", sc.id);
				data.put("gforce", sc.value);
				data.put("min", names[names.length-2]);
				data.put("max", names[names.length-1]);
				accelerations.add(data);
			}else if (sc.name.matches("^threshold-sudden-left-\\d+-\\d+$")){
				String[] names = sc.name.split("-");
				Map data = new HashMap();
				data.put("id", sc.id);
				data.put("gforce", sc.value);
				data.put("min", names[names.length-2]);
				data.put("max", names[names.length-1]);
				lefts.add(data);
			}else if (sc.name.matches("^threshold-sudden-right-\\d+-\\d+$")){
				String[] names = sc.name.split("-");
				Map data = new HashMap();
				data.put("id", sc.id);
				data.put("gforce", sc.value);
				data.put("min", names[names.length-2]);
				data.put("max", names[names.length-1]);
				rights.add(data);
			}
		}
		
		map.put("brakings", brakings);
		map.put("accelerations", accelerations);
		map.put("lefts", lefts);
		map.put("rights", rights);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/SystemConfigs/setting.html")).render(map));
	}
	
	public static void main(String[] args){
		String name = "threshold-sudden-braking-200-30";
		
		System.out.println(name.matches("^threshold-sudden-braking-\\d+-\\d+$"));
		String[] names = name.split("-");
		System.out.println(names[names.length-2]);
		System.out.println(names[names.length-1]);
	}
	
	@Perm
	public static void update_setting(
			Long threshold_speeding_id, String threshold_speeding, 
			Long threshold_speeding_on_highway_id, String threshold_speeding_on_highway,
			Long threshold_idle_id, String threshold_idle,
			List<Long> sudden_braking_id, List<String> sudden_braking_gforce, List<String> sudden_braking_min, List<String> sudden_braking_max, 
			List<Long> sudden_acceleration_id, List<String> sudden_acceleration_gforce, List<String> sudden_acceleration_min, List<String> sudden_acceleration_max,
			List<Long> sudden_left_id, List<String> sudden_left_gforce, List<String> sudden_left_min, List<String> sudden_left_max,
			List<Long> sudden_right_id, List<String> sudden_right_gforce, List<String> sudden_right_min, List<String> sudden_right_max) {
		List<SystemConfig> scs = new ArrayList<SystemConfig>();
		if (threshold_speeding != null && !threshold_speeding.isEmpty()){
			SystemConfig sc = new SystemConfig();
			sc.id = threshold_speeding_id;
			sc.name = "threshold-speeding";
			sc.value = threshold_speeding;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		if (threshold_speeding_on_highway != null && !threshold_speeding_on_highway.isEmpty()){
			SystemConfig sc = new SystemConfig();
			sc.id = threshold_speeding_on_highway_id;
			sc.name = "threshold-speeding-on-highway";
			sc.value = threshold_speeding_on_highway;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		if ( threshold_idle != null && ! threshold_idle.isEmpty()){
			SystemConfig sc = new SystemConfig();
			sc.id = threshold_idle_id;
			sc.name = "threshold-idle";
			sc.value =  threshold_idle;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		for (int i = 0; i < sudden_braking_gforce.size(); i++){
			final String gforce = sudden_braking_gforce.get(i);
			final String min = sudden_braking_min.get(i);
			final String max = sudden_braking_max.get(i);
			if (gforce == null || gforce.isEmpty() || min == null || min.isEmpty() || max == null || max.isEmpty())
				continue;
			
			String name = String.format("threshold-sudden-braking-%s-%s", min, max);
			String value = gforce;
			SystemConfig sc = new SystemConfig();
			if (sudden_braking_id != null)
				sc.id = sudden_braking_id.get(i);
			
			sc.name = name;
			sc.value = value;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		for (int i = 0; i < sudden_acceleration_gforce.size(); i++){
			final String gforce = sudden_acceleration_gforce.get(i);
			final String min = sudden_acceleration_min.get(i);
			final String max = sudden_acceleration_max.get(i);
			if (gforce == null || gforce.isEmpty() || min == null || min.isEmpty() || max == null || max.isEmpty())
				continue;
			
			String name = String.format("threshold-sudden-acceleration-%s-%s", min, max);
			String value = gforce;
			SystemConfig sc = new SystemConfig();
			if (sudden_acceleration_id != null)
				sc.id = sudden_acceleration_id.get(i);
			sc.name = name;
			sc.value = value;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		for (int i = 0; i < sudden_left_gforce.size(); i++){
			final String gforce = sudden_left_gforce.get(i);
			final String min = sudden_left_min.get(i);
			final String max = sudden_left_max.get(i);
			if (gforce == null || gforce.isEmpty() || min == null || min.isEmpty() || max == null || max.isEmpty())
				continue;
			
			String name = String.format("threshold-sudden-left-%s-%s", min, max);
			String value = gforce;
			SystemConfig sc = new SystemConfig();
			if (sudden_left_id != null)
				sc.id = sudden_left_id.get(i);
			sc.name = name;
			sc.value = value;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		for (int i = 0; i < sudden_right_gforce.size(); i++){
			final String gforce = sudden_right_gforce.get(i);
			final String min = sudden_right_min.get(i);
			final String max = sudden_right_max.get(i);
			if (gforce == null || gforce.isEmpty() || min == null || min.isEmpty() || max == null || max.isEmpty())
				continue;
			
			String name = String.format("threshold-sudden-right-%s-%s", min, max);
			String value = gforce;
			SystemConfig sc = new SystemConfig();
			if (sudden_right_id != null)
				sc.id = sudden_right_id.get(i);
			sc.name = name;
			sc.value = value;
			sc.displayName = sc.name;
			scs.add(sc);
		}
		
		try{
			for (SystemConfig sc : scs) {
				if (sc.id != null){
					Long id = sc.id;
					SystemConfig _sc = SystemConfig.findById(id);
					if (_sc != null){
						_sc.name = sc.name;
						_sc.value = sc.value;
						_sc.displayName = sc.displayName;
						SystemConfig.updateByVO(_sc);
						continue;
					}
				}
				sc.id = null;
				sc.displayName = sc.name;
				SystemConfig.createByVO(sc);
			}
			
			renderJSON(CommonUtil.map("success", true));
		}catch (Throwable e){
			e.printStackTrace();
			Map map = new HashMap();
			map.put("success", false);
			map.put("message", e.getMessage());
			renderJSON(map);
		}
	}
	
	public static void destroy_setting(Long id) {
		try{
			SystemConfig.deleteById(id);
			renderJSON(CommonUtil.map("success", true));
		} catch(Throwable e){
			e.printStackTrace();
			String msg = e.getMessage();
			if (msg == null || msg.isEmpty())
				msg = "delete error -> " + e.toString();
			Map map = new HashMap();
			map.put("success", false);
			map.put("message", msg);
			renderJSON(map);
		}
	}
}
