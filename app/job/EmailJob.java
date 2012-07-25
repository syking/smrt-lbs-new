package job;

import java.util.Date;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import models.Department;
import models.DriverReport;
import models.DriverReport.TIME_TYPE;
import play.jobs.Every;
import play.jobs.Job;
import utils.CommonUtil;

@Every("2h")
public class EmailJob extends Job{

	public void doJob(){
		List<Department> departments = Department.findAll();
		if (departments == null || departments.isEmpty())
			return ;
		Date currentTime = new Date();
		Date three = CommonUtil.parse(CommonUtil.formatTime("yyyy-MM-dd", new Date()) + " 03:00:00");
		// 凌晨3点之前不发邮件
		if (currentTime.before(three)){
			return ;
		}
		
		Date start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(currentTime, -1)) + " 00:00:00");
		Date end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd",CommonUtil.addDate(start, 1)) + " 00:00:00");
		end = CommonUtil.addSecond(end, -1);
		String timeType = TIME_TYPE.DAILY;
		
		List<DriverReport> db_dr = DriverReport.find("startTime = ? and endTime = ? and timeType = ? ", start, end, timeType).fetch();
		if (db_dr == null || db_dr.isEmpty())
			return ;
		
		Date yestoday = CommonUtil.addDate(currentTime, -1);
		
		for (Department d : departments){
			try{
				Department.sendEmail(d.id, DriverReport.TIME_TYPE.DAILY, CommonUtil.formatTime("yyyy/MM/dd", yestoday));
			} catch (Throwable e){
				System.out.println(d.name + " | e->" + e.toString());
				continue;
			}
		}
	}

}
