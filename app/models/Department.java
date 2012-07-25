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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import notifiers.MyMailer;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import play.db.jpa.Transactional;
import utils.CommonUtil;
import vo.ChartSerie;
import vo.DepartmentVO;
import vo.DepartmentVO;
import vo.EventReportVO;
import vo.FleetVO;
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
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "t_dept_leader", joinColumns=@JoinColumn(name = "dept_id"), inverseJoinColumns=@JoinColumn(name="leader_id"))
	public Set<Driver> leaders = new HashSet<Driver>();
	
	@Transient
	public final static String iconUrl = "../../public/images/fleet.png";
	
	public static String createByJson(String models) {
		List<DepartmentVO> vos = JSON.parseArray(models, DepartmentVO.class);
		if (vos == null)
			return models;
		
		for (DepartmentVO vo : vos){
			vo.validate();
			
			Department dept = new Department();
			dept.name = vo.name;
			dept.parent = Department.findByName(vo.parentName);
			if (vo.parentName != null && !vo.parentName.isEmpty() && dept.parent == null)
				throw new RuntimeException("ParentName is invalid!");
			
			dept.create();
			vo.id = String.valueOf(dept.id);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}
	
	public static boolean updateByJson(String models) {
		List<DepartmentVO> vos = JSON.parseArray(models, DepartmentVO.class);
		if (vos == null)
			return false;
		
		for (DepartmentVO vo : vos){
			Long id = Long.parseLong(vo.id);
			Department department = Department.findById(id);
			if (department == null)
				continue ;
			
			department.name = vo.name;
			department.parent = Department.findByName(vo.parentName);
			if (vo.parentName != null && !vo.parentName.isEmpty() && department.parent == null)
				throw new RuntimeException("ParentName is invalid!");
			
			department.save();
		}
		
		return true;
	}

	public static boolean deleteByJson(String models) {
		List<DepartmentVO> vos = JSON.parseArray(models, DepartmentVO.class);
		if (vos == null)
			return false;
		
		for (DepartmentVO vo : vos){
			Long id = Long.parseLong(vo.id);
			Department department = Department.findById(id);
			if (department == null)
				continue ;
		
			if ((department.leaders != null && !department.leaders.isEmpty()) || (department.drivers != null && !department.drivers.isEmpty()))
				throw new RuntimeException("Could Not Delete This Department Cause It is Assigned to Drivers!");
			
			try {
				department.delete();
			} catch (Throwable e) {
				throw new RuntimeException("Could Not Delete This Department Cause It is A Parent Department of Other Department!");
			}
		}
		
		return true;
	}
	
	public static List<Department> findByCondition(int page, int pageSize, final String name, final String parentName){
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		final StringBuilder sqlSB = new StringBuilder();
		final List<Object> params = new ArrayList<Object>();
		parseCondition(name, parentName, sqlSB, params);

		List<Department> departments = null;
		if (page <= 0 || pageSize <= 0)
			departments = Department.find(sqlSB.toString(), params.toArray()).fetch();
		else
			departments = Department.find(sqlSB.toString(), params.toArray()).fetch(page, pageSize);
		
		return departments;
	}
	
	public static long countByCondition(final String name, final String parentName){
		final StringBuilder sqlSB = new StringBuilder();
		final List<Object> params = new ArrayList<Object>();
		parseCondition(name, parentName, sqlSB, params);
		
		return Department.count(sqlSB.toString(), params.toArray());
	}

	private static void parseCondition(final String name, final String parentName, final StringBuilder sqlSB, final List<Object> params) {
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
	public static boolean assignDriverAndLeader(String departmentName, List<Long> drivers, List<Long> leaders) {
		Department department = Department.findByName(departmentName);
		if (department == null)
			throw new RuntimeException("Department required !");
		
		if (drivers != null){
			for (Driver d : department.drivers){
				d.department = null;
				d.save();
			}
			
			for (Long id : drivers){
				Driver d = Driver.findById(id);
				if (d == null)
					continue;
				
				d.department = department;
				d.save();
			}
		}
		
		if (leaders != null){
			department.leaders = new HashSet<Driver>(leaders.size());
			for (Long id : leaders){
				Driver d = Driver.findById(id);
				if (d == null)
					continue;
				
				department.leaders.add(d);
			}
			
			department.save();
		}
		
		if (drivers != null || leaders != null)
			return true;
		
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
	
	public static void sendEmail(long departmentId, String timeType, String day){
		Department dept = Department.findById(departmentId);
		if (dept == null)
			throw new RuntimeException("Department not found!");
		if (dept.leaders == null || dept.leaders.isEmpty())
			throw new RuntimeException("Department leader not found!");
		if (!DriverReport.isValidTimeType(timeType) || day == null || day.isEmpty())
			throw new RuntimeException("timeType or time is invalid!");
		if (dept == null || dept.leaders == null || dept.leaders.isEmpty() || dept.drivers == null || dept.drivers.isEmpty())
			throw new RuntimeException("Department or Leaders or Drivers not found !");
		
		Map report = Driver.assemReport(dept.drivers, timeType, day);
		for (Driver leader : dept.leaders){
			EmailFlag flag = EmailFlag.findOne(timeType, day, leader.id, departmentId);
			if (flag == null){
				flag = new EmailFlag(timeType, day, leader, dept, false);
				flag.create();
			}
			
			if (flag.isEmail){
				System.out.println(dept.name+"."+leader.name+" "+timeType+" "+day+" has finished email");
				continue;
			}
			
			if (leader.email == null){
				flag.isEmail = false;
				new Log("email", "driver report", "send email to "+leader.name + " fail cause the leader has no email", null, "-", true).create();
				continue;
			}
			
			try{
				MyMailer.leaderMail(dept.name, report, timeType, leader);
				flag.isEmail = true;
			}catch(Throwable e){
				flag.isEmail = false;
				new Log("email", "driver report", "send email to "+leader.name + " fail->"+e.toString(), null, "-", false).create();
				continue;
			}
			
			flag.save();
		}
	}

}
