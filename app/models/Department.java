package models;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * 司机部门
 * @author weiwei
 *
 */
@Entity
@Table(name="t_department")
public class Department extends Model{

	@Column(unique = true)
	public String name;
	
	@ManyToOne(fetch=FetchType.EAGER)
	public Department parent;
	
}
