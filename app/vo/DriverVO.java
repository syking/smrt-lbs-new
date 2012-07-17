package vo;

import models.Driver;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/8/12
 * Time: 3:19 PM
 */
public class DriverVO
{

    public DriverVO init(Driver driver){
        this.id = String.valueOf(driver.id);
        this.number = driver.number;
        this.name = driver.name;
        this.description = driver.description;

        return this;
    }

    public String id;
    public String number;
    public String name;
    public String description;
	@Override
	public String toString() {
		return "DriverVO [id=" + id + ", number=" + number + ", name=" + name
				+ ", description=" + description + "]";
	}
    
}
