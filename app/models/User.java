package models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import net.sf.json.JSONObject;

import play.db.jpa.Model;
import utils.CommonUtil;
import vo.UserVO;
import vo.VehicleVO;

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

	@ManyToMany
	@JoinTable(name="t_user_role", joinColumns=@JoinColumn(name="user_id"), inverseJoinColumns=@JoinColumn(name="role_id"))
	public List<Role> roles = new ArrayList<Role>();

	public static interface Constant {
		public final String LOGIN_USER_ATTR = "login_user";
		public final String LOGIN_ACTIVE_TIME = "30mn";
		public final String THEME = "theme";
	}

	/**
	 * 用户认证
	 * 
	 * @param account
	 * @param password
	 * @return
	 * @throws User.Exception
	 */
	public static User authenticate(final String account, final String password) {
		if (account == null || password == null)
			return null;

		User loginUser = find("byAccount", account).first();
		if (loginUser == null)
			return null;

		if (!account.equals(loginUser.account)|| !password.equals(loginUser.password))
			return null;

		return loginUser;
	}

	public static void createByJson(String models) {
		UserVO userVO = CommonUtil.jsonStr2JavaObj(models, UserVO.class);
		User user = new User(userVO.account, "default", userVO.name, userVO.desc);
		
		user.save();
	}

	public static void deleteByJson(String models) {
		UserVO userVO = CommonUtil.jsonStr2JavaObj(models, UserVO.class);
		User user = User.findById(Long.parseLong(userVO.id));
		if (user == null)
			return ;
		
		user.delete();
	}

	public static void updateByJson(String models) {
		UserVO userVO = CommonUtil.jsonStr2JavaObj(models, UserVO.class);
		User user = User.findById(Long.parseLong(userVO.id));
		if (user == null)
			return ;
		
		user.account = userVO.account;
		user.name = userVO.name;
		user.desc = userVO.desc;
		
		user.save();
	}
	
	public static List<User> findByCondition(String userName, String account, String desc){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		
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
		
		return users;
	}
}
