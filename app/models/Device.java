package models;

import play.db.jpa.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 设备,可以被分配到某一辆车上
 * 
 * @author weiwei
 * 
 */
@Entity
@Table(name = "t_device")
public class Device extends Model {

	@Column(unique = true)
	public String name;
	
	public String host;
	
	@Column(name="device_key", unique = true)
	public String key;
	
	public boolean alive;
	
	/* this is a json */
	@Column(name="server_urls", columnDefinition="TEXT")
	public String serverUrls;
	
	@Column(columnDefinition="TEXT")
	public String action;
	
	@Column(columnDefinition="TEXT")
	public String misc;
	
	public String status;

	@Override
	public String toString() {
		return "Device [name=" + name + ", host=" + host + ", key=" + key
				+ ", alive=" + alive + ", serverUrls=" + serverUrls
				+ ", action=" + action + ", misc=" + misc + ", status="
				+ status + "]";
	}

	public static Device findByName(String deviceName) {
		return find("byName", deviceName).first();
	}
}
