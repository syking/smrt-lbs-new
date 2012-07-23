package vo;

import models.Log;

import java.util.Date;

import utils.CommonUtil;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/10/12
 * Time: 6:35 PM
 */
public class LogVO{
    public LogVO init(Log log) {
        this.id  = log.id;
        this.type = log.type;
        //this.name = log.name;
        this.content = log.content;
        this.action = log.action;
        this.userName = log.userName;
        this.dateTime = CommonUtil.formatTime(log.dateTime);
        this.ip = log.ip;
        this.access = log.isSuccess ? "ok" : "denied";
        return this;

    }

    public long id;
    public String type;
    //public String name;
    public String action;
    public String content;
    public String userName;
    public String ip;
    public String access;
    public String dateTime;
}
