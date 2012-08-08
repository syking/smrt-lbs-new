package models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.ComboVO;
import vo.PermVO;
import vo.RoleVO;
import vo.TreeView;

/**
 * Permission of Role.
 * @author weiwei
 *
 */
@Entity
@Table(name = "t_permission")
public class Permission extends Model{

	public static List<String> actions = new ArrayList<String>();
	
	/**
	 * the name of Controller.method
	 */
	@Column(unique = true)
	public String action;
	
	@Column(name="description")
	public String desc;
	
	@Transient
	public final static String iconUrl = "../../public/images/permission.png";

	public String toString(){
		return action;
	}
	
	public Permission(){super();}
	
	public Permission(String action, String desc) {
		super();
		this.action = action;
		this.desc = desc;
	}

	public static PermVO createByVO(PermVO vo) {
		if (vo == null)
			throw new RuntimeException("Permission info required");
		vo.validate();
		Permission p = new Permission(vo.action, vo.desc);
		Permission db_p = Permission.findByAction(p.action);
		if (db_p != null)
			throw new RuntimeException("Action duplicate!");
		
		p.create();
		vo.id = String.valueOf(p.id);
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<PermVO> vos = JSON.parseArray(models, PermVO.class);
		if (vos == null)
			return models;
		
		for (PermVO vo : vos){
			Permission.createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}

	public static void deleteById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Permission permission = Permission.findById(id);
		if (permission == null)
			throw new RuntimeException("Permission not found") ;
		
		try {
			permission.delete();
		} catch (Throwable e) {
			throw new RuntimeException("Could Not Delete This Permission Cause It is Assigned to Roles !");
		}
	}
	
	public static void deleteByVO(PermVO vo) {
		if (vo == null)
			throw new RuntimeException("Permission info required");
		
		if (vo.id == null)
			throw new RuntimeException("id required");
		
		Permission.deleteById(Long.parseLong(vo.id));
	}
	
	public static boolean deleteByJson(String models) {
		List<PermVO> vos = JSON.parseArray(models, PermVO.class);
		if (vos == null)
			return false;
		
		for (PermVO vo : vos){
			Permission.deleteByVO(vo);
		}
		
		return true;
	}

	public static void updateByVO(PermVO vo) {
		vo.validate();
		Permission p = Permission.findById(Long.parseLong(vo.id));
		if (p == null)
			throw new RuntimeException("Permission not found") ;
		
		p.action = vo.action;
		p.desc = vo.desc;
		
		Permission db_p = Permission.findByAction(p.action);
		if (db_p != null && db_p.id != p.id)
			throw new RuntimeException("Action duplicate!");
		
		p.save();
	}
	
	public static boolean updateByJson(String models) {
		List<PermVO> vos = JSON.parseArray(models, PermVO.class);
		if (vos == null)
			return false;
		
		for (PermVO vo : vos){
			Permission.updateByVO(vo);
		}
		
		return true;
	}
	
	private static Permission findByAction(String action) {
		if (CommonUtil.isBlank(action))
			return null;
		
		return Permission.find("byAction", action.trim()).first();
	}
	
	public static List<Permission> findByCondition(int page, int pageSize, String action, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		parseCondition(action, desc, params, sb);
		
		List<Permission> permissions = null;
		if (page > 0 && pageSize > 0)
			permissions = Permission.find(sb.toString() + " order by id desc", params.toArray()).fetch(page, pageSize);
		else
			permissions = Permission.find(sb.toString() + " order by id desc", params.toArray()).fetch();
		return permissions;
	}

	public static long countByCondition(String action, String desc) {
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		parseCondition(action, desc, params, sb);
		
		return Permission.count(sb.toString(), params.toArray());
	}
	
	public static Map search(int page, int pageSize, String action, String desc) {
		Map map = new HashMap();
		map.put("total", Permission.countByCondition(action, desc));
		map.put("permissions", Permission.findByCondition(page, pageSize, action, desc));
		
		return map;
	}
	
	public static Map search(int page, int pageSize, PermVO perm) {
		if (perm == null)
			return search(page, pageSize, null , null);
		
		return search(page, pageSize, perm.action, perm.desc);
	}
	
	private static void parseCondition(String action, String desc,
			final List<Object> params, final StringBuilder sb) {
		if (!CommonUtil.isBlank(action)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("action like ?");
			params.add(new StringBuilder("%").append(action.trim()).append("%").toString());
		}
		
		if (!CommonUtil.isBlank(desc)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("description like ?");
			params.add(new StringBuilder("%").append(desc.trim()).append("%").toString());
		}
	}
	
	public static List<TreeView> assemTreeView() {
		List<TreeView> result = new ArrayList<TreeView>();
		
		List<Permission> perms = Permission.findAll();
		if (perms == null)
			return result;
		
		TreeView root = new TreeView("0", "All Permissions", Permission.iconUrl);
		
		final Map<String, TreeView> modules = new HashMap<String, TreeView>();
		for (Permission p : perms){
			if (!p.action.contains("."))
				continue;
			
			String[] names = p.action.split("\\.");
			final String moduleName = names[0];
			final String name = names[1];
			TreeView module = modules.get(moduleName);
			if (module == null){
				module = new TreeView("", moduleName, Permission.iconUrl);
				modules.put(moduleName, module);
			}
			
			TreeView tv = new TreeView(String.valueOf(p.id), name, Permission.iconUrl);
			tv.items = null;
			
			module.expanded = true;
			module.items.add(tv);
		} 
		
		root.expanded = true;
		root.items.addAll(modules.values());
		result.add(root);
		
		return result;
	}

	public static List<Long> toIds(Collection<Permission> permissions) {
		List<Long> result = null;
		if (permissions != null){
			result = new ArrayList<Long>(permissions.size());
			for (Permission p : permissions) {
				result.add(p.id);
			}
		}
		return result;
	}
	
	public static List<String> assemActions(){
		List<String> actionSet = Permission.actions;
		List<Permission> perms = Permission.findAll();
		List<String> actions = new ArrayList<String>();
		if (actionSet != null)
    		actionLoop:for (String a : actionSet){
    			for (Permission p : perms){
    				if (p.action.equals(a))
    					continue actionLoop;
    			}
    			
    			actions.add(a);
    		}
		
		return actions;
	}
	
	public static Permission fetchById(Long id){
		if (id == null)
			throw new RuntimeException("id required");
		
		Permission perm = Permission.findById(id);
		if (perm == null)
			throw new RuntimeException("id invalid");
		
		return perm;
	}
	
	public static void main(String[] args){
		Set<User> roles = new HashSet<User>();
		User role = new User();
		role.id = 1L;
		role.name = "name_1";
		roles.add(role);
		User role2 = new User();
		role2.id = 2L;
		role2.name = "name_2";
		roles.add(role2);
		
		System.out.println(roles);
		
		User role3 = new User();
		role3.id = 3L;
		roles.remove(role3);
		System.out.println(roles);
	}
}
