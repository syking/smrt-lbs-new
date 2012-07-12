package vo;

public class EventTypeReportVO {

	public String id;
	
	public String eventType;
	
	public long pointOfRule;
	public long times;
	public long totalReduce;
	
	public String percent;
	
	public String reportType;
	public String startTime;
	public String endTime;
	
	public EventTypeReportVO(Long eventTypeId, String eventType, long pointOfRule, long times, String percent, String reportType, String startTime, String endTime) {
		super();
		this.id = String.valueOf(eventTypeId);
		this.eventType = eventType;
		this.pointOfRule = pointOfRule;
		this.times = times;
		this.totalReduce = this.times * this.pointOfRule;
		this.percent = percent;
		this.reportType = reportType;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	
	
	
	
}
 