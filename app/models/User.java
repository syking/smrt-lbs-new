package models;

import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="t_user")
public class User extends Model{

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

	/**
	 * 登录
	 * @param account
	 * @param password
	 * @return
	 * @throws User.Exception
	 */
	public static User login(final String account, final String password) {
		if (account == null || password == null)
			return null;
		
		User loginUser = find("byAccount", account).first();
		if (loginUser == null)
			return null;
		
		if (!account.equals(loginUser.account) || !password.equals(loginUser.password))
			return null;
		
		return loginUser;
	}
	
	public final static class Exception extends RuntimeException{
		public Exception(String message){
			super(message);
		}
	}
	
	public static interface Constant{
		String LOGIN_USER_ATTR = "login_user";
		String LOGIN_ACTIVE_TIME = "30mn";
		String THEME = "theme";
	}
	
	public static enum Message{
		
		LOGIN_FAIL, LOGIN_SUCCESS ;
	}
	
	
	public final static Map<Enum, String> message ;
	
	static{
		message = new HashMap<Enum,String>();
		message.put(Message.LOGIN_FAIL, "登录失败, 账号或密码错误");
		message.put(Message.LOGIN_SUCCESS, "登录成功");
	}
}
