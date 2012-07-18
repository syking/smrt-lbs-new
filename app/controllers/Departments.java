package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public static void tree() {
		renderJSON(Department.assemDepartmentTree());
	}
	
	/**
	 * 获取部门 JSON 信息
	 */
	public static void read() {
		List<Department> departments = Department.findAndOrderByIdDesc();
		List<DepartmentVO> result = Department.assemDepartmentVO(departments);
		
		renderJSON(result);
	}

	/**
	 * 部门管理：添加部门信息
	 */
	public static void create(String models) {
		if (Department.createByJson(models))
			renderJSON(models);
	}
	
	/**
	 * 部门管理：更新部门信息
	 */
	public static void update(String models) {
		if (Department.updateByJson(models))
			renderJSON(models);
	}

	/**
	 * 部门管理：删除部门信息
	 */
	public static void destroy(String models) {
		if (Department.deleteByJson(models))
			renderJSON(models);
	}

	/**
	 * 检索部门信息，返回 JSON
	 */
	public static void search(String name, String parent) {
		List<Department> departments = Department.findByCondition(name, parent);
		List<DepartmentVO> departmentVOList = Department.assemDepartmentVO(departments);

		renderJSON(departmentVOList);
	}
	
	/**
	 * 打开部门分配页面
	 * @param id
	 */
	public static void assign(String id){
		Map map = new HashMap();
		map.put("tabid", id);
		Gson gson = new Gson();
		
		// 部门列表
		map.put("departments", gson.toJson(Department.assemDepartmentTree()));
		
		// 司机列表
		map.put("drivers", gson.toJson(Driver.assemTreeView()));
		
		renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Departments/assign.html")).render(map));
	}
	
	public static void assignDriver(String departmentName, List<Long> drivers){
		Map map = new HashMap();
		try{
			boolean flag = Department.assignDriver(departmentName, drivers);
			map.put("success", flag);
		}catch(Exception e){
			map.put("success", false);
			map.put("msg", e.getMessage());
		}
		
		renderJSON(map);
	}
	
	public static void drivers(String departmentName){
		Department department = Department.findByName(departmentName);
		renderJSON(CommonUtil.getGson("number", "description", "name", "department", "fleet", "iconUrl").toJson(department.drivers));
	}
	
	public static void filter(String departmentName){
		if (departmentName == null || departmentName.isEmpty())
			renderJSON(Department.assemDepartmentTree());
		else
			renderJSON(Department.assemDepartmentTree(Department.findByCondition(departmentName, null), false));
	}

}
