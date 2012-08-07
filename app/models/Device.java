package models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;
import utils.CommonUtil;

import com.alibaba.fastjson.JSON;

/**
 * 设备,可以被分配到某一辆车上
 * 
 * @author weiwei
 * 
 */
@Entity
@Table(name = "t_device")
public class Device extends Model {

	@Column(unique = true)
	public String name;
	
	public String host;
	
	@Column(name="device_key", unique = true)
	public String key;
	
	public boolean alive;
	
	/* this is a json */
	@Column(name="server_urls", columnDefinition="TEXT")
	public String serverUrls;
	
	@Column(columnDefinition="TEXT")
	public String action;
	
	@Column(columnDefinition="TEXT")
	public String misc;
	
	public String status;

	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		if (CommonUtil.isBlank(key))
			builder.append(CommonUtil.formatStr(msg, "Key"));
		
//		if (CommonUtil.isBlank(host))
//			builder.append(CommonUtil.formatStr(msg, "Host"));
//		
//		if (CommonUtil.isBlank(status))
//			builder.append(CommonUtil.formatStr(msg, "Status"));
		
		if (!CommonUtil.isBlank(status) && !"online".equals(status) && !"offline".equals(status))
			builder.append(String.format("%s is online or offline", "Status"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
	}
	
	public static Device findByName(String deviceName) {
		return find("byName", deviceName).first();
	}
	
	public static Device createByVO(Device vo) {
		if (vo == null)
			throw new RuntimeException("device info required");
		
		vo.validate();
		Device db_device = Device.findByName(vo.name);
		if (db_device != null)
			throw new  RuntimeException("DeviceName duplicate!");
		
		Device db_device2 = Device.findByKey(vo.key);
		if (db_device2 != null)
			throw new  RuntimeException("DeviceKey duplicate!");
		
		vo.create();
		
		return vo;
	}
	
	public static String createByJson(String models) {
		List<Device> vos = CommonUtil.parseArray(models, Device.class);
		if (vos == null)
			return models;
		
		for (Device vo : vos){
			createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		
		return _models;
	}

	private static Device findByKey(String key) {
		return Device.find("byKey", key).first();
	}

	public static void deleteById(Long id) {
		Device device = Device.fetchById(id);
		try {
			device.delete();
		} catch (Throwable e) {
			throw new RuntimeException("Could Not Delete This Device Cause It is Assigned to Vehicles !");
		}
	}
	
	public static boolean deleteByJson(String models) {
		List<Device> vos = JSON.parseArray(models, Device.class);
		if (vos == null)
			return false;
		
		for (Device vo : vos){
			deleteById(vo.id);
		}
		
		return true;
	}

	public static void updateByVO(Device vo) {
		if (vo == null)
			throw new RuntimeException("device info required");
			
		vo.validate();
		
		Device device = Device.fetchById(vo.id);
	
		device.name = vo.name;
		device.key = vo.key;
		device.action = vo.action;
		device.alive = vo.alive;
		device.host = vo.host;
		device.misc = vo.misc;
		device.serverUrls = vo.serverUrls;
		device.status = vo.status;
		
		Device db_device = Device.findByName(device.name);
		if (db_device != null && db_device.id != device.id)
			throw new  RuntimeException("DeviceName duplicate!");
		
		Device db_device2 = Device.findByKey(vo.key);
		if (db_device2 != null && db_device2.id != device.id)
			throw new  RuntimeException("DeviceKey duplicate!");
		
		device.save();
	}
	
	public static boolean updateByJson(String models) {
		List<Device> vos = JSON.parseArray(models, Device.class);
		if (vos == null)
			return false;
		
		for (Device vo : vos){
			updateByVO(vo);
		}
		
		return true;
	}
	
	public static List<Device> findByCondition(int page, int pageSize, String name, String key, String host){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		parseCondition(name, key, host, params, sb);
		List<Device> devices = null;
		
		if (page <= 0 || pageSize <= 0)
			devices = Device.find(sb.toString() + " order by id desc", params.toArray()).fetch() ;
		else
			devices = Device.find(sb.toString() + " order by id desc", params.toArray()).fetch(page, pageSize) ;
		
		return devices;
	}
	
	public static long countByCondition(String name, String key, String host){
		final List<Object> params = new ArrayList<Object>();
		final StringBuilder sb = new StringBuilder();
		parseCondition(name, key, host, params, sb);
		
		return Device.count(sb.toString(), params.toArray());
	}
	
	public static Map search(int page, int pageSize, Device device){
		if (device == null)
			return search(page, pageSize, null, null, null);
		
		return search(page, pageSize, device.name, device.key, device.host);
	}
	
	public static Map search(int page, int pageSize, String name, String key, String host) {
		Map map = new HashMap();
		map.put("total", Device.countByCondition(name, key, host));
		map.put("devices", Device.findByCondition(page, pageSize, name, key, host));
		
		return map;
	}
	
	
	private static void parseCondition(String name, String key, String host,
			final List<Object> params, final StringBuilder sb) {
		
		if (!CommonUtil.isBlank(name)){
			sb.append("name like ?");
			params.add(new StringBuilder("%").append(name).append("%").toString());
		}
		
		if (!CommonUtil.isBlank(key)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("key like ?");
			params.add(new StringBuilder("%").append(key).append("%").toString());
		}
		
		if (!CommonUtil.isBlank(host)){
			if (sb.length() > 0)
				sb.append(" and ");
			
			sb.append("host like ?");
			params.add(new StringBuilder("%").append(host).append("%").toString());
		}
	}
	
	public static Device fetchById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		Device device = Device.findById(id);
		if (device == null)
			throw new RuntimeException("id invalid");
		
		return device;
	}
}
