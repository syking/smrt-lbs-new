package controllers;

import com.google.gson.Gson;
import models.Log;
import models.User;
import org.apache.commons.lang.StringUtils;
import play.mvc.Controller;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.LogVO;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created with IntelliJ IDEA. User: JunXi Date: 5/10/12 Time: 5:17 PM
 */
public class Logs extends Controller {
	
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

	public static void destroy(String models) {
		if (Log.deleteByJson(models))
			renderJSON(models);
	}

	public static void read(int page, int pageSize) {
		renderJSON(Log.search(page, pageSize, null, null, null, null, null, null, null, null, null, null));
	}

	public static void search(int page, int pageSize, String type, String name, String content,String startDate, String startTime, String endDate, String endTime, String actions, String userName, String ip) {
		renderJSON(Log.search(page, pageSize, type, name, content, startDate, startTime, endDate, endTime, actions, userName, ip));
	}

}
