package models;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
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

	public String description;

	@Override
	public String toString() {
		return "User [account=" + account + ", password=" + password
				+ ", name=" + name + ", description=" + description + "]";
	}
	
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
