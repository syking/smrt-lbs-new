package job;

import java.util.Date;

import models.DriverReport;
import models.Log;
import play.jobs.Every;
import play.jobs.Job;
import play.jobs.On;
import utils.CommonUtil;

/**
 * The driver's event timing statistics
 * @author weiwei
 *
 */
@Every("1h")
public class DriverReportJob extends Job{

	public void doJob(){
		try{
			//System.out.println(CommonUtil.getNowTime() + "----------- start DriverRecord Job -------------------");
			DriverReport.doStatistics(new Date());
		}catch(Throwable e){
			new Log("System", "DriverReportJob", e.toString(), null, "-", false).create();
		}
	}
	
}
