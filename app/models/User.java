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
import vo.DepartmentVO;
import vo.TreeView;
import vo.UserVO;

@Entity
@Table(name = "t_user")
public class User extends Model {

	@Column(unique = true)
	public String account;

	public String password;

	@Column(unique = true)
	public String name;

	@Column(name = "description")
	public String desc;
	
	@Column(name = "super_power")
	public int superPower = 0;// 1 or 0
	
	@Transient
	public final static String iconUrl = "../../public/images/user.png";
	
	public User(){
		super();
	}
	
	public User(String account, String password, String name, String desc) {
		super();
		this.account = account;
		this.password = password;
		this.name = name;
		this.desc = desc;
	}

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name="t_user_role", joinColumns=@JoinColumn(name="user_id"), inverseJoinColumns=@JoinColumn(name="role_id"))
	public Set<Role> roles = new HashSet<Role>();

	public static interface Constant {
		public final String LOGIN_USER_ATTR = "login_user";
		public final String LOGIN_ACTIVE_TIME = "30mn";
		public final String THEME = "theme";
	}

	public User authen(){
		User loginUser = find("byAccount", account).first();
		if (loginUser == null)
			return null;

		if (!account.equals(loginUser.account) || !password.equals(loginUser.password))
			return null;

		return loginUser;
	}

	public static String createByJson(String models) {
		List<UserVO> vos = CommonUtil.parseArray(models, UserVO.class);
		if (vos == null)
			return models;
		
		for (UserVO vo : vos){
			vo.validate();
			
			User user = new User(vo.account, "123456", vo.name, vo.desc);
			user.create();
			vo.id = String.valueOf(user.id);
		}
		
		final String _models = CommonUtil.toJson(vos);
		
		return _models;
	}

	public static boolean deleteByJson(String models) {
		List<UserVO> vos = JSON.parseArray(models, UserVO.class);
		if (vos == null)
			return false;
		
		for (UserVO vo : vos){
			User user = User.findById(Long.parseLong(vo.id));
			if (user == null)
				continue ;
			
			user.delete();
		}
		return true;
	}

	public static boolean updateByJson(String models) {
		List<UserVO> vos = JSON.parseArray(models, UserVO.class);
		if (vos == null)
			return false;
		
		for (UserVO vo : vos){
			vo.validate();
			
			User user = User.findById(Long.parseLong(vo.id));
			if (user == null)
				continue ;
		
			user.account = vo.account;
			user.name = vo.name;
			user.desc = vo.desc;
			user.save();
		}
		
		return true;
	}
	
	public static List<User> findByCondition(String roleName, String userName, String account, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		boolean isRoleHasUsers = false;
		Role role = null;
		if (roleName != null && !roleName.isEmpty()){
			role = Role.findByName(roleName);
			if (role == null || role.users == null || role.users.isEmpty()) 
					return null ;
				
			isRoleHasUsers = true;
		}
		
		if (userName != null && !userName.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("name like ?");
			params.add(new StringBuilder("%").append(userName).append("%").toString());
		}
		
		if (account != null && !account.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("account like ?");
			params.add(new StringBuilder("%").append(account).append("%").toString());
		}
		
		if (desc != null && !desc.isEmpty()){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("description like ?");
			params.add(new StringBuilder("%").append(desc).append("%").toString());
		}
		
		List<User> users = User.find(sb.toString(), params.toArray()).fetch() ;
		
		if (isRoleHasUsers){
			List<User> result = new ArrayList(role.users.size());
			for (User u : role.users){
				for (User uu : users){
					if (uu.id != u.id)
						continue;
				
					result.add(u);
				}
			}
			
			return result;
		}
		
		return users;
	}
	
	public static List<TreeView> assemTreeView(){
		List<TreeView> result = new ArrayList<TreeView>();
		List<User> users = User.findAll();
		if (users == null)
			return result;
		TreeView root = new TreeView("", "All Users", User.iconUrl);
		for (User u : users){
			TreeView tv = new TreeView(String.valueOf(u.id), u.name, User.iconUrl);
			tv.items = null;
			root.items.add(tv);
		} 
		
		root.expanded = true;
		result.add(root);
		
		return result;
	}

	public static User findByName(String userName) {
		return find("byName", userName).first();
	}
}
