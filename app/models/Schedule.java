package models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * 车次安排时间等信息
 * @author weiwei
 *
 */
@Entity
@Table(name="t_schedule")
public class Schedule extends Model {

	/* 司机编号 例如：74689 */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(referencedColumnName="number")
	public Driver driver;
	
	/* 车辆编号 例如：SMB77P */
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(referencedColumnName="number")
	public Vehicle vehicle;
	
	/* 开始时间 */
	@Column(name="start_time")
	public Date startTime;
	
	/* 结束时间 */
	@Column(name="end_time")
	public Date endTime;
	
	/* 开车路线 */
	@Column(name = "line")
	public String serviceNumber;
	
	/* 调度安排 例如：851AM04 | 851PM04 */
	@Column(unique = true, name = "duty_id")
	public String dutyId;
	
}
