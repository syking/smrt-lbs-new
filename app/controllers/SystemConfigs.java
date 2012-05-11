package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

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
	
	public static void show(){
		List<SystemConfig> sysConfigs = SystemConfig.findAll();
		
		if(SystemConfig.findAll()==null) renderJSON("");
		renderJSON(sysConfigs);
	}
	
	public static void listJson(){
		List<SystemConfig> sysConfigs = SystemConfig.findAll();
        Map data = CommonUtil.assemGridData(sysConfigs);
        renderJSON(data);
    }
	
	public static void create(String models){
		String json = models.toString().substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		String name = jo.getString("name");
		String value = jo.getString("value");
		String displayName = jo.getString("displayName");
		System.out.println(name+"|"+value+"|"+displayName);
		new SystemConfig(name, value, displayName).save();
	}
	
	public static void delete(String models){
		String json = models.toString().substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getInt("id");
		SystemConfig s = SystemConfig.find("id = ?", id).first();
		s.delete();
	}
	
	public static void update(String models){
		String json = models.toString().substring(1, models.toString().length()-1);
		JSONObject jo = JSONObject.fromObject(json);
		long id = jo.getLong("id");
		String scName = jo.getString("name");
		String disname = jo.getString("displayName");
		String value = jo.getString("value");
		
		System.out.println(id+"|"+scName+"|"+disname+"|"+value);
		SystemConfig sc = SystemConfig.findById(id);
		sc.name = scName;
		sc.displayName = disname;
		sc.value = value;
		sc.save();
	}
	
	public static void grid(String id) {
		System.out.println("============ "+id);
		final String preUrl = "/SystemConfigs/";
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id;
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "delete";
		grid.readUrl = preUrl + "show";
		grid.editable = "inline";
		grid.columnsJson = CommonUtil.getGson().toJson(
				CommonUtil.assemColumns(SystemConfig.class, "id"));
		map.put("grid", grid);
    	
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/SystemConfigs/grid.html")).render(map));
	}
}
