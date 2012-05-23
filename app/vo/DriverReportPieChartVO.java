package vo;

import java.text.ParseException;
import models.Counselling;

public class DriverReportPieChartVO {
	public String type;
	public int value;
	public DriverReportPieChartVO(String type, int value) {
		super();
		this.type = type;
		this.value = value;
	}
}
