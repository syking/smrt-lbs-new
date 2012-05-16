package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * 事件类型
 * @author weiwei
 *
 */
@Entity
@Table(name="t_event_type")
public class EventType extends Model {
	
	@Column(unique = true, name = "tech_name")
	public String techName;
	
	@Column(unique = true)
	public String name;
	
	/**
	 * 事件类型数据字典，暂时放在这里
	 * @author weiwei
	 *
	 */
	public static interface Constant{
		String ALARM = "event-alarm";
		String MOTION = "event-motion";
		String VIDEO_LOSS = "event-video-loss";
		String CONNECTION_LOST = "event-connection-lost";
		String CONNECTED = "event-connected";
		String DIGITAL_INPUT = "event-input";
		String DIGITAL_OUTPUT = "event-output";
		String IDLE = "event-idle";
		String SPEEDING = "event-speeding";
		String SUDDEN_ACCELERATION = "event-sudden-acceleration";
		String SUDDEN_BRAKING = "event-sudden-braking";
		String SUDDEN_LEFT = "event-sudden-left";
		String SUDDEN_RIGHT = "event-sudden-right";
		String SUDDEN_UP = "event-sudden-up";
		String SUDDEN_DOWN = "event-sudden-down";
		String ENTERING_GEOFENCE = "event-geofence-enter";
		String EXITING_GEOFENCE = "event-geofence-exit";
		String COUNT = "event-count";
	}

	public EventType(String techName, String name) {
		super();
		this.techName = techName;
		this.name = name;
	}
}
