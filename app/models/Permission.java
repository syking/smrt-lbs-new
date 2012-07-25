package models;

import java.util.ArrayList;
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

	public static String createByJson(String models) {
		List<PermVO> vos = JSON.parseArray(models, PermVO.class);
		if (vos == null)
			return models;
		
		for (PermVO vo : vos){
			vo.validate();
			Permission p = new Permission(vo.action, vo.desc);
			p.create();
			vo.id = String.valueOf(p.id);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}

	public static boolean deleteByJson(String models) {
		List<PermVO> vos = JSON.parseArray(models, PermVO.class);
		if (vos == null)
			return false;
		
		for (PermVO vo : vos){
			Permission permission = Permission.findById(Long.parseLong(vo.id));
			if (permission == null)
				continue ;
			try {
				permission.delete();
			} catch (Throwable e) {
				throw new RuntimeException("Could Not Delete This Permission Cause It is Assigned to Roles !");
			}
		}
		
		return true;
	}

	public static boolean updateByJson(String models) {
		List<PermVO> vos = JSON.parseArray(models, PermVO.class);
		if (vos == null)
			return false;
		
		for (PermVO vo : vos){
			vo.validate();
			Permission permission = Permission.findById(Long.parseLong(vo.id));
			if (permission == null)
				continue ;
			permission.action = vo.action;
			permission.desc = vo.desc;
			
			permission.save();
		}
		
		return true;
	}
	
	public static List<Permission> findByCondition(String action, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		
		if (action != null && !action.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("action like ?");
			params.add(new StringBuilder("%").append(action).append("%").toString());
		}
		
		if (desc != null && !desc.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("description like ?");
			params.add(new StringBuilder("%").append(desc).append("%").toString());
		}
		
		List<Permission> permissions = Permission.find(sb.toString(), params.toArray()).fetch() ;
		
		return permissions;
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
	
}
