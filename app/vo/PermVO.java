package vo;

import models.Permission;

public class PermVO {

	public String id;
	public String action;
	public String desc;
	public PermVO(Permission p) {
		super();
		this.id = String.valueOf(p.id);
		this.action = p.action;
		this.desc = p.desc;
	}
	
	
	
}
