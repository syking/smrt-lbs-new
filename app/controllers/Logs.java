package controllers;

import com.google.gson.Gson;
import models.Log;
import models.User;
import org.apache.commons.lang.StringUtils;
import play.mvc.Controller;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.Grid;
import vo.LogVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/10/12
 * Time: 5:17 PM
 */
public class Logs extends Controller
{
    public static void grid(String id)
    {
        final String preUrl = "/Logs/";
        Map map = new HashMap();
        Grid grid = new Grid();
        grid.tabId = id; //logs
        grid.createUrl = preUrl + "add";
        grid.updateUrl = preUrl + "update";
        grid.destroyUrl = preUrl + "destroy";
        grid.readUrl = preUrl + "read";
        grid.editable = "popup";
        grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(LogVO.class, "id"));


        //device combobox
        List<User> userList = User.findAll();
        List<ComboVO> users = new ArrayList<ComboVO>();
        if (userList != null) for (User user : userList)
        {
            users.add(new ComboVO(user.name, user.id));
        }
        map.put("users", CommonUtil.getGson().toJson(users));

        map.put("grid", grid);
//        String thm = (String) renderArgs.get(THEME);
//        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Logs/grid.html")).render(map));
        renderHtml(TemplateLoader.load(template("default/Logs/grid.html")).render(map));

    }

    public static void destroy(String models)
    {
        System.out.println("-----modles------>" + models);
        LogVO logvo = jsonStr2JavaObj(models);
        System.out.println(logvo.id + "===============");
        Log lg = Log.findById(logvo.id);
        System.out.print("=============" + lg);

        lg.delete();

        renderJSON(models);
    }

    public static void update(String models)
    {
        System.out.println("-----modles------>" + models);

        renderJSON(models);
    }

    public static void add(String models)
    {
        System.out.println("-----modles------>" + models);

        renderJSON(models);
    }

    public static void read()
    {
        List<LogVO> result = new ArrayList<LogVO>();

        List<Log> logList = Log.findAll();
        for (Log log : logList)
        {
            LogVO lv = new LogVO().init(log);
            result.add(lv);
        }

        renderJSON(result);
    }

    private static LogVO jsonStr2JavaObj(String jsonStr)
    {
        String json = jsonStr.substring(1, jsonStr.length() - 1);
        System.out.println("json:" + json + "==============");
        Gson gson = new Gson();
        return gson.fromJson(json, LogVO.class);
    }

    //    public static void search(String type, String name, String content, String date, String time, String action, long userid) {
    public static void search(String type, String name, String content, String action, long userid)
    {

        System.out.println("=============" + type + name + content + action + userid + "=============");
        List<String> criteria = new ArrayList<String>(9);
        List<Object> params = new ArrayList<Object>(9);

        if (null != type && !type.isEmpty())
        {
            criteria.add("type LIKE ?");
            params.add("%" + type + "%");
        }

        if (null != name && !name.isEmpty())
        {
            criteria.add("name LIKE ?");
            params.add("%" + name + "%");
        }

        if (null != content && !content.isEmpty())
        {
            criteria.add("content LIKE ?");
            params.add("%" + content + "%");
        }

        if (null != action && !action.isEmpty())
        {
            criteria.add("action LIKE ?");
            params.add("%" + action + "%");
        }

        if (userid != 0)
        {
            User user = User.findById(userid);
            long user_id = user.id;
            criteria.add("user_id = ?");
            params.add(user_id);
        }

        //date and time


        List<Log> logList = filter(criteria, params);
        System.out.println("============" + logList.size() + "============");


        List<LogVO> logVOList = new ArrayList<LogVO>();
        for (Log log : logList)
        {
            logVOList.add(new LogVO().init(log));
        }
        renderJSON(logVOList);

    }

    private static List<Log> filter(List<String> criteria, List<Object> params)
    {
        Object[] p = params.toArray();
        String query = StringUtils.join(criteria, " AND ");
        List<Log> vehicles = Log.find(query, p).fetch();
        return vehicles;
    }

}
