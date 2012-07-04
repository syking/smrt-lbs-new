package vo;

import models.Permission;

public class PermVO {

	public String id;
	public String name;
	public String uri;
	public String desc;
	public PermVO(Permission p) {
		super();
		this.id = String.valueOf(p.id);
		this.name = p.name;
		this.uri = p.uri;
		this.desc = p.desc;
	}
	
	
	
}
