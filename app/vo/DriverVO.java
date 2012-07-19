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
        this.id = String.valueOf(driver.id);
        this.number = driver.number;
        this.name = driver.name;
        this.email = driver.email;
        this.description = driver.description;

        return this;
    }

    public String id;
    public String number;
    public String name;
    public String email;
    public String description;
    
    public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can't be empty, ";
		if (CommonUtil.isEmptyString(number))
			builder.append(CommonUtil.formatStr(msg, "Number"));
		
		if (CommonUtil.isEmptyString(name))
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
