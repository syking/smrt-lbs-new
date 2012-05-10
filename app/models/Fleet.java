package models;

import play.db.jpa.Model;

import javax.persistence.*;
import java.util.Set;

/**
 * 车队，车辆分组
 * @author weiwei
 *
 */
@Entity
@Table(name="t_fleet")
public class Fleet extends Model{
	
	@Column(unique = true)
	public String name;//车队名称
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Fleet parent;//父车队
	
	@OneToMany(mappedBy = "parent", fetch = FetchType.EAGER)
	public Set<Fleet> children;//附属车队
	
	public String description;//描述
	
	@Column(name = "place_number")
	public String placeNumber;//区域
	
	@OneToMany(mappedBy = "fleet", fetch = FetchType.EAGER)
	public Set<Vehicle> vehicles;

	@Override
	public String toString() {
		return "Fleet [name=" + name + ", description=" + description
				+ ", placeNumber=" + placeNumber + "]";
	}

	
}
