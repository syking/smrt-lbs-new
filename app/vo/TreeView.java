package vo;

import java.util.HashSet;
import java.util.Set;

public class TreeView {

	public String id;
	public String text;
	public String expanded;
	public String imageUrl;
	public Set<TreeView> items = new HashSet<TreeView>(); 

	public TreeView(String id, String text) {
		super();
		this.id = id;
		this.text = text;
	}

	public TreeView(String id, String text, String imageUrl) {
		super();
		this.id = id;
		this.text = text;
		this.imageUrl = imageUrl;
	}

}
