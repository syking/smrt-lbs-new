package models;

import play.db.jpa.Model;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/10/12
 * Time: 3:49 PM
 */

@Entity
@Table(name = "t_log")
public class Log extends Model
{
    public String type;
    public String name;
    public String content;
    public String action;
    public String user;
    public Date dateTime;

    public Log(String type, String name, String content, String action, String user, Date dateTime)
    {
        this.type = type;
        this.name = name;
        this.content = content;
        this.action = action;
        this.user = user;
        this.dateTime = dateTime;
    }

    @Override
    public String toString()
    {
        return "Log{" +
                "type='" + type + '\'' +
                ", name='" + name + '\'' +
                ", content='" + content + '\'' +
                ", action='" + action + '\'' +
                ", user='" + user + '\'' +
                ", dateTime=" + dateTime +
                "} " + super.toString();
    }
}
