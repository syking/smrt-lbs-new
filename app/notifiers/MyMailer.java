package notifiers;

import java.util.Map;

import models.Driver;
import models.DriverReport;
import models.User;

import org.apache.commons.mail.EmailAttachment;

import play.Play;
import play.mvc.Mailer;
import sun.misc.PerformanceLogger;
import vo.DriverPerformanceVO;

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

}