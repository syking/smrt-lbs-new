package vo;

public class EventTypeReportVO {

	public String id;
	
	public String eventType;
	
	public String reportType;
	public String start;
	public String end;
	
	public long pointOfRule;
	public long times;
	public long totalReduce;
	
	public String percent;
	
	public EventTypeReportVO(Long eventTypeId, String eventType, long pointOfRule, long times, String percent, String reportType, String start, String end) {
		super();
		this.id = String.valueOf(eventTypeId);
		this.eventType = eventType;
		this.pointOfRule = -pointOfRule;
		this.times = times;
		this.totalReduce = this.times * this.pointOfRule;
		this.percent = percent;
		this.reportType = reportType;
		this.start = start;
		this.end = end;
	}
	
	
	
	
}
 