package controllers;

import static models.User.Constant.THEME;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import models.Contact;
import models.Driver;
import models.DriverReport;

import play.Logger;
import play.modules.excel.RenderExcel;
import play.mvc.Controller;
import play.mvc.With;
import utils.CommonUtil;
import vo.EventReportVO;

@With({Interceptor.class, ExcelControllerHelper.class})
public class Excels extends Controller{

    public static void queryData(Long driverId, String timeType, String startTime, String endTime) {
		driverId = driverId == null ? 0 : driverId;
		Map map = Driver.queryReport(driverId, timeType, startTime, endTime);
    	
    	request.format = "xls";
    	renderArgs.put(RenderExcel.RA_FILENAME, "driver_records_"+CommonUtil.formatTime("yyyyMMddHHmmss", new Date())+".xls");
        renderTemplate(renderArgs.get(THEME) + "/Excels/data-records.xls", map);
	}
	
}
