package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * 司机信息
 *
 */
@Entity
@Table(name="t_driver")
public class Driver extends Model{

	@Column(unique = true)
	public String number;
	public String name;
	public String description;
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Department department;

	public Driver(){}
	
    public Driver(String number, String name, String description){
        this.number = number;
        this.name = name;
        this.description = description;
    }

	@Override
	public String toString() {
		return "Driver [number=" + number + ", name=" + name + ", description="
				+ description + ", department=" + department + "]";
	}
    
    
}
