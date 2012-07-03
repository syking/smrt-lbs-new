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
import utils.CommonUtil;
import vo.RoleVO;

/**
 * The Role to Visit System of role.
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

	@Override
	public String toString() {
		return name;
	}

	public Role() {
		super();
	}
	
	public Role(String name, String desc) {
		super();
		this.name = name;
		this.desc = desc;
	}
	
	public static void createByJson(String models) {
		RoleVO roleVO = CommonUtil.jsonStr2JavaObj(models, RoleVO.class);
		Role role = new Role(roleVO.name, roleVO.desc);
		
		role.save();
	}

	public static void deleteByJson(String models) {
		RoleVO roleVO = CommonUtil.jsonStr2JavaObj(models, RoleVO.class);
		Role role = Role.findById(Long.parseLong(roleVO.id));
		if (role == null)
			return ;
		
		role.delete();
	}

	public static void updateByJson(String models) {
		RoleVO roleVO = CommonUtil.jsonStr2JavaObj(models, RoleVO.class);
		Role role = Role.findById(Long.parseLong(roleVO.id));
		if (role == null)
			return ;
		
		role.name = roleVO.name;
		role.desc = roleVO.desc;
		
		role.save();
	}
	
	public static List<Role> findByCondition(String roleName, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		
		if (roleName != null && !roleName.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("name like ?");
			params.add(new StringBuilder("%").append(roleName).append("%").toString());
		}
		
		if (desc != null && !desc.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("description like ?");
			params.add(new StringBuilder("%").append(desc).append("%").toString());
		}
		
		List<Role> roles = Role.find(sb.toString(), params.toArray()).fetch() ;
		
		return roles;
	}
}
