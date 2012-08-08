package job;

import java.lang.reflect.Method;
import java.util.List;

import annotations.Perm;

import play.Play;
import play.jobs.Job;
import play.jobs.OnApplicationStart;
import play.mvc.Controller;
import utils.CommonUtil;

@OnApplicationStart
public class InitPermissionJob extends Job{
	public void doJob(){
		List<Class> controllers = Play.classloader.getAssignableClasses(Controller.class);
		for (Class cls : controllers){
			Method[] methods = cls.getMethods();
			if (methods == null || methods.length == 0)
				continue;
			
			//System.out.println(CommonUtil.getNowTime()+"-->" + cls.getName());
			for (Method m : methods){
//				if (!m.isAnnotationPresent(Perm.class))
//					continue;
				
				final String action = cls.getSimpleName()+"."+m.getName();
				models.Permission.actions.add(action);
				//System.out.println("\t-->" + action);
			}
			
		}
	}
}
