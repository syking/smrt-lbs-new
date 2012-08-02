package vo;

import utils.CommonUtil;
import models.Role;

public class RoleVO {

	public String id;
	public String name;
	public String desc;
	
	public RoleVO(){}
	
	public RoleVO(Role role) {
		super();
		this.id = String.valueOf(role.id);
		this.name = role.name;
		this.desc = role.desc;
	}
	
	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can't be empty, ";
		if (CommonUtil.isEmptyString(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
}
