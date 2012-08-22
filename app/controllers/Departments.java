package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import annotations.Perm;

import com.google.gson.Gson;

import models.Driver;
import models.Department;
import models.Permission;
import models.Role;
import models.User;
import models.Vehicle;

import play.mvc.*;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.DepartmentVO;
import vo.Grid;

/**
 * Department Controller
 * @author weiwei
 *
 */
@With(Interceptor.class)
public class Departments extends Controller {

	/**
	 * 访问部门管理页面
	 */
	@Perm
	public static void grid(String id) {
		Map map = new HashMap();
		Grid grid = new Grid();
		grid.tabId = id; // vehicles
		final String preUrl = "/Departments/";
		grid.createUrl = preUrl + "create";
		grid.updateUrl = preUrl + "update";
		grid.destroyUrl = preUrl + "destroy";
		grid.readUrl = preUrl + "read";
		grid.editable = "popup";
		grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(DepartmentVO.class, "id"));

		List<Department> depts = Department.findAndOrderByIdDesc();
		List<ComboVO> parents = new ArrayList<ComboVO>();
		if (depts != null)
			for (Department d : depts) 
				parents.add(new ComboVO(d.name, d.name));
		
		map.put("parents", CommonUtil.getGson().toJson(parents));
		
		List<String> nList = Department.find("select DISTINCT d.name from Department d ").fetch();
		List<ComboVO> names = new ArrayList<ComboVO>();
		if (nList != null)
			for (String s : nList) 
				names.add(new ComboVO(s, s));
		
		map.put("names", CommonUtil.getGson().toJson(names));
		map.put("grid", grid);

		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Departments/grid.html")).render(map));
	}
	
	/**
	 * 获取部门的树形结构 JSON 信息
	 */
	@Perm
	public static void tree() {
		renderJSON(Department.assemDepartmentTree());
	}
	
	/**
	 * 获取部门 JSON 信息
	 */
	@Perm
	public static void read(int page, int pageSize) {
		renderJSON(Department.search(page, pageSize, null, null));
	}

	/**
	 * 部门管理：添加部门信息
	 */
	@Perm
	public static void create(String models) {
		renderJSON(Department.createByJson(models));
	}
	
	/**
	 * 部门管理：更新部门信息
	 */
	@Perm
	public static void update(String models) {
		if (Department.updateByJson(models))
			renderJSON(models);
	}

	/**
	 * 部门管理：删除部门信息
	 */
	@Perm
	public static void destroy(String models) {
		if (Department.deleteByJson(models))
			renderJSON(models);
	}

	/**
	 * 检索部门信息，返回 JSON
	 */
	@Perm
	public static void search(int page, int pageSize, String name, String parent) {
		renderJSON(Department.search(page, pageSize, name, parent));
	}
	
	/**
	 * 打开部门分配页面
	 * @param id
	 */
	@Perm
	public static void assign(String id){
		Map map = new HashMap();
		map.put("tabid", id);
		Gson gson = new Gson();
		
		// 部门列表
		map.put("departments", gson.toJson(Department.assemDepartmentTree()));
		
		// 司机列表 同时也是 领导 列表
		map.put("drivers", gson.toJson(Driver.assemTreeView()));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Departments/assign.html")).render(map));
	}
	
	@Perm
	public static void assignDriverAndLeader(String departmentName, List<Long> drivers, List<Long> leaders){
		Map map = new HashMap();
		try{
			Department.assignDriverAndLeader(departmentName, drivers, leaders);
			map.put("success", true);
		}catch(Exception e){
			map.put("success", false);
			map.put("msg", e.getMessage());
		}
		
		renderJSON(map);
	}
	
	@Perm
	public static void drivers(String departmentName){
		Department department = Department.findByName(departmentName);
		Map map = new HashMap();
		List<Driver> validList = Driver.find("department is null").fetch();
		final String drivers = CommonUtil.getGson("number", "email", "description", "name", "department", "fleet", "iconUrl").toJson(department.drivers);
		final String valids = CommonUtil.getGson("number", "email", "description", "name", "department", "fleet", "iconUrl").toJson(validList);
		map.put("drivers", drivers);
		map.put("valids", valids);
		
		renderJSON(map);
	}
	
	@Perm
	public static void leaders(String departmentName){
		Department department = Department.findByName(departmentName);
		renderJSON(CommonUtil.getGson("number", "email", "description", "name", "department", "fleet", "iconUrl").toJson(department.leaders));
	}
	
	@Perm
	public static void filter(String departmentName){
		if (CommonUtil.isBlank(departmentName))
			renderJSON(Department.assemDepartmentTree());
		else
			renderJSON(Department.assemDepartmentTree(Department.findByCondition(-1,-1, departmentName, null), false));
	}

}
