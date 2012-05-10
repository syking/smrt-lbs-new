package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.Device;
import models.Driver;
import models.Event;
import models.Fleet;
import models.Schedule;
import models.Vehicle;

import com.google.gson.Gson;

import play.mvc.*;
import play.templates.TemplateLoader;
import services.FleetService;
import utils.CommonUtil;
import vo.ComboVO;
import vo.EventVO;
import vo.FleetVO;
import vo.Grid;
import vo.VehiclesVO;

@With(Interceptor.class)
public class Fleets extends Controller {

    public static void index() {
        render();
    }
    
    public static void tree(){
    	renderJSON(FleetService.assemFleetTree());
    }
    
    public static void update(String models) {
    	if (models == null)
    		return ;
    	
    	FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
    	Long id = fleetVO.id;
    	Fleet fleet = Fleet.findById(id);
    	
    	fleet.name = fleetVO.name;
    	fleet.description = fleetVO.description;
    	fleet.placeNumber = fleetVO.placeNumber;
    	fleet.save();
    }

    public static void read(){
        List<FleetVO> result = new ArrayList<FleetVO>();

        List<Fleet> fleetList = Fleet.find("order by id desc").fetch();
        for (Fleet fleet : fleetList)
            result.add(new FleetVO().init(fleet));
        
        renderJSON(result);
    }

    public static void destroy(String models){
    	FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
    	
    	Long id = fleetVO.id;
    	Fleet fleet = Fleet.findById(id);
    	fleet.delete();
    }

    public static void add(String models){
    	FleetVO fleetVO = CommonUtil.getGson().fromJson(models.substring(1, models.length() - 1), FleetVO.class);
    	
    	Fleet fleet = new Fleet();
    	
    	fleet.name = fleetVO.name;
    	fleet.description = fleetVO.description;
    	fleet.placeNumber = fleetVO.placeNumber;
    	fleet.save();
    }
    
    public static void grid(String id)
    {
        final String preUrl = "/Fleets/";
        Map map = new HashMap();
        Grid grid = new Grid();
        grid.tabId = id; //vehicles
        grid.createUrl = preUrl + "add";
        grid.updateUrl = preUrl + "update";
        grid.destroyUrl = preUrl + "destroy";
        grid.readUrl = preUrl + "read";
        grid.editable = "inline";
        grid.columnsJson = CommonUtil.getGson().toJson(CommonUtil.assemColumns(FleetVO.class, "id"));

        List<String> pnList = Fleet.find("select DISTINCT f.placeNumber from Fleet f ").fetch();
    	List<ComboVO> placeNumbers = new ArrayList<ComboVO>();
    	if (pnList != null)
    		for (String s : pnList){
    			placeNumbers.add(new ComboVO(s, s));
    		}
    	
        map.put("placeNumbers", CommonUtil.getGson().toJson(placeNumbers));
        
        List<String> nList = Fleet.find("select DISTINCT f.name from Fleet f ").fetch();
    	List<ComboVO> names = new ArrayList<ComboVO>();
    	if (nList != null)
    		for (String s : nList){
    			names.add(new ComboVO(s, s));
    		}
    	
    	map.put("names", CommonUtil.getGson().toJson(names));
        
        map.put("grid", grid);
        
        renderHtml(TemplateLoader.load(template(renderArgs.get(THEME) + "/Fleets/grid.html")).render(map));
    }
    
    public static void search(String placeNumber, String name){
    	
    	// 判断传过来的条件参数，如果参数属于没有填写的，则不参与 and 条件。
    	StringBuilder sqlSB = new StringBuilder();
    	List<Object> params = new ArrayList<Object>();
    	if (placeNumber != null && placeNumber.trim().length() > 0){
    		sqlSB.append("placeNumber like ?");
    		params.add("%"+placeNumber+"%");
    	}
    	
    	if (name != null && name.trim().length() > 0){
    		if (sqlSB.length() > 0)
    			sqlSB.append(" and ");
    		sqlSB.append("name like ?");
    		params.add("%"+name+"%");
    	}
    	
    	List<Fleet> fleets = Fleet.find(sqlSB.toString(), params.toArray()).fetch();
    	if (fleets == null)
        	renderJSON("");
        
        List<FleetVO> fleetVOList = new ArrayList<FleetVO>();
        
        for (Fleet f : fleets){
        	fleetVOList.add(new FleetVO().init(f));
        }
        
        renderJSON(fleetVOList);
    }

}
