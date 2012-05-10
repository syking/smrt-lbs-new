package controllers;

import models.Log;
import play.mvc.Controller;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.Grid;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

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
        grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(Log.class, "id"));

        map.put("grid", grid);
        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Logs/grid.html")).render(map));
    }

    public static void destroy(String models){
        System.out.println("-----modles------>" + models);

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

    public static void read() {
        List<Log> logList = Log.findAll();
        renderJSON(logList);

    }


}
