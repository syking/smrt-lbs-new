package vo;

import models.User;

public class UserVO {

	public String id;
	public String account;
	public String name;
	public String desc;
	public String roles;
	
	public UserVO(User user) {
		super();
		this.id = String.valueOf(user.id);
		this.account = user.account;
		this.name = user.name;
		if (user.roles != null)
			this.roles = user.roles.toString();
		
		this.desc = user.desc;
	}
	
}
