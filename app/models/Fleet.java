package models;

import play.db.jpa.Model;
import vo.TreeView;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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

	@Override
	public String toString() {
		return "Fleet [name=" + name + ", description=" + description + ", placeNumber=" + placeNumber + "]";
	}

	public static List<TreeView> assemFleetTree(){
		return assemFleetTree(null);
	}
	
	private static List<TreeView> assemFleetTree(Set<Fleet> fleets){
		
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
			TreeView ft = new TreeView(String.valueOf(fl.id), fl.name);
			
			if (fl.children != null && fl.children.size() > 0)
				ft.items.addAll(assemFleetTree(fl.children));
			else
				ft.expanded = false;
			
			result.add(ft);
		}
		
		return result;
	}
	
}
