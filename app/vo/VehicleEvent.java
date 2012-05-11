package vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import models.Device;

import play.db.jpa.Model;

/**
 * 车辆事件统计—视图对象
 * @author weiwei
 *
 */
public class VehicleEvent{
	
	public long id;
	
	/* 车辆 */
	public String vehicleNo;

	/* GPS设备ID */
	public String device;
	
	/* 状态 */
	public String status;
	
	/* 当前速度 */
	public long currentSpeed;
	
	/* 超速持续时间 */
	public long speedingTime;
	
	/* 突然加速 */
	public long suddenAcceleration;
	
	/* 突然刹车 */
	public long suddenBrake;
	
	/* 突然左转 */
	public long suddenLeftTurn;
	
	/* 突然右转 */
	public long suddenRightTurn;
	
	/* 空载 */
	public long idling;
	
	
	
}
