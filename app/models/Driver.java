package models;

import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

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

    public Driver(String number, String name, String description)
    {
        this.number = number;
        this.name = name;
        this.description = description;
    }

    @Override
    public String toString()
    {
        return "Driver{" +
                "id='" + id + '\'' +
                "number='" + number + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
