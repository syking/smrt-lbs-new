package vo;

import models.Department;
import models.Fleet;

public class DepartmentVO {

	public long id;
	public String name;
	public String parent;

	public DepartmentVO init(Department dept) {
		id = dept.id;
		name = dept.name;
		parent = dept.parent == null ? "" : dept.parent.name;
		return this;
	}

}
