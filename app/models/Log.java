package models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * Created with IntelliJ IDEA. User: JunXi Date: 5/10/12 Time: 3:49 PM
 */

@Entity
@Table(name = "t_log")
public class Log extends Model {
	public String type = "normal";// normal
	public String name = "system";// ?
	@Column(columnDefinition="longtext")
	public String content;// contains whole HTTP Request content-body
	public String action;// what ? permission name
	public String userAccount;// who ?
	public String userName;// who ?
	public String ip;// where ?
	public Date dateTime;// when ?
	public boolean isSuccess;// the result of this action

	public Log(String type, String action, String content, User user, String ip, boolean isSuccess){
		this.type = type == null ? "normal" : type;
		this.dateTime = new Date();
		this.content = content;
		this.action = action;
		this.userName = user == null ? "-" : user.name;
		this.userAccount = user == null ? "-" : user.account;
		this.ip = ip;
		this.isSuccess = isSuccess;
	}

	public static List<Log> findAllOrderByIdDesc(){
		return Log.findAllOrderBy("id", "desc");
	}
	
	public static List<Log> findAllOrderBy(String field, String order) {
		return Log.find(String.format("order by %s %s", field, order)).fetch();
	}

}
