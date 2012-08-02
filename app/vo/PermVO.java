package vo;

import utils.CommonUtil;
import models.Permission;

public class PermVO {

	public String id;
	public String action;
	public String desc;
	
	public PermVO(){}
	
	public PermVO(Permission p) {
		super();
		this.id = String.valueOf(p.id);
		this.action = p.action;
		this.desc = p.desc;
	}
	
	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can't be empty, ";
		
		if (CommonUtil.isEmptyString(action))
			builder.append(CommonUtil.formatStr(msg, "Action"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
	
}
