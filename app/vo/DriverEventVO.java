package vo;

import models.Fleet;

public class DriverEventVO {
	public String type;
	public int value;
	public DriverEventVO(String type, int value) {
		super();
		this.type = type;
		this.value = value;
	}
}
