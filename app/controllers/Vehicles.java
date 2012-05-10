package controllers;

import com.google.gson.Gson;
import models.*;
import org.apache.commons.lang.StringUtils;
import play.cache.Cache;
import play.mvc.Controller;
import play.mvc.With;
import play.templates.TemplateLoader;
import services.VehicleService;
import utils.CommonUtil;
import vo.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static models.User.Constant.LOGIN_USER_ATTR;
import static models.User.Constant.THEME;

/**
 * vehicle领域相关的控制器
 *
 * @author weiwei
 */
@With(Interceptor.class)
public class Vehicles extends Controller
{

    /**
     * 统计给定车队的车辆的事件统计信息
     *
     * @param fleets 车队 ID 形如："1,2,3..."
     */
    public static void events(String fleets)
    {

        long[] fleetsLong = CommonUtil.splitToLong(fleets, ",");

        List<Vehicle> vehicles = VehicleService.filterByFleet(fleetsLong);
        if (vehicles == null) renderJSON("");

        List<VehicleEvent> events = new ArrayList<VehicleEvent>(vehicles.size());
        for (Vehicle v : vehicles)
        {
            //======= 统计事件数据 ======
            List<EventRecord> eventRecords = EventRecord.find("device_key = ?", v.device.key).fetch();
            if (eventRecords == null) continue;

            VehicleEvent event = new VehicleEvent();
            event.vehicleNo = v.number;
            event.device = v.device.name;
            event.status = v.device.status;
            event.id = v.id;

            for (EventRecord er : eventRecords)
            {
                if (EventType.Constant.SUDDEN_ACCELERATION.equals(er.type.techName))
                {
                    event.suddenAcceleration = EventRecord.count("event_type_tech_name = ? and device_key = ?", er.type.techName, v.device.key);
                    continue;
                }

                if (EventType.Constant.SUDDEN_BRAKING.equals(er.type.techName))
                {
                    event.suddenBrake = EventRecord.count("event_type_tech_name = ? and device_key = ?", er.type.techName, v.device.key);
                    continue;
                }

                if (EventType.Constant.SPEEDING.equals(er.type.techName))
                {
                    event.speedingTime = EventRecord.count("event_type_tech_name = ? and device_key = ?", er.type.techName, v.device.key);
                    continue;
                }

                if (EventType.Constant.SUDDEN_LEFT.equals(er.type.techName))
                {
                    event.suddenLeftTurn = EventRecord.count("event_type_tech_name = ? and device_key = ?", er.type.techName, v.device.key);
                    continue;
                }

                if (EventType.Constant.SUDDEN_RIGHT.equals(er.type.techName))
                {
                    event.suddenRightTurn = EventRecord.count("event_type_tech_name = ? and device_key = ?", er.type.techName, v.device.key);
                    continue;
                }

                if (EventType.Constant.IDLE.equals(er.type.techName))
                {
                    event.idling = EventRecord.count("event_type_tech_name = ? and device_key = ?", er.type.techName, v.device.key);
                    continue;
                }
            }

            events.add(event);
        }

        Map data = CommonUtil.assemGridData(events, "id");

        renderJSON(data);
    }

    /**
     * 获取给定车队的车辆的GPS实时信息
     *
     * @param fleets 形如 "1,2,3"
     */
    public static void gps(String fleets)
    {
        long[] fleetsLong = CommonUtil.splitToLong(fleets, ",");
        List<Vehicle> vehicles = VehicleService.filterByFleet(fleetsLong);

        List<VehicleGPS> vehicleGps = VehicleService.findGPS(vehicles);

        renderJSON(vehicleGps);
    }

    public static void list()
    {
        Object user = Cache.get(LOGIN_USER_ATTR);
//        String fleetJson = new Gson().toJson(FleetService.assemFleetTree());
        String vehicleJson = new Gson().toJson(VehicleService.assemVehicleTree());
        List<Vehicle> vehicleList = Vehicle.all().fetch();
        List<Fleet> fleetList = Fleet.findAll();
        List<Device> deviceList = Device.findAll();
        renderTemplate(renderArgs.get(THEME) + "/Vehicles/list.html", vehicleList, user, vehicleJson, fleetList, deviceList);
    }

    public static void listJson()
    {
        List<Vehicle> vehicleList = Vehicle.all().fetch();

        // 指定类的字段显示
        Map<Class<?>, String> pojos = new HashMap<Class<?>, String>();
        pojos.put(Fleet.class, "fleet.name");
        pojos.put(Device.class, "device.name");

        Map data = CommonUtil.assemGridData(vehicleList, pojos, "DIRECTIONS");

        // 告诉Gson，跳过 fleet, parent 字段的序列化，因为这些会导致循环引用异常
        Gson gson = CommonUtil.getGson("vehicles", "parent");

        renderText(gson.toJson(data));
    }

    public static void search(String number, String license, long fleetid, long deviceid, String description, String cctvIp, String type)
    {

        List<String> criteria = new ArrayList<String>(9);
        List<Object> params = new ArrayList<Object>(9);

        if (null != number && !number.isEmpty())
        {
            criteria.add("number LIKE ?");
            params.add("%" + number + "%");
        }

        if (null != license && !license.isEmpty())
        {
            criteria.add("license LIKE ?");
            params.add("%" + license + "%");
        }

        if (fleetid != 0)
        {
            Fleet fleet = Fleet.findById(fleetid);
            long fleet_id = fleet.id;
            criteria.add("fleet_id = ?");
            params.add(fleet_id);
        }

        if (deviceid != 0)
        {
            Device device = Device.findById(deviceid);
            long device_id = device.id;
            criteria.add("device_id = ?");
            params.add(device_id);
        }

        if (null != description && !description.isEmpty())
        {
            criteria.add("description LIKE ?");
            params.add("%" + description + "%");
        }

        if (null != type && !type.isEmpty())
        {
            criteria.add("type LIKE ?");
            params.add("%" + type + "%");
        }

        if (null != cctvIp && !cctvIp.isEmpty())
        {
            criteria.add("cctvIp LIKE ?");
            params.add("%" + cctvIp + "%");
        }

        List<Vehicle> vehicleList = filter(criteria, params);

        List<VehiclesVO> vehiclesVOList = new ArrayList<VehiclesVO>();
        for (Vehicle vehicle : vehicleList){
            vehiclesVOList.add(new VehiclesVO().init(vehicle));
        }
        renderJSON(vehiclesVOList);

    }

    private static List<Vehicle> filter(List<String> criteria, List<Object> params)
    {
        Object[] p = params.toArray();
        String query = StringUtils.join(criteria, " AND ");
        List<Vehicle> vehicles = Vehicle.find(query, p).fetch();
        return vehicles;
    }

    public static void update(String models)
    {
        System.out.println("-----modles------>" + models);
        Vehicle vehicle = jsonStr2JavaObj(models);
        Vehicle v = Vehicle.findById(vehicle.id);
        v.number = vehicle.number;
        v.license = vehicle.license;
        v.cctvIp = vehicle.cctvIp;
        v.description = vehicle.description;
        v.type = vehicle.type;
        v.save();
        renderJSON(models);
    }

    public static void read()
    {
        List<VehiclesVO> result = new ArrayList<VehiclesVO>();

        List<Vehicle> vehicleList = Vehicle.findAll();
        System.out.println(vehicleList.size() + "======================");
        for (Vehicle vehicle : vehicleList)
        {
            VehiclesVO vehicleVO = new VehiclesVO().init(vehicle);
            result.add(vehicleVO);
        }
        renderJSON(result);
    }

    public static void destroy(String models)
    {
        System.out.println("-----modles------>" + models);
        Vehicle vehicle = jsonStr2JavaObj(models);
        Vehicle v = Vehicle.findById(vehicle.id);
        try
        {
            v.delete();
        } catch (Exception e)
        {
            renderJSON("[]");
        }
        renderJSON(models);
    }



    public static void add(String models)
    {
        System.out.println("-----models------>" + models);
        Vehicle vehicle = jsonStr2JavaObj(models);
        Vehicle v = new Vehicle(vehicle.number, vehicle.license, vehicle.description, vehicle.cctvIp, vehicle.type).save();
        System.out.println(v);
        renderJSON(models);
    }

    public static void grid(String id)
    {
        final String preUrl = "/Vehicles/";
        Map map = new HashMap();
        Grid grid = new Grid();
        grid.tabId = id; //vehicles
        grid.createUrl = preUrl + "add";
        grid.updateUrl = preUrl + "update";
        grid.destroyUrl = preUrl + "destroy";
        grid.readUrl = preUrl + "read";
        grid.searchUrl = preUrl + "search";
        grid.editable = "popup";
        grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(VehiclesVO.class, "id"));

        List<Fleet> fleetList = Fleet.findAll();
        List<ComboVO> fleets = new ArrayList<ComboVO>();
        if (fleetList != null)
            for (Fleet fleet: fleetList){
                fleets.add(new ComboVO(fleet.name, fleet.id));
            }
        map.put("fleets", CommonUtil.getGson().toJson(fleets));


        //device combobox
        List<Device> deviceList = Device.findAll();
        List<ComboVO> devices = new ArrayList<ComboVO>();
        if (deviceList != null)
            for (Device device: deviceList){
                devices.add(new ComboVO(device.name, device.id));
            }
        map.put("devices", CommonUtil.getGson().toJson(devices));

        map.put("grid", grid);
        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Vehicles/grid.html")).render(map));
    }

    private static Vehicle jsonStr2JavaObj(String jsonStr)
    {
        String json = jsonStr.substring(1, jsonStr.length() - 1);
        Gson gson = new Gson();
        return gson.fromJson(json, Vehicle.class);
    }

    public static void tree() {
        Map map = new HashMap();

        List<Fleet> fleetList = Fleet.findAll();
        List<ComboVO> fleets = new ArrayList<ComboVO>();
        if (fleetList != null)
            for (Fleet fleet: fleetList){
                fleets.add(new ComboVO(fleet.name, fleet.id));
            }
        map.put("fleets", CommonUtil.getGson().toJson(fleets));

        String vehicleJson = new Gson().toJson(VehicleService.assemVehicleTree());
        map.put("treeData", vehicleJson);
        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Vehicles/tree.html")).render(map));
    }

    public static void searchTree(long fleetid, String number) {
        Map map = new HashMap();

        List<Fleet> fleetList = Fleet.findAll();
        List<ComboVO> fleets = new ArrayList<ComboVO>();
        if (fleetList != null)
            for (Fleet fleet: fleetList){
                fleets.add(new ComboVO(fleet.name, fleet.id));
            }
        map.put("fleets", CommonUtil.getGson().toJson(fleets));

        String vehicleJson = new Gson().toJson(VehicleService.assemVehicleTreeByFleetidnNumber(fleetid, number));
        System.out.print(vehicleJson + "========================");
        renderJSON(vehicleJson);
    }





}
