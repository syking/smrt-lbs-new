package models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * 事件信息，包括超速、突然加速等等。
 * 事件发生时的GPS数据也会保存在 eventRecord 实体中。
 * GPSData只是一个定时任务的数据发送。不一定跟事件同步。
 * 也许事件已经发生了，但是GPSData还没到点发送数据。
 * 因此Event自己也会包含一些GPS位置信息，例如经纬度。
 * @author weiwei
 *
 */
@Entity
@Table(name="t_event")
public class Event extends Model{
	
	/* 设备发送的事件信息 */
	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name = "event_record_id")
	public EventRecord eventRecord;
	
	/* 事件发生时是哪位司机开的车，需要根据设备找到相应的车辆，再找到当时相应的调度安排才能得到司机信息 */
	@ManyToOne(fetch = FetchType.EAGER)
	public Driver driver;
	
	/* 时间发生时是哪条路线，需要根据设备找到相应的车辆，再找到当时相应的调度安排才能得到路线信息 */
	@Column(name = "service_number")
	public String serviceNumber = "";
	
	/* 是否在高速公路，需要分析事件记录数据中的经纬度 */
	@Column(name="is_high_way")
	public boolean isHighWay;
	
	/* 是否在公交车站附近 ，需要分析事件记录数据中的经纬度*/
	@Column(name="is_near_bus_stop")
	public boolean isNearBusStop;
	
	/* 道路 */
	public String road;//需要根据经纬度计算得出地址位置

	@Override
	public String toString() {
		return "Event [eventRecord=" + eventRecord + ", driver=" + driver
				+ ", serviceNumber=" + serviceNumber + ", isHighWay="
				+ isHighWay + ", isNearBusStop=" + isNearBusStop + ", road="
				+ road + ", id=" + id + "]";
	}
	
	
}
