package services;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import models.Fleet;
import vo.FleetTree;

public class FleetService {

	public static List<FleetTree> assemFleetTree(){
		return assemFleetTree(null);
	}
	
	private static List<FleetTree> assemFleetTree(Set<Fleet> fleets){
		
		if (fleets == null){
			fleets = new HashSet<Fleet>();
			// 查询顶级车队
			List<Fleet> list = Fleet.find("parent is null").fetch();
			if (list == null)
				return null;
			
			fleets.addAll(list);
		}
		
		List<FleetTree> result = new ArrayList<FleetTree>();
		
		for (Fleet fl : fleets){
			FleetTree ft = new FleetTree(String.valueOf(fl.id), fl.name);
			if (fl.children != null && fl.children.size() > 0){
				ft.items.addAll(assemFleetTree(fl.children));
			}else{
				ft.expanded = false;
			}
			
			result.add(ft);
		}
		
		return result;
	}
	
}
