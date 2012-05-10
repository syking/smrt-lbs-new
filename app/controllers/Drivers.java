package controllers;

import com.google.gson.Gson;
import models.Driver;
import models.User;
import org.apache.commons.lang.StringUtils;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import utils.CommonUtil;
import vo.ComboVO;
import vo.DriverVO;
import vo.Grid;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.THEME;

@With(Interceptor.class)
public class Drivers extends Controller
{
//    PropertyConfigurator.configure("../../conf/log4j.properties");
//    private static Log log = LogFactory.getLog(Driver.class);

    public static void search(String number, String name)
    {
        List<String> criteria = new ArrayList<String>(9);
        List<Object> params = new ArrayList<Object>(9);

        if (null != number && !number.isEmpty())
        {
            criteria.add("number LIKE ?");
            params.add("%" + number + "%");
        }

        if (null != name && !name.isEmpty())
        {
            criteria.add("name LIKE ?");
            params.add("%" + name + "%");
        }

        List<Driver> driverList = filter(criteria, params);

        List<DriverVO> driverVOList = new ArrayList<DriverVO>();
        for (Driver driver : driverList)
        {
            driverVOList.add(new DriverVO().init(driver));
        }

        renderJSON(driverVOList);
    }

    private static List<Driver> filter(List<String> criteria, List<Object> params)
    {
        Object[] p = params.toArray();
        String query = StringUtils.join(criteria, " AND ");
        return Driver.find(query, p).fetch();
    }

    public static void listJson()
    {
        List<Driver> drivers = Driver.findAll();
        if (drivers == null) renderJSON("");

        List<DriverVO> driverVOList = new ArrayList<DriverVO>();

        for (Driver d : drivers)
        {
            driverVOList.add(new DriverVO().init(d));
        }

        Map data = CommonUtil.assemGridData(driverVOList, "id");

        renderJSON(data);
    }

    public static void add(String models)
    {
//        log.info("drivers/add");
        System.out.println("-----models------>" + models);
        Driver driver = jsonStr2JavaObj(models);
        Driver d = new Driver(driver.number, driver.name, driver.description).save();
        renderJSON(models);
    }

    public static void destroy(String models)
    {
        System.out.println("-----modles------>" + models);
        Driver driver = jsonStr2JavaObj(models);
        Driver d = Driver.findById(driver.id);
        try
        {
            d.delete();
        } catch (Exception e)
        {
            renderJSON("[]");
        }
        renderJSON(models);
    }

    public static void update(String models)
    {
        System.out.println("-----modles------>" + models);
        Driver driver = jsonStr2JavaObj(models);
        Driver d = Driver.findById(driver.id);
        d.name = driver.name;
        d.description = driver.description;
        d.save();
        renderJSON(models);
    }

    public static void read()
    {
        List<Driver> driverList = Driver.findAll();
        renderJSON(driverList);
    }


    public static void grid(String id)
    {
        final String preUrl = "/Drivers/";
        Map map = new HashMap();
        Grid grid = new Grid();
        grid.tabId = id; //drivers
        grid.createUrl = preUrl + "add";
        grid.updateUrl = preUrl + "update";
        grid.destroyUrl = preUrl + "destroy";
        grid.readUrl = preUrl + "read";
        grid.editable = "popup";
        grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(DriverVO.class, "id"));

        List<User> userList = User.findAll();
        List<ComboVO> users = new ArrayList<ComboVO>();
        if (userList != null) for (User user : userList)
        {
            users.add(new ComboVO(user.name, user.id));
        }
        map.put("users", CommonUtil.getGson().toJson(users));
        map.put("grid", grid);
        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Drivers/grid.html")).render(map));
    }

    private static Driver jsonStr2JavaObj(String jsonStr)
    {
        String json = jsonStr.substring(1, jsonStr.length() - 1);
        Gson gson = new Gson();
        return gson.fromJson(json, Driver.class);
    }
}
