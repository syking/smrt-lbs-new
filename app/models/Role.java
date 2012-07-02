package models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * The Role to Visit System of User.
 * @author weiwei
 *
 */
@Entity
@Table(name = "t_role")
public class Role extends Model{

	@Column(unique = true)
	public String name;
	
	@Column(name = "description")
	public String desc;

	@ManyToMany
	@JoinTable(name = "t_role_perm", joinColumns=@JoinColumn(name = "role_id"), inverseJoinColumns=@JoinColumn(name="perm_id"))
	public List<Permission> permissions = new ArrayList<Permission>();
	
}
