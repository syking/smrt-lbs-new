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

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import play.db.jpa.Transactional;
import utils.CommonUtil;
import vo.ChartSerie;
import vo.EventReportVO;
import vo.FleetVO;
import vo.TreeView;

/**
 * 车队，车辆分组
 * @author weiwei
 *
 */
@Entity
@Table(name="t_fleet")
public class Fleet extends Model{
	
	@Column(unique = true)
	public String name;//车队名称
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Fleet parent;//父车队
	
	@OneToMany(mappedBy = "parent", fetch = FetchType.EAGER)
	public Set<Fleet> children;//附属车队
	
	public String description;//描述
	
	@Column(name = "place_number")
	public String placeNumber;//区域
	
	@OneToMany(mappedBy = "fleet", fetch = FetchType.EAGER)
	public Set<Vehicle> vehicles = new HashSet<Vehicle>();

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "t_fleet_leader", joinColumns=@JoinColumn(name = "fleet_id"), inverseJoinColumns=@JoinColumn(name="leader_id"))
	public Set<Driver> leaders = new HashSet<Driver>();
	
	@Transient
	public final static String iconUrl = "../../public/images/fleet.png";

	@Override
	public String toString() {
		return "Fleet [name=" + name + ", id=" + id + "]";
	}
	
	public static FleetVO createByVO(FleetVO vo) {
		if (vo == null)
			throw new RuntimeException("Fleet info required");
		vo.validate();
		
		Fleet fleet = new Fleet();
		fleet.name = vo.name;
		fleet.description = vo.description;
		fleet.placeNumber = vo.placeNumber;
		fleet.parent = Fleet.findByName(vo.parentName);
		if (vo.parentName != null && !vo.parentName.isEmpty() && fleet.parent == null)
			throw new RuntimeException("ParentName is invalid!");
		
		Fleet db_fleet = Fleet.findByName(fleet.name);
		if (db_fleet != null)
			throw new RuntimeException("FleetName duplicate!");
		
		fleet.create();
		vo.id = fleet.id;
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<FleetVO> vos = JSON.parseArray(models, FleetVO.class);
		if (vos == null)
			return models;
		
		for (FleetVO vo : vos){
			createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}
	
	public static void updateByVO(FleetVO vo) {
		if (vo == null)
			throw new RuntimeException("Fleet info required");
		
		vo.validate();
		
		Fleet fleet = Fleet.findById(vo.id);
		if (fleet == null)
			throw new RuntimeException("id is invalid") ;
		
		fleet.name = vo.name;
		fleet.description = vo.description;
		fleet.placeNumber = vo.placeNumber;
		fleet.parent = Fleet.findByName(vo.parentName);
		if (vo.parentName != null && !vo.parentName.isEmpty() && fleet.parent == null)
			throw new RuntimeException("ParentName is invalid!");
		
		Fleet db_fleet = Fleet.findByName(fleet.name);
		if (db_fleet != null && db_fleet.id != fleet.id)
			throw new RuntimeException("FleetName duplicate!");
		
		fleet.save();
	}
	
	public static boolean updateByJson(String models) {
		List<FleetVO> vos = JSON.parseArray(models, FleetVO.class);
		if (vos == null)
			return false;
		
		for (FleetVO vo : vos){
			updateByVO(vo);
		}
		
		return true;
	}

	public static void deleteById(Long id) {
		Fleet fleet = Fleet.fetchById(id);
		
		if ((fleet.leaders != null && !fleet.leaders.isEmpty()) || (fleet.vehicles != null && !fleet.vehicles.isEmpty()))
			throw new RuntimeException("This Fleet is related to Drivers or Vehicles!");
		
		try {
			fleet.delete();
		} catch (Throwable e) {
			throw new RuntimeException("This Fleet is A Parent Fleet of Other Fleet!");
		}
	}
	
	public static boolean deleteByJson(String models) {
		List<FleetVO> vos = JSON.parseArray(models, FleetVO.class);
		if (vos == null)
			return false;
		
		for (FleetVO vo : vos){
			deleteById(vo.id);
		}
		
		return true;
	}
	
	public static List<Fleet> findByCondition(int page, int pageSize, final String placeNumber, final String name){
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(placeNumber, name, sqlSB, params);

		List<Fleet> fleets = null;
		if (page > 0 && pageSize > 0)
			fleets = Fleet.find(sqlSB.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		else
			fleets = Fleet.find(sqlSB.toString() + " order by id desc", params.toArray()).fetch();
		
		return fleets;
	}
	
	public static long countByCondition(final String placeNumber, final String name) {
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		parseCondition(placeNumber, name, sqlSB, params);
		
		return Fleet.count(sqlSB.toString(), params.toArray());
	}
	
	public static Map search(int page, int pageSize, FleetVO fleet) {
		if (fleet == null)
			return search(page, pageSize, null, null);
		
		return search(page, pageSize, fleet.placeNumber, fleet.name);
	}
	
	public static Map search(int page, int pageSize, String placeNumber, String name) {
		Map map  = new HashMap();
		map.put("total", Fleet.countByCondition(placeNumber, name));
		map.put("fleets", Fleet.assemFleetVO(Fleet.findByCondition(page, pageSize, placeNumber, name)));
		
		return map;
	}

	private static void parseCondition(final String placeNumber, final String name, StringBuilder sqlSB, List<Object> params) {
		if (!CommonUtil.isBlank(placeNumber)) {
			sqlSB.append("placeNumber like ?");
			params.add("%" + placeNumber + "%");
		}

		if (!CommonUtil.isBlank(name)) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("name like ?");
			params.add("%" + name + "%");
		}
	}
	
	public boolean contains(Fleet fleet){
		List<Fleet> all = new ArrayList<Fleet>(Fleet.findAllFleet(this));
		for (Fleet f : all){
			if (fleet.id.equals(f.id))
				return true;
		}
		
		return false;
	}
	
	public static List<FleetVO> assemFleetVO(List<Fleet> fleets){
		List<FleetVO> result = null ;
		if (fleets != null && !fleets.isEmpty()){
			result = new ArrayList<FleetVO>();
			for (Fleet fleet : fleets)
				result.add(new FleetVO().init(fleet));
		}
		
		return result;
	}
	
	public static List<TreeView> assemFleetTree(){
		return assemFleetTree(null);
	}
	
	public static List<TreeView> assemFleetTree(Collection<Fleet> fleets){
		return assemFleetTree(fleets, true);
	}
	
	public static List<TreeView> assemFleetTree(Collection<Fleet> fleets, boolean isRecursive){
		if (fleets == null){
			fleets = new HashSet<Fleet>();
			// 查询顶级车队
			List<Fleet> list = Fleet.find("parent is null").fetch();
			if (list == null)
				return null;
			
			fleets.addAll(list);
		}
		
		List<TreeView> result = new ArrayList<TreeView>();
		
		for (Fleet fl : fleets){
			TreeView ft = new TreeView(String.valueOf(fl.id), fl.name, iconUrl);
			
			if (isRecursive && fl.children != null && fl.children.size() > 0){
				ft.items.addAll(assemFleetTree(fl.children, isRecursive));
			}else{
				ft.items = null;
			}
			
			result.add(ft);
		}
		
		return result;
	}
	
	public static boolean assign(Long fleetId, List<Long> vehicles, List<Long> leaders, boolean isRemove) {
		Fleet fleet = Fleet.fetchById(fleetId);
		return assign(fleet, vehicles, leaders, isRemove);
	}
	
	public static boolean assign(String fleetName, List<Long> vehicles, List<Long> leaders) {
		Fleet fleet = Fleet.findByName(fleetName);
		if (fleet == null)
			throw new RuntimeException("Fleet required !");
		
		return assign(fleet, vehicles, leaders, true);
	}
	
	@Transactional
	public static boolean assign(Fleet fleet, List<Long> vehicles, List<Long> leaders, boolean isRemove) {
		if (leaders != null){
			if (isRemove)
				fleet.leaders = new HashSet<Driver>();
			
			for (Long id : leaders){
				Driver d = Driver.findById(id);
				if (d == null)
					continue;
				
				fleet.leaders.add(d);
			}
			
			fleet.save();
		}
		
		if (vehicles != null){
			if (isRemove){
				for (Vehicle v : fleet.vehicles){
					v.fleet = null;
					v.save();
				}
			}
			
			for (Long id : vehicles){
				Vehicle v = Vehicle.findById(id);
				if (v == null)
					continue;
				
				v.fleet = fleet;
				v.save();
			}
		}
		
		if (leaders != null || vehicles != null){
			return true;
		}
		
		return false;
	}
	
	@Transactional
	public static boolean unassign(Long fleetId, List<Long> vehicles, List<Long> leaders) {
		Fleet fleet = Fleet.fetchById(fleetId);
		if (leaders != null){
			for (Long id : leaders){
				Driver d = Driver.findById(id);
				if (d == null)
					continue;
				
				fleet.leaders.remove(d);
			}
			
			fleet.save();
		}
		
		if (vehicles != null){
			for (Long id : vehicles){
				Vehicle v = Vehicle.findById(id);
				if (v == null)
					continue;
				
				v.fleet = null;
				v.save();
			}
		}
		
		if (leaders != null || vehicles != null){
			return true;
		}
		
		return false;
	}
	
	// 找出某个车队下的所有车队不包含自己
	public static Collection<Fleet> findAllFleet(Fleet fleet){
		Collection<Fleet> result = new ArrayList<Fleet>();
		
		if (fleet.children == null || fleet.children.isEmpty()){
			return result;
		}
		
		result.addAll(fleet.children);
		
		for (Fleet f : fleet.children){
			f = Fleet.findById(f.id);
			if (f.children != null && !f.children.isEmpty())
				result.addAll(findAllFleet(f));
		}
		
		return result;
	}

	public static List<Fleet> findAndOrderByIdDesc() {
		return find("order by id desc").fetch();
	}

	public static Fleet findByName(String name) {
		return find("byName", name).first();
	}

	public static List<Fleet> findByParent(Long parentId){
		List<Fleet> fleets = null;
    	String sql = "";
    	List<Long> params = new ArrayList<Long>(1);
    	if (parentId != null && parentId > 0){
    		sql = "and f.parent.id = ? " ;
    		params.add(parentId);
    		
    		fleets = Fleet.find("select f from Fleet f where f.id not in (select fl.parent.id from Fleet fl where fl.parent.id is not null) " + sql, params.toArray()).fetch();
    	}else{
    		fleets = Fleet.findAll();
    	}
    	
    	return fleets;
	}
	
	@Deprecated
	public static Map assemReport(Collection<Fleet> fleets, String timeType, String time){
    	//---------------chart----------------------------
    	List<EventReportVO> datas = new ArrayList<EventReportVO>();
		List<String> categories = new ArrayList<String>(fleets.size());
		ChartSerie serie = new ChartSerie();
		//---------------chart----------------------------
		
		for (Fleet fleet : fleets){
			categories.add(fleet.name);
			fleet = Fleet.findById(fleet.id);
			System.out.println("fleet->"+fleet.name + " | drivers->" + fleet.leaders);
			List<DriverReport> drs = DriverReport.findByDrivers(fleet.leaders, timeType, time);
			if (drs == null || drs.isEmpty())
				continue;
			
			EventReportVO drVO = new EventReportVO(drs, fleet);
			//--------char-------------
			serie.assemDriverReportData(drVO);
			datas.add(drVO);
    	}
		
		List<Map> series = serie.generateChartSeries();
    	Map map = new HashMap();
		map.put("data", datas);
		map.put("columns", CommonUtil.assemColumns(EventReportVO.class, "department", "route", "driver", "driverNo", "id"));
		map.put("series", series);
		map.put("categories", categories);
		
		return map;
    }

	public static Fleet fetchById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Fleet fleet = Fleet.findById(id);
		if (fleet == null)
			throw new RuntimeException("id is invalid");
			
		return fleet;
	}
}
