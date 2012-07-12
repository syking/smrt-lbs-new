package vo;

import models.Department;
import models.Fleet;

public class DepartmentVO {

	public long id;
	public String name;
	public String parentName;

	public DepartmentVO init(Department dept) {
		id = dept.id;
		name = dept.name;
		parentName = dept.parent == null ? "" : dept.parent.name;
		return this;
	}

}
