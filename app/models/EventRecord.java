package models;

import play.*;
import play.db.jpa.*;

import javax.persistence.*;

import org.hibernate.annotations.ForeignKey;

import java.util.*;

/**
 * 车辆设备事件记录，存储着设备发出的原始数据
 * @author weiwei
 *
 */
@Entity
@Table(name = "t_event_record")
public class EventRecord extends Model {
	/* 事件数据是由哪台设备发出的 */
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "device_key", referencedColumnName = "device_key")
	public Device device;
	
	/* 事件类型 */
	@ManyToOne
	@JoinColumn(name = "event_type_tech_name", referencedColumnName="tech_name")//指定引用EventType的tech_name作为外键
	public EventType type;
	
	/* 纬度 */
	@Column(name="latitude")
	public String lat;
	
	/* 经度 */
	@Column(name="longitude")
	public String lng;
	
	/* 事件发生时间 */
	@Column(name="event_time")
	public Date time;
	
	/* 速度，单位 km/h */
	public int speed;
	
	/* 持续时间， 单位 s */
	public int duration;
	
	public String detail;
	
	/* 当前发生事件时的重力加速度 */
	@Column(name="g_value")
	public String gValue;
	
	/* 处理进度，是一个状态量 */
	@Column(name="event_status", length = 1)
	public short status;// 0(待处理), 1(处理中), 2(处理成功), 3(处理失败)

	@Override
	public String toString() {
		return "EventRecord [device=" + device.key + ", type=" + type + ", lat="
				+ lat + ", lng=" + lng + ", time=" + time + ", speed=" + speed
				+ ", duration=" + duration + ", detail=" + detail + ", gValue="
				+ gValue + ", status=" + status + ", id=" + id + "]";
	}
}
