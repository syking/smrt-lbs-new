package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.RoleVO;
import vo.TreeView;

import com.alibaba.fastjson.JSON;

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
		return String.valueOf(id);
	}

	public Role() {
		super();
	}
	
	public Role(String name, String desc) {
		super();
		this.name = name;
		this.desc = desc;
	}
	
	public static Role fetchById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Role role = Role.findById(id);
		if (role == null)
			throw new RuntimeException("id invalid");
		
		return role;
	}
	
	public static RoleVO createByVO(RoleVO vo) {
		if (vo == null)
			throw new RuntimeException("Role info required");
		
		vo.validate();
		Role db_role = Role.findByName(vo.name);
		if (db_role != null)
			throw new RuntimeException("Name duplicate!");
		
		Role role = new Role(vo.name, vo.desc);
		role.create();
		
		vo.id = String.valueOf(role.id);
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<RoleVO> vos = JSON.parseArray(models, RoleVO.class);
		if (vos == null)
			return models;
		
		for (RoleVO vo : vos){
			vo = Role.createByVO(vo);
		}
		
		String _models = JSON.toJSONString(vos);
		
		return _models;
	}
	
	public static void deleteById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Role role = Role.findById(id);
		if (role == null)
			throw new RuntimeException("Role not found") ;
		
		if ((role.users != null && !role.users.isEmpty()) || (role.permissions != null && !role.permissions.isEmpty()))
			throw new RuntimeException("Could Not Delete This Role Cause It is Assigned to Users or Permissions!");
		
		role.delete();
	}

	public static void deleteByVO(RoleVO vo) {
		if (vo == null)
			throw new RuntimeException("Role info required");
		
		if (vo.id == null)
			throw new RuntimeException("id required");
		
		Long id = Long.parseLong(vo.id);
		Role.deleteById(id);
	}
	
	public static boolean deleteByJson(String models) {
		List<RoleVO> vos = JSON.parseArray(models, RoleVO.class);
		if (vos == null)
			return false;
		
		for (RoleVO vo : vos){
			Role.deleteByVO(vo);
		}
		
		return true;
	}

	public static void updateByVO(RoleVO vo) {
		if (vo == null)
			throw new RuntimeException("Role info required");
		
		vo.validate();
		Role role = Role.findById(Long.parseLong(vo.id));
		if (role == null)
			throw new RuntimeException("Role not found") ;
	
		role.name = vo.name;
		role.desc = vo.desc;
		
		Role db_role = Role.findByName(vo.name);
		if (db_role != null && db_role.id != role.id)
			throw new RuntimeException("Name duplicate!");
		
		role.save();
	}
	
	public static boolean updateByJson(String models) {
		List<RoleVO> vos = JSON.parseArray(models, RoleVO.class);
		if (vos == null)
			return false;
		
		for (RoleVO vo : vos){
			Role.updateByVO(vo);
		}
		
		return true;
	}
	
	public static List<Role> findByCondition(int page, int pageSize, String roleName, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		parseCondition(roleName, desc, params, sb);
		List<Role> roles = null;
		if (page > 0 && pageSize > 0)
			roles = Role.find(sb.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		else
			roles = Role.find(sb.toString() + " order by id desc", params.toArray()).fetch() ;
		
		return roles;
	}
	
	public static long countByCondition(String roleName, String desc) {
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		parseCondition(roleName, desc, params, sb);
		
		return Role.count(sb.toString(), params.toArray());
	}
	
	public static Map search(int page, int pageSize, String roleName, String desc) {
		Map map = new HashMap();
		map.put("total", Role.countByCondition(roleName, desc));
		map.put("roles", Role.assemVO(Role.findByCondition(page, pageSize, roleName, desc)));
		return map;
	}
	
	public static Map search(int page, int pageSize, RoleVO role) {
		if (role == null)
			return search(page, pageSize, null, null);
		
		return search(page, pageSize, role.name, role.desc);
	}

	private static void parseCondition(String roleName, String desc, final List<Object> params, final StringBuilder sb) {
		if (!CommonUtil.isBlank(roleName)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("name like ?");
			params.add(new StringBuilder("%").append(roleName.trim()).append("%").toString());
		}
		
		if (!CommonUtil.isBlank(desc)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("description like ?");
			params.add(new StringBuilder("%").append(desc.trim()).append("%").toString());
		}
	}
	
	public static List<RoleVO> assemVO(List<Role> roles) {
		List<RoleVO> result = null;
		if (roles != null){
			result = new ArrayList<RoleVO>(roles.size());
			for (Role r : roles)
				result.add(new RoleVO(r));
		}
		
		return result;
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

	public static void assignUserAndPerm(String roleName, List<Long> users, List<Long> perms) {
		Role role = Role.findByName(roleName);
		assign(role, users, perms, true);
	}
	
	public static void assign(Long roleId, List<Long> userIds, List<Long> permIds, boolean isRemove) {
		Role role = Role.findById(roleId);
		assign(role, userIds, permIds, isRemove);
	}
	
	public static void unassign(Long roleId, List<Long> userIds, List<Long> permIds) {
		Role role = Role.findById(roleId);
		unassign(role, userIds, permIds);
	}

	private static void assign(Role role, List<Long> users, List<Long> perms, final boolean isRemove) {
		if (role == null)
			throw new RuntimeException("Role required !");
		
		if (isRemove){
			role.users = new HashSet<User>();
			role.permissions = new HashSet<Permission>();
		}
		
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
		}
	}
	
	private static void unassign(Role role, List<Long> users, List<Long> perms) {
		if (role == null)
			throw new RuntimeException("Role required !");
		
		if (users != null){
			for (Long uid : users){
				User u = User.findById(uid);
				if (u == null)
					continue;
				
				role.users.remove(u);
			}
		}
		
		if (perms != null){
			for (Long pid : perms){
				Permission p = Permission.findById(pid);
				if (p == null)
					continue;
				
				role.permissions.remove(p);
			}
		}
		
		if (users != null || perms != null){
			role.save();
		}
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
