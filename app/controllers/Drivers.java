package controllers;

import annotations.Perm;

import com.google.gson.Gson;

import models.Department;
import models.Driver;
import models.DriverReport;
import models.User;
import notifiers.MyMailer;

import org.apache.commons.lang.StringUtils;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.DriverVO;
import vo.Grid;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

/**
 * Drivers Http Request Handler
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Drivers extends Controller {
	
	@Perm
	public static void search(int page, int pageSize, String department, String number, String name, String description) {
		renderJSON(Driver.search(page, pageSize, department, number, name, description));
	}
	
	@Perm
	public static void add(String models) {
		renderJSON(Driver.createByJson(models));
	}

	@Perm
	public static void destroy(String models) {
		if (Driver.deleteByJson(models))
			renderJSON(models);
	}

	@Perm
	public static void update(String models) {
		if (Driver.updateByJson(models))
			renderJSON(models);
	}

	@Perm
	public static void read(int page, int pageSize) {
		renderJSON(Driver.search(page, pageSize, null, null, null, null));
	}

	@Perm
	public static void grid(String id) {
		final String preUrl = "/Drivers/";
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // drivers
		grid.createUrl = preUrl + "add";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(DriverVO.class, "id"));

		List<Department> deptList = Department.findAll();
		List<ComboVO> depts = new ArrayList<ComboVO>();
		if (deptList != null)
			for (Department dept : deptList) 
				depts.add(new ComboVO(dept.name, dept.name));
			
		map.put("departments", CommonUtil.getGson().toJson(depts));
		map.put("grid", grid);
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Drivers/grid.html")).render(map));
	}

}
