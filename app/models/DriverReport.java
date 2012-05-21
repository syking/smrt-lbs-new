package models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name = "t_driver_report")
public class DriverReport extends Model{
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "event_id")
	public Event event;
	
	@Column(name="report_time")
	public Date time;

	public DriverReport(Event event, Date time) {
		super();
		this.event = event;
		this.time = time;
	}
	
}
