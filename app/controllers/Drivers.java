package controllers;

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
	
	public static void search(String department, String number, String name, String description) {
		try {
			List<Driver> drivers = Driver.findByCondition(department, number, name, description);
			List<DriverVO> vos = Driver.assemDriverVO(drivers);
			renderJSON(vos);
		} catch (Throwable e) {
			throw new RuntimeException("Driver Search Error -> " + e.getMessage());
		}
	}
	
	public static void listJson() {
		try {
			List<Driver> drivers = Driver.findAll();
			List<DriverVO> driverVOList = Driver.assemDriverVO(drivers);
			Map data = CommonUtil.assemGridData(driverVOList, "id");
	
			renderJSON(data);
		}catch (Throwable e) {
			throw new RuntimeException("Driver ListJson Error -> " + e.getMessage());
		}
	}

	public static void add(String models) {
		try {
			renderJSON(Driver.createByJson(models));
		} catch(Throwable e) {
			throw new RuntimeException("Driver Create Error -> " + e.getMessage());
		}
	}

	public static void destroy(String models) {
		try {
			if (Driver.deleteByJson(models))
				renderJSON(models);
		} catch (Throwable e) {
			throw new RuntimeException("Driver Destroy Error -> " + e.getMessage());
		}
	}

	public static void update(String models) {
		try {
			if (Driver.updateByJson(models))
				renderJSON(models);
		} catch (Throwable e) {
			throw new RuntimeException("Driver Update Error -> " + e.getMessage());
		}
	}

	public static void read(int page, int pageSize) {
		try {
			List<Driver> driverList = Driver.find("order by id desc").fetch();
			List<DriverVO> vos = Driver.assemDriverVO(driverList);
			renderJSON(vos);
		} catch (Throwable e) {
			throw new RuntimeException("Driver Read Error -> " + e.getMessage());
		}
	}

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
