package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public static void read(){
		List<SystemConfig> sysConfigs = SystemConfig.find("order by id desc").fetch();
		renderJSON(sysConfigs);
	}
	
	public static void listJson(){
		List<SystemConfig> sysConfigs = SystemConfig.find("order by id desc").fetch();
        Map data = CommonUtil.assemGridData(sysConfigs);
        renderJSON(data);
    }
	
	public static void create(String models){
		if (SystemConfig.createByJson(models))
			renderJSON(models);
	}
	
	public static void delete(String models){
		if (SystemConfig.deleteByJson(models))
			renderJSON(models);
	}
	
	public static void update(String models){
		if (SystemConfig.updateByJson(models))
			renderJSON(models);
	}
	
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
}
