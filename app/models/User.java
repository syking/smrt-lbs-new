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

import com.alibaba.fastjson.JSON;

import play.cache.Cache;
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

	public String email;
	
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
		public final String SESSION = "_eco_smrt_session_";
		public final String THEME = "theme";
	}

	public User authen(){
		User loginUser = find("byAccount", account).first();
		if (loginUser == null || password == null || !CommonUtil.md5(password).equals(loginUser.password))
			throw new RuntimeException("Account or Password is incorrect.");

		return loginUser;
	}

	public static UserVO createByVO(UserVO vo) {
		if (vo == null)
			throw new RuntimeException("User info required");
		
		vo.validate();
		
		User user = new User(vo.account, vo.password, vo.name, vo.desc);
		
		User db_user = User.findByName(vo.name);
		if (db_user != null)
			throw new RuntimeException("Name duplicate!");
		
		User db_user2 = User.findByAccount(vo.account);
		if (db_user2 != null)
			throw new RuntimeException("Account duplicate!");
		
		user.password = CommonUtil.md5(user.password);
		user.create();
		vo.id = String.valueOf(user.id);
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<UserVO> vos = CommonUtil.parseArray(models, UserVO.class);
		if (vos == null)
			return models;
		
		for (UserVO vo : vos){
			vo = createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		
		return _models;
	}

	private static User findByAccount(String account) {
		if (CommonUtil.isBlank(account))
			return null;
		
		return User.find("byAccount", account).first();
	}

	public static void deleteById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		User user = User.findById(id);
		if (user == null)
			throw new RuntimeException("User not found");
		
		try {
			user.delete();
		} catch (Throwable e){
			throw new RuntimeException("Could not delete this User cause it is assigned to Counselling !");
		}
	}
	
	public static void deleteByVO(UserVO vo) {
		if (vo == null)
			throw new RuntimeException("User info required");
		
		if (vo.id == null)
			throw new RuntimeException("id required");
		
		User.deleteById(Long.parseLong(vo.id));
	}
	
	public static boolean deleteByJson(String models) {
		List<UserVO> vos = JSON.parseArray(models, UserVO.class);
		if (vos == null)
			return false;
		
		for (UserVO vo : vos){
			deleteByVO(vo);
		}
		
		return true;
	}
	
	public static void updateByVO(UserVO vo) {
		if (vo == null)
			throw new RuntimeException("User info required");
		
		vo.validate();
		User user = User.findById(Long.parseLong(vo.id));
		if (user == null)
			throw new RuntimeException("User not found") ;
	
		user.account = vo.account;
		user.name = vo.name;
		user.password = CommonUtil.md5(vo.password);
		user.desc = vo.desc;
		
		User db_user = User.findByName(vo.name);
		if (db_user != null && db_user.id != user.id)
			throw new RuntimeException("Name duplicate!");
		
		User db_user2 = User.findByAccount(vo.account);
		if (db_user2 != null && db_user2.id != user.id)
			throw new RuntimeException("Account duplicate!");
		
		user.save();
	}
	
	public static boolean updateByJson(String models) {
		List<UserVO> vos = JSON.parseArray(models, UserVO.class);
		if (vos == null)
			return false;
		
		for (UserVO vo : vos){
			updateByVO(vo);
		}
		
		return true;
	}
	
	public static List<User> findByCondition(int page, int pageSize, String userName, String account, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		
		parseCondition(userName, account, desc, params, sb);
		
		List<User> users = null;
		if (page > 0 && pageSize > 0)
			users = User.find(sb.toString() + " order by id desc", params.toArray()).fetch(page, pageSize) ;
		else 
			users = User.find(sb.toString() + " order by id desc", params.toArray()).fetch();
		
		return users;
	}
	
	public static long countByCondition(String userName, String account, String desc) {
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		
		parseCondition(userName, account, desc, params, sb);
		
		return User.count(sb.toString(), params.toArray());
	}

	private static void parseCondition(String userName, String account, String desc, final List<Object> params, final StringBuilder sb) {
		if (!CommonUtil.isBlank(userName)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("name like ?");
			params.add(new StringBuilder("%").append(userName.trim()).append("%").toString());
		}
		
		if (!CommonUtil.isBlank(account)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("account like ?");
			params.add(new StringBuilder("%").append(account.trim()).append("%").toString());
		}
		
		if (!CommonUtil.isBlank(desc)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("description like ?");
			params.add(new StringBuilder("%").append(desc.trim()).append("%").toString());
		}
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
	
	public boolean checkPerm(Permission currentPerm){
		Set<Role> roles = this.roles;
		if (roles == null || roles.isEmpty())
			return false;
		
		for (Role r : roles){
			if (r.hasPermissions(currentPerm)){
				return true;
			}
		}
		
		return false;
	}
	
	public static List<UserVO> assemVO(List<User> users){
		List<UserVO> result = null;
		if (users != null){
			result = new ArrayList<UserVO>(users.size());
			for (User u : users){
				u.password = "";
				result.add(new UserVO(u));
			}
		}
		
		return result;
	}
	
	public static Map search(int page, int pageSize, String name, String account, String desc){
		List<User> users = User.findByCondition(page, pageSize, name, account, desc);
		List<UserVO> result = User.assemVO(users);
		Map map = new HashMap();
		map.put("total", User.countByCondition(name, account, desc));
		map.put("users", result);
		return map;
	}
	
	public static Map search(int page, int pageSize, UserVO user) {
		if (user == null)
			return search(page, pageSize, null, null, null);
		
		return search(page, pageSize, user.name, user.account, user.desc);
	}

	public static List<Long> toIds(Set<User> users) {
		List<Long> result = null;
		if (users != null){
			result = new ArrayList<Long>(users.size());
			for (User u : users) {
				result.add(u.id);
			}
		}
		return result;
	}
	
	public static User fetchById(Long id){
		if (id == null)
			throw new RuntimeException("id required");
		
		User user = User.findById(id);
		if (user == null)
			throw new RuntimeException("User not found");
		
		return user;
	}

	public void changePassword(String password, String newPassword, String confirmNewPassword) {
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(password))
			builder.append(CommonUtil.formatStr(msg, "Password"));
		
		if (CommonUtil.isBlank(newPassword))
			builder.append(CommonUtil.formatStr(msg, "New password"));
		
		if (CommonUtil.isBlank(confirmNewPassword)){
			builder.append(CommonUtil.formatStr(msg, "Confirm new password"));
		}else if (!CommonUtil.isBlank(newPassword) && !confirmNewPassword.equals(newPassword)){
			builder.append("The Confirm password must match the New password entry");
		}
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
		
		if (!CommonUtil.md5(password).equals(this.password))
			throw new RuntimeException("Incorrect current password ");
		
		this.password = CommonUtil.md5(newPassword);
		this.save();
	} 
	
}
