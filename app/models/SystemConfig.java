package models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;

import play.db.jpa.Model;
import utils.CommonUtil;
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

	public void validate(){
		final StringBuilder builder = new StringBuilder();
		final String msg = "%s Can't be empty, ";
		if (CommonUtil.isEmptyString(value))
			builder.append(CommonUtil.formatStr(msg, "Value"));
		
		if (CommonUtil.isEmptyString(name))
			builder.append(CommonUtil.formatStr(msg, "Name"));
		
		if (CommonUtil.isEmptyString(displayName))
			builder.append(CommonUtil.formatStr(msg, "DisplayName"));
		
		final String result = builder.toString();
		if (result.trim().length() > 0)
			throw new RuntimeException(result);
		
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

	public static String createByJson(String models) {
		List<SystemConfig> vos = JSON.parseArray(models, SystemConfig.class);
		if (vos == null)
			return models;
		
		for (SystemConfig vo : vos){
			vo.validate();
			vo.create();
		}
		
		final String _models = CommonUtil.toJson(vos);
		return _models;
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
			
			vo.validate();
			
			obj.name = vo.name;
			obj.value = vo.value;
			obj.displayName = vo.displayName;
			obj.save();
		}
		
		return true;
	}
}
