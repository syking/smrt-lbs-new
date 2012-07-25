package models;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.RoleVO;
import vo.TreeView;
import vo.UserVO;

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

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "t_role_perm", joinColumns=@JoinColumn(name = "role_id"), inverseJoinColumns=@JoinColumn(name="perm_id"))
	public Set<Permission> permissions = new HashSet<Permission>();
	
	@ManyToMany
	@JoinTable(name = "t_user_role", joinColumns=@JoinColumn(name = "role_id"), inverseJoinColumns=@JoinColumn(name="user_id"))
	public Set<User> users = new HashSet<User>();
	
	@Transient
	public final static String iconUrl = "../../public/images/role.png";

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
	
	public static String createByJson(String models) {
		List<RoleVO> vos = JSON.parseArray(models, RoleVO.class);
		if (vos == null)
			return models;
		
		for (RoleVO vo : vos){
			vo.validate();
			Role role = new Role(vo.name, vo.desc);
			role.create();
			vo.id = String.valueOf(role.id);
		}
		
		String _models = JSON.toJSONString(vos);
		
		return _models;
	}

	public static boolean deleteByJson(String models) {
		List<RoleVO> vos = JSON.parseArray(models, RoleVO.class);
		if (vos == null)
			return false;
		
		for (RoleVO vo : vos){
			Role role = Role.findById(Long.parseLong(vo.id));
			if (role == null)
				continue ;
			
			if ((role.users != null && !role.users.isEmpty()) || (role.permissions != null && !role.permissions.isEmpty()))
				throw new RuntimeException("Could Not Delete This Role Cause It is Assigned to Users or Permissions!");
			
			role.delete();
		}
		
		return true;
	}

	public static boolean updateByJson(String models) {
		List<RoleVO> vos = JSON.parseArray(models, RoleVO.class);
		if (vos == null)
			return false;
		
		for (RoleVO vo : vos){
			vo.validate();
			Role role = Role.findById(Long.parseLong(vo.id));
			if (role == null)
				continue ;
			role.name = vo.name;
			role.desc = vo.desc;
			
			role.save();
		}
		
		return true;
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
	
	public static List<TreeView> assemTreeView(){
		List<Role> roles = Role.findAll();
		return assemTreeView(roles);
	}
	
	public static List<TreeView> assemTreeView(List<Role> roles){
		List<TreeView> result = new ArrayList<TreeView>();
		if (roles == null)
			return result;
		
		for (Role r : roles){
			TreeView tv = new TreeView(String.valueOf(r.id), r.name, Role.iconUrl);
			tv.items = null;
			result.add(tv);
		}
		
		return result;
	}
	
	public static Role findByName(String roleName) {
		return Role.find("byName", roleName).first();
	}

	public static boolean assignUserAndPerm(String roleName, List<Long> users, List<Long> perms) {
		Role role = Role.findByName(roleName);
		if (role == null)
			throw new RuntimeException("Role required !");
		
		role.users = new HashSet<User>();
		role.permissions = new HashSet<Permission>();
		
		if (users != null){
			for (Long uid : users){
				User u = User.findById(uid);
				if (u == null)
					continue;
				
				role.users.add(u);
			}
		}
		
		if (perms != null){
			for (Long pid : perms){
				Permission p = Permission.findById(pid);
				if (p == null)
					continue;
				
				role.permissions.add(p);
			}
		}
		
		if (users != null || perms != null){
			role.save();
			
			return true;
		}
		
		return false;
	}
	
	public boolean hasPermissions(Permission perm){
		if (this.permissions != null) {
			for (Permission p : this.permissions){
				if (p.getId().equals(perm.id)) {
					return true;
				}
			}
		}
		
		return false;
	}
}
