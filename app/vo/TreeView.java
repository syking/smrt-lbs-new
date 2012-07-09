package vo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class TreeView {

	public String id;
	public String text;
	public boolean expanded = false;
	public String imageUrl;
	public List<TreeView> items = new ArrayList<TreeView>(); 

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
