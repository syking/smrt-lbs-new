package vo;

import java.util.HashSet;
import java.util.Set;

public class TreeView {

	public String id;
	public String text;
	public boolean expanded = true;
	public Set<TreeView> items = new HashSet<TreeView>();
	
	public TreeView(String id, String text) {
		super();
		this.id = id;
		this.text = text;
	}	
	
}
