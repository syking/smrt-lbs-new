package models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import play.db.jpa.Model;
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
	public Set<Vehicle> vehicles;

	@Transient
	public final static String iconUrl = "../../public/images/fleet.png";
	

	@Override
	public String toString() {
		return "Fleet [name=" + name + ", id=" + id + "]";
	}
	
	/**
	 * 
	 * @param fleet
	 * @return
	 */
	public boolean contains(Fleet fleet){
		List<Fleet> all = new ArrayList<Fleet>(Fleet.findAllFleet(this));
		for (Fleet f : all){
			if (fleet.id.equals(f.id))
				return true;
		}
		
		return false;
	}
	
	public static Set<TreeView> assemFleetTree(){
		return assemFleetTree(null);
	}
	
	public static Set<TreeView> assemFleetTree(Set<Fleet> fleets){
		return assemFleetTree(fleets, true);
	}
	public static Set<TreeView> assemFleetTree(Set<Fleet> fleets, boolean isRecursive){
		
		if (fleets == null){
			fleets = new HashSet<Fleet>();
			// 查询顶级车队
			List<Fleet> list = Fleet.find("parent is null").fetch();
			if (list == null)
				return null;
			
			fleets.addAll(list);
		}
		
		Set<TreeView> result = new HashSet<TreeView>();
		
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
}
