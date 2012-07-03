package vo;

import models.Role;

public class RoleVO {

	public String id;
	public String name;
	public String desc;
	public String permissions;
	public RoleVO(Role role) {
		super();
		this.id = String.valueOf(role.id);
		this.name = role.name;
		this.desc = role.desc;
		if (role.permissions != null)
			this.permissions = role.permissions.toString();
	}
	
}
