package controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Log;
import models.User;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.LogVO;
import annotations.Perm;


@With(Interceptor.class)
public class Logs extends Controller {
	@Perm
	public static void grid(String id) {
		final String preUrl = "/Logs/";
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // logs
		grid.createUrl = preUrl + "add";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(LogVO.class, "id"));

		List<User> userList = User.findAll();
		List<ComboVO> users = new ArrayList<ComboVO>();
		if (userList != null)
			for (User user : userList) 
				users.add(new ComboVO(user.name, user.name));
			
		map.put("users", CommonUtil.getGson().toJson(users));
		map.put("grid", grid);
		
		renderHtml(TemplateLoader.load(template("default/Logs/grid.html")).render(map));
	}

	@Perm
	public static void destroy(String models) {
		if (Log.deleteByJson(models))
			renderJSON(models);
	}

	@Perm
	public static void read(int page, int pageSize) {
		renderJSON(Log.search(page, pageSize, null, null, null, null, null, null, null, null, null, null));
	}

	@Perm
	public static void search(int page, int pageSize, String type, String name, String content,String startDate, String startTime, String endDate, String endTime, String actions, String userName, String ip) {
		renderJSON(Log.search(page, pageSize, type, name, content, startDate, startTime, endDate, endTime, actions, userName, ip));
	}

}
