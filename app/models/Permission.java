package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * Permission of Role.
 * @author weiwei
 *
 */
@Entity
@Table(name = "t_permission")
public class Permission extends Model{

	/**
	 * the route of Controller.method
	 */
	@Column(unique = true)
	public String uri;
	
	/**
	 * the business name of Controller.method
	 */
	@Column(unique = true)
	public String name;
	
	@Column(name="description")
	public String desc;
	
}
