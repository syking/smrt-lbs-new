package models;

import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name = "t_systemconfig")
public class SystemConfig extends Model {
	public String name;
	public String value;
	public String displayName;

	public SystemConfig(String name, String value, String displayName) {
		super();
		this.name = name;
		this.value = value;
		this.displayName = displayName;
	}

}
