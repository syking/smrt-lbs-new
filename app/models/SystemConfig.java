package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import vo.DriverVO;

@Entity
@Table(name = "t_systemconfig")
public class SystemConfig extends Model {
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

	public static boolean deleteByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return false;
		
		for (SystemConfig vo : vos){
			if (vo.id == null)
				continue;
			
			SystemConfig obj = SystemConfig.findById(vo.id);
			if (obj == null)
				continue;
			
			obj.delete();
		}
		
		return true;
	}

	public static boolean createByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return false;
		
		for (SystemConfig vo : vos){
			vo.create();
		}
		
		return true;
	}

	public static boolean updateByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return false;
		
		for (SystemConfig vo : vos){
			if (vo.id == null)
				continue;
			
			SystemConfig obj = SystemConfig.findById(vo.id);
			if (obj == null)
				continue;
			
			obj.name = vo.name;
			obj.value = vo.value;
			obj.displayName = vo.displayName;
			obj.save();
		}
		
		return true;
	}
}
