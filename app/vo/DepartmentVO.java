package vo;

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

}
