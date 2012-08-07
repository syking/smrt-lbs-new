package vo;

import utils.CommonUtil;
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
        this.id = driver.id;
        this.number = driver.number;
        this.name = driver.name;
        this.email = driver.email;
        this.description = driver.description;
        if (driver.department != null)
        	this.department = driver.department.name;

        return this;
    }

    public Long id;
    public String number;
    public String name;
    public String email;
    public String department = "-";
    public String description;
    
    public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(number))
			builder.append(CommonUtil.formatStr(msg, "Number"));
		
		if (CommonUtil.isBlank(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		if (!CommonUtil.isValidEmail(email))
			builder.append(CommonUtil.formatStr(" %s is invalid email format, ", "Email"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
    
	@Override
	public String toString() {
		return "DriverVO [id=" + id + ", number=" + number + ", name=" + name
				+ ", description=" + description + "]";
	}
	
}
