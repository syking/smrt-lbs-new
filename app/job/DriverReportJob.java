package job;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import controllers.Counsellings;

import models.DriverReport;
import models.Event;

import play.jobs.Every;
import play.jobs.Job;

@Every("5s")
public class DriverReportJob extends Job {

	@Override
	public void doJob() throws Exception {
		List<Long> eventIds = Event.find("select id from Event").fetch();
		List<Long> reportIds = DriverReport.find("select event.id from DriverReport").fetch();
		if (eventIds.size() == reportIds.size())
			return;

		for (int i = 0; i < eventIds.size(); i++) {
			if (reportIds.contains(eventIds.get(i)))
				continue;

			saveDriverReport(eventIds.get(i));
		}
	}

	public void saveDriverReport(long id) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate = df.format(new Date());
		
		Date date = Counsellings.dateConvertor(currentDate);
		
		Event event = Event.find("id = ?", id).first();
		
		new DriverReport(event, date).save();
	}
}
