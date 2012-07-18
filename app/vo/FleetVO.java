package vo;

import utils.CommonUtil;
import models.Fleet;

public class FleetVO {

	public String id;
	public String name;
	public String parentName;
	public String description;
	public String placeNumber;

	public FleetVO init(Fleet fleet) {
		id = String.valueOf(fleet.id);
		name = fleet.name;
		parentName = fleet.parent == null ? "" : fleet.parent.name;
		description = fleet.description;
		placeNumber = fleet.placeNumber;
		return this;
	}

	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can't be empty, ";
		if (CommonUtil.isEmptyString(placeNumber))
			builder.append(CommonUtil.formatStr(msg, "PlaceNumber"));
		
		if (CommonUtil.isEmptyString(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
}
