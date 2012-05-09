package vo;

public class EventGPS {

	public String id;
	public String name;
	public int currentSpeed;
    public String xCoord;//lng
    public String yCoord;//lat
    public String activeStatus = "on";
	public String techName;
	@Override
	public String toString() {
		return "EventGPS [id=" + id + ", name=" + name + ", currentSpeed="
				+ currentSpeed + ", xCoord=" + xCoord + ", yCoord=" + yCoord
				+ ", activeStatus=" + activeStatus + ", techName=" + techName
				+ "]";
	}
	
	
}
