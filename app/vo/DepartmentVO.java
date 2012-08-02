package vo;

import utils.CommonUtil;
import models.Department;
import models.Fleet;

public class DepartmentVO {

	public String id;
	public String name;
	public String parentName;

	public DepartmentVO(String id, String name, String parentName) {
		this.id = id;
		this.name = name;
		this.parentName = parentName;
	}
	
	public DepartmentVO(String name, String parentName){
		this.name = name;
		this.parentName = parentName;
	}
	
	public DepartmentVO(Department dept) {
		this.id = String.valueOf(dept.id);
		this.name = dept.name;
		this.parentName = dept.parent == null ? "" : dept.parent.name;
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
