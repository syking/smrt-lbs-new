package controllers;

import static models.User.Constant.THEME;
import java.util.List;
import javax.persistence.Table;
import models.SystemConfig;
import play.mvc.Controller;
import play.mvc.With;

@With(Interceptor.class)
public class SystemConfigs extends Controller{
	public static void show(){
		List<SystemConfig> sysConfigs = SystemConfig.findAll();
		renderTemplate(renderArgs.get(THEME)+"/Application/system_config.html", sysConfigs);
	}
}
