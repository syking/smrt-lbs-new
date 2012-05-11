package controllers;

import com.google.gson.Gson;
import models.Log;
import play.mvc.Controller;
import play.templates.TemplateLoader;
import utils.CommonUtil;
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

        map.put("grid", grid);
//        String thm = (String) renderArgs.get(THEME);
//        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Logs/grid.html")).render(map));
        renderHtml(TemplateLoader.load(template("default/Logs/grid.html")).render(map));

    }

    public static void destroy(String models){
        System.out.println("-----modles------>" + models);
        LogVO logvo = jsonStr2JavaObj(models);
        System.out.println(logvo.id + "===============");
        Log lg = Log.findById(logvo.id);
        System.out.print("=============" + lg);

        lg.delete();

        renderJSON(models);
    }

    public static void update(String models){
        System.out.println("-----modles------>" + models);

        renderJSON(models);
    }

    public static void add(String models){
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
//        json = "{\"id\":1,\"type\":\"info\",\"name\":\"delete\",\"content\":\"number:13586\",\"action\":\"drivers/delete\",\"userName\":\"weiwei\",\"dateTime\":\"2010-04-30T16:00:00.000Z\"}]";
//        json = "{\"id\":1,\"type\":\"info\",\"name\":\"delete\",\"content\":\"number:13586\",\"action\":\"drivers/delete\",\"user\":1,\"dateTime\":\"2010-04-30T16:00:00.000Z\"}]";
        System.out.println("json:" + json + "==============");
        Gson gson = new Gson();
        return gson.fromJson(json, LogVO.class);
    }


}
