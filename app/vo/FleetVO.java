package vo;

import models.Fleet;

public class FleetVO {

	public long id;
	public String name;
	public String parent;
	public String description;
	public String placeNumber;

	public FleetVO init(Fleet fleet) {
		id = fleet.id;
		name = fleet.name;
		parent = fleet.parent == null ? "" : fleet.parent.name;
		description = fleet.description;
		placeNumber = fleet.placeNumber;
		return this;
	}

	@Override
	public String toString() {
		return "FleetVO [id=" + id + ", name=" + name + ", parent=" + parent
				+ ", description=" + description + ", placeNumber="
				+ placeNumber + "]";
	}

}
