package vo;

import java.util.HashSet;
import java.util.Set;

public class FleetTree {

	public String id;
	public String text;
	public boolean expanded = true;
	public Set<FleetTree> items = new HashSet<FleetTree>();
	
	public FleetTree(String id, String text) {
		super();
		this.id = id;
		this.text = text;
	}	
	
}
