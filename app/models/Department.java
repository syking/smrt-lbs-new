package models;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import play.db.jpa.Model;
import play.db.jpa.Transactional;
import utils.CommonUtil;
import vo.ChartSerie;
import vo.DepartmentVO;
import vo.DepartmentVO;
import vo.EventReportVO;
import vo.TreeView;

/**
 * 司机部门
 * @author weiwei
 *
 */
@Entity
@Table(name="t_department")
public class Department extends Model{

	@Column(unique = true)
	public String name;
	
	@ManyToOne(fetch=FetchType.EAGER)
	public Department parent;

	@OneToMany(mappedBy = "parent", fetch = FetchType.EAGER)
	public Set<Department> children;//子部门
	
	@OneToMany(mappedBy = "department", fetch = FetchType.EAGER)
	public Set<Driver> drivers = new HashSet<Driver>(); 
	
	@Transient
	public final static String iconUrl = "../../public/images/fleet.png";
	
	public static void createByJson(String models) {
		DepartmentVO deptVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), DepartmentVO.class);
		Department dept = new Department();
		dept.name = deptVO.name;
		dept.parent = Department.findByName(deptVO.parentName);
		
		dept.create();
	}
	
	public static void updateByJson(String models) {
		DepartmentVO departmentVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), DepartmentVO.class);
		Long id = departmentVO.id;
		Department department = Department.findById(id);
		if (department == null)
			return ;
		
		department.name = departmentVO.name;
		department.parent = Department.findByName(departmentVO.parentName);
		
		department.save();
	}

	public static void deleteByJson(String models) {
		DepartmentVO departmentVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), DepartmentVO.class);
		Long id = departmentVO.id;
		Department department = Department.findById(id);
		if (department == null)
			return ;
		
		department.delete();
	}
	
	public static List<Department> findByCondition(final String name, final String parentName){
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		final StringBuilder sqlSB = new StringBuilder();
		final List<Object> params = new ArrayList<Object>();
		
		Department parent = Department.findByName(parentName);
		if (parent != null) {
			sqlSB.append("parent = ?");
			params.add(parent);
		}

		if (name != null && name.trim().length() > 0) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("name like ?");
			params.add("%" + name + "%");
		}

		List<Department> departments = Department.find(sqlSB.toString(), params.toArray()).fetch();
		
		return departments;
	}
	
	public static List<DepartmentVO> assemDepartmentVO(List<Department> departments){
		List<DepartmentVO> result = null ;
		if (departments != null && !departments.isEmpty()){
			result = new ArrayList<DepartmentVO>();
			for (Department department : departments)
				result.add(new DepartmentVO().init(department));
		}
		
		return result;
	}
	
	public static List<TreeView> assemDepartmentTree(){
		return assemDepartmentTree(null);
	}
	
	public static List<TreeView> assemDepartmentTree(Collection<Department> departments){
		return assemDepartmentTree(departments, true);
	}
	
	public static List<TreeView> assemDepartmentTree(Collection<Department> departments, boolean isRecursive){
		if (departments == null){
			departments = new HashSet<Department>();
			// 查询顶级车队
			List<Department> list = Department.find("parent is null").fetch();
			if (list == null)
				return null;
			
			departments.addAll(list);
		}
		
		List<TreeView> result = new ArrayList<TreeView>();
		for (Department d : departments){
			TreeView tv = new TreeView(String.valueOf(d.id), d.name, iconUrl);
			
			if (isRecursive && d.children != null && d.children.size() > 0){
				tv.items.addAll(assemDepartmentTree(d.children, isRecursive));
			}else{
				tv.items = null;
			}
			
			result.add(tv);
		}
		
		return result;
	}
	
	@Transactional
	public static boolean assignDriver(String departmentName, List<Long> drivers) {
		Department department = Department.findByName(departmentName);
		if (department == null)
			throw new RuntimeException("Department required !");
		
		if (drivers != null){
			for (Long id : drivers){
				Driver d = Driver.findById(id);
				if (d == null)
					continue;
				
				d.department = department;
				d.save();
			}
			
			return true;
		}
		
		return false;
	}
	
	// 找出某个部门下的所有车队不包含自己
	public static Collection<Department> findAllDepartment(Department department){
		Collection<Department> result = new ArrayList<Department>();
		
		if (department.children == null || department.children.isEmpty()){
			return result;
		}
		
		result.addAll(department.children);
		
		for (Department d : department.children){
			d = Department.findById(d.id);
			if (d.children != null && !d.children.isEmpty())
				result.addAll(findAllDepartment(d));
		}
		
		return result;
	}

	public static List<Department> findAndOrderByIdDesc() {
		return find("order by id desc").fetch();
	}

	public static Department findByName(String name) {
		return find("byName", name).first();
	}
	
	public static List<Department> findByParent(Long parentId){
		String sql = "";
    	List<Long> params = new ArrayList<Long>(1);
    	if (parentId != null && parentId > 0){
    		sql = "and d.parent.id = ? " ;
    		params.add(parentId);
    	}
    	
		return Department.find("select d from Department d where d.id not in (select dt.parent.id from Department dt where dt.parent.id is not null) " + sql, params.toArray()).fetch();
	}
	
	public static Map assemReport(Collection<Department> departments, String timeType, String time) {
    	//---------------chart----------------------------
    	List<EventReportVO> datas = new ArrayList<EventReportVO>();
		List<String> categories = new ArrayList<String>(departments.size());
		ChartSerie serie = new ChartSerie();
		//---------------chart----------------------------
		
		for (Department department : departments){
			categories.add(department.name);
			
			List<DriverReport> drs = DriverReport.findByDrivers(department.drivers, timeType, time);
			if (drs == null || drs.isEmpty())
				continue;
			
			EventReportVO drVO = new EventReportVO(drs, department);
			
			//--------char-------------
			serie.assemDriverReportData(drVO);
			datas.add(drVO);
    	}
		
		List<Map> series = serie.generateChartSeries();
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "drivingTime","performanceIndex","fleet", "route", "driver","driverNo", "id"));
		map.put("series", series);
		map.put("categories", categories);
		
		return map;
    }

}
