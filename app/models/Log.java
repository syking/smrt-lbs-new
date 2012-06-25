package models;

import play.db.jpa.Model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created with IntelliJ IDEA. User: JunXi Date: 5/10/12 Time: 3:49 PM
 */

@Entity
@Table(name = "t_log")
public class Log extends Model {
	public String type;
	public String name;
	public String content;
	public String action;
	public String userName;
	public String ip;
	public Date dateTime;

	public Log(String type, String name, String content, String action, String userName, String ip, Date dateTime) {
		this.type = type;
		this.name = name;
		this.content = content;
		this.action = action;
		this.userName = userName;
		this.ip = ip;
		this.dateTime = dateTime;
	}

	public String toString() {
		return "Log{" + "type='" + type + '\'' + ", name='" + name + '\''
				+ ", content='" + content + '\'' + ", action='" + action + '\''
				+ ", userName='" + userName + '\'' + ", ip='" + ip + '\''
				+ ", dateTime=" + dateTime + '}';
	}
}
