package notifiers;

import java.util.List;
import java.util.Map;

import models.Department;
import models.Driver;
import models.DriverReport;
import models.Log;
import play.Play;
import play.mvc.Mailer;
import vo.DriverPerformanceVO;
import vo.EventReportVO;

public class MyMailer extends Mailer {

	public static void driverReport(Driver driver, String timeType, String time) {
		if (!DriverReport.isValidTimeType(timeType) || time == null || time.isEmpty())
			throw new RuntimeException("timeType or time is invalid!");
		
		if (driver.email == null)
			driver.email = "493781187@qq.com";
		
		setContentType("text/html");
		addRecipient(driver.email);
		setFrom(Play.configuration.get("mail.smtp.user"));
		Map report = driver.generatePerformanceReport(timeType, time);
		DriverPerformanceVO per = (DriverPerformanceVO) report.get("performance");
		
		setSubject("%s %s, %s report of %s", timeType, per.start,per.end, driver.name);
		
		sendAndWait(report);
	}
	
	public static void leaderMail(String dept,Map report, String timeType, Driver leader) {
		setContentType("text/html");
		addRecipient(leader.email);
		setFrom(Play.configuration.get("mail.smtp.user"));
			
		List<EventReportVO> ers = (List<EventReportVO>) report.get("data");
		if (ers == null || ers.isEmpty())
			return ;
		
		EventReportVO er = ers.get(0);
		
		setSubject("%s %s, %s report of %s Department", timeType, er.startTime,er.endTime, dept);
		
		sendAndWait(report);
		
		new Log("email", "driver report", "send email to "+leader.name, null, "-", true).create();
	}

}