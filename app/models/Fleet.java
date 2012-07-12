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

	@OneToMany(mappedBy = "fleet", fetch = FetchType.EAGER)
	public Set<Driver> leaders = new HashSet<Driver>();
	
	@Transient
	public final static String iconUrl = "../../public/images/fleet.png";
	

	@Override
	public String toString() {
		return "Fleet [name=" + name + ", id=" + id + "]";
	}
	
	public static void createByJson(String models) {
		FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
		Fleet fleet = new Fleet();
		fleet.name = fleetVO.name;
		fleet.description = fleetVO.description;
		fleet.placeNumber = fleetVO.placeNumber;
		fleet.parent = Fleet.findByName(fleetVO.parentName);
		
		fleet.save();
	}
	
	public static void updateByJson(String models) {
		FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
		Long id = fleetVO.id;
		Fleet fleet = Fleet.findById(id);
		if (fleet == null)
			return ;
		
		fleet.name = fleetVO.name;
		fleet.description = fleetVO.description;
		fleet.placeNumber = fleetVO.placeNumber;
		fleet.parent = Fleet.findByName(fleetVO.parentName);
		
		fleet.save();
	}

	public static void deleteByJson(String models) {
		FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
		Long id = fleetVO.id;
		Fleet fleet = Fleet.findById(id);
		if (fleet == null)
			return ;
		
		fleet.delete();
	}
	
	public static List<Fleet> findByCondition(final String placeNumber, final String name){
		// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
		StringBuilder sqlSB = new StringBuilder();
		List<Object> params = new ArrayList<Object>();
		if (placeNumber != null && placeNumber.trim().length() > 0) {
			sqlSB.append("placeNumber like ?");
			params.add("%" + placeNumber + "%");
		}

		if (name != null && name.trim().length() > 0) {
			if (sqlSB.length() > 0)
				sqlSB.append(" and ");
			
			sqlSB.append("name like ?");
			params.add("%" + name + "%");
		}

		List<Fleet> fleets = Fleet.find(sqlSB.toString(), params.toArray()).fetch();
		
		return fleets;
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
	
	@Transactional
	public static boolean assignDriverAndVehicle(String fleetName, List<Long> drivers, List<Long> vehicles) {
		Fleet fleet = Fleet.findByName(fleetName);
		if (fleet == null)
			throw new RuntimeException("Fleet required !");
		
		if (drivers != null){
			for (Long id : drivers){
				Driver d = Driver.findById(id);
				if (d == null)
					continue;
				
				d.fleet = fleet;
				d.save();
			}
		}
		
		if (vehicles != null){
			for (Long id : vehicles){
				Vehicle v = Vehicle.findById(id);
				if (v == null)
					continue;
				
				v.fleet = fleet;
				v.save();
			}
		}
		
		if (drivers != null || vehicles != null){
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
}
