package models;

import play.db.jpa.Model;

import javax.persistence.*;

/**
 * 车辆信息
 *
 */
@Entity
@Table(name="t_vehicle")
public class Vehicle extends Model{
	
	@Column(unique = true)
	public String number;//车辆编号
	
	@Column(unique = true)
	public String license;//车牌号
	
	@ManyToOne(fetch = FetchType.EAGER)
	public Fleet fleet;//车队
	
	@OneToOne(fetch = FetchType.EAGER)
	public Device device;//一辆车有一台唯一的GPS设备
	
	public String description;//描述
	
	@Column(name="cctv_ip")
	public String cctvIp;//录像IP地址
	
	public String type;//车辆类型
	
	@Transient
	public final static String[] DIRECTIONS = {"left", "right", "up", "down"};

	@Override
	public String toString() {
		return "Vehicle [number=" + number + ", license=" + license
				+ ", fleet=" + fleet + ", device=" + device + ", description="
				+ description + ", cctvIp=" + cctvIp + ", type=" + type
				+ ", id=" + id + "]";
	}

    public Vehicle(String number, String license, Fleet fleet, Device device, String description, String cctvIp, String type)
    {
        this.number = number;
        this.license = license;
        this.fleet = fleet;
        this.device = device;
        this.description = description;
        this.cctvIp = cctvIp;
        this.type = type;
    }

    public Vehicle(String number, String license, String description, String cctvIp, String type)
    {
        this.number = number;
        this.license = license;
        this.description = description;
        this.cctvIp = cctvIp;
        this.type = type;
    }
}
