package vo;

import utils.CommonUtil;
import models.Fleet;

public class FleetVO {

	public Long id;
	public String name;
	public String parentName;
	public String description;
	public String placeNumber;

	public FleetVO init(Fleet fleet) {
		id = fleet.id;
		name = fleet.name;
		parentName = fleet.parent == null ? "" : fleet.parent.name;
		description = fleet.description;
		placeNumber = fleet.placeNumber;
		return this;
	}

	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(placeNumber))
			builder.append(CommonUtil.formatStr(msg, "PlaceNumber"));
		
		if (CommonUtil.isBlank(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
}
