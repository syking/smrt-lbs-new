package vo;

import models.Fleet;

public class FleetVO {

	public long id;
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

}
