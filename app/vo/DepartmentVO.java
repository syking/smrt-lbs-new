package vo;

import utils.CommonUtil;
import models.Department;
import models.Fleet;

public class DepartmentVO {

	public String id;
	public String name;
	public String parentName;

	public DepartmentVO init(Department dept) {
		id = String.valueOf(dept.id);
		name = dept.name;
		parentName = dept.parent == null ? "" : dept.parent.name;
		return this;
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
