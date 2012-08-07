package models;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;
import utils.CommonUtil;

import com.alibaba.fastjson.JSON;

@Entity
@Table(name = "t_systemconfig")
public class SystemConfig extends Model {
	@Column(unique = true)
	public String name;
	public String value;
	public String displayName;

	public SystemConfig(){}
	
	public SystemConfig(String name, String value, String displayName) {
		super();
		this.name = name;
		this.value = value;
		this.displayName = displayName;
	}

	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can not be empty, ";
		if (CommonUtil.isBlank(value))
			builder.append(CommonUtil.formatStr(msg, "Value"));
		
		if (CommonUtil.isBlank(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		if (CommonUtil.isBlank(displayName))
			builder.append(CommonUtil.formatStr(msg, "DisplayName"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
		
	}
	
	public static void deleteById(Long id) {
		if (id == null)
			throw new RuntimeException("id required");
		
		SystemConfig obj = SystemConfig.findById(id);
		if (obj == null)
			throw new RuntimeException("id invalid");
		
		obj.delete();
	}
	
	public static boolean deleteByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return false;
		
		for (SystemConfig vo : vos){
			deleteById(vo.id);
		}
		
		return true;
	}

	public static void createByVO(SystemConfig vo){
		if (vo == null)
			throw new RuntimeException("SystemConfig info required");
		
		vo.validate();
		
		SystemConfig db_sc = SystemConfig.findByName(vo.name);
		if (db_sc != null)
			throw new RuntimeException("SystemConfigName duplicate!");
			
		vo.create();
	}
	public static String createByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return models;
		
		for (SystemConfig vo : vos){
			createByVO(vo);
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
	}

	private static SystemConfig findByName(String name) {
		return SystemConfig.find("byName", name).first();
	}

	public static void updateByVO(SystemConfig vo){
		if (vo == null)
			throw new RuntimeException("SystemConfig info required");
		if (vo.id == null)
			throw new RuntimeException("id invalid");
		
		SystemConfig obj = SystemConfig.findById(vo.id);
		if (obj == null)
			throw new RuntimeException("SystemConfig not found");
		
		vo.validate();
		
		obj.name = vo.name;
		obj.value = vo.value;
		obj.displayName = vo.displayName;
		
		SystemConfig db_sc = SystemConfig.findByName(vo.name);
		if (db_sc != null && db_sc.id != obj.id)
			throw new RuntimeException("SystemConfigName duplicate!");
		
		obj.save();
	}
	
	public static boolean updateByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return false;
		
		for (SystemConfig vo : vos){
			SystemConfig.updateByVO(vo);
		}
		
		return true;
	}
	
	public static Map search(int page, int pageSize){
		Map map = new HashMap();
		map.put("total", SystemConfig.count());
		List<SystemConfig> scs = null;
		if (page > 0 && pageSize > 0)
			scs = SystemConfig.find("order by id desc").fetch(page, pageSize);
		else 
			scs = SystemConfig.find("order by id desc").fetch();
		
		map.put("systemConfigs", scs);
		
		return map;
	}
}
