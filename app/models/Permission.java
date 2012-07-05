package models;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.PermVO;
import vo.TreeView;

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
	
	@Transient
	public final static String iconUrl = "../../public/images/permission.png";

	public String toString(){
		return name;
	}
	
	public Permission(){super();}
	
	public Permission(String name, String uri, String desc) {
		super();
		this.uri = uri;
		this.name = name;
		this.desc = desc;
	}

	public static void createByJson(String models) {
		PermVO permVO = CommonUtil.jsonStr2JavaObj(models, PermVO.class);
		Permission permission = new Permission(permVO.name, permVO.uri, permVO.desc);
		
		permission.save();
	}

	public static void deleteByJson(String models) {
		PermVO permVO = CommonUtil.jsonStr2JavaObj(models, PermVO.class);
		Permission permission = Permission.findById(Long.parseLong(permVO.id));
		if (permission == null)
			return ;
		
		permission.delete();
	}

	public static void updateByJson(String models) {
		PermVO permVO = CommonUtil.jsonStr2JavaObj(models, PermVO.class);
		Permission permission = Permission.findById(Long.parseLong(permVO.id));
		if (permission == null)
			return ;
		
		permission.name = permVO.name;
		permission.uri = permVO.uri;
		permission.desc = permVO.desc;
		
		permission.save();
	}
	
	public static List<Permission> findByCondition(String permName, String uri, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		
		if (permName != null && !permName.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("name like ?");
			params.add(new StringBuilder("%").append(permName).append("%").toString());
		}
		
		if (uri != null && !uri.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("uri like ?");
			params.add(new StringBuilder("%").append(uri).append("%").toString());
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
			if (!p.name.contains("."))
				continue;
			
			String[] names = p.name.split("\\.");
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
	
	public static void main(String[] args){
		System.out.println(Arrays.asList("user.name".split("\\.")));
	}
	
}
