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

import play.db.jpa.Model;

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
}
