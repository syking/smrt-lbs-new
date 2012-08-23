package vo;

import utils.CommonUtil;
import models.User;

public class UserVO {

	public String id;
	public String account;
	public String name;
	public String password;
	public String desc;
	
	public UserVO(User user) {
		super();
		this.id = String.valueOf(user.id);
		this.account = user.account;
		this.name = user.name;
		this.password = user.password;
		this.desc = user.desc;
	}
	
	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(account))
			builder.append(CommonUtil.formatStr(msg, "Account"));
		
		if (CommonUtil.isBlank(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
}
