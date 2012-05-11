package vo;

import models.Log;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/10/12
 * Time: 6:35 PM
 */
public class LogVO
{
    public LogVO init(Log log) {
        this.id  = log.id;
        this.type = log.type;
        this.name = log.name;
        this.content = log.content;
        this.action = log.action;
        this.userName = log.user.name;
        this.dateTime = log.dateTime;

        return this;

    }

    public long id;
    public String type;
    public String name;
    public String content;
    public String action;
    public String userName;
    public Date dateTime;
}
