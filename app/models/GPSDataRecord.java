package models;

import play.*;
import play.db.jpa.*;

import javax.persistence.*;

import java.util.*;

@Entity
@Table(name="t_gps_data_record")
public class GPSDataRecord extends Model {
	public GPSDataRecord(){}
	
	public GPSDataRecord(LiveGPSData live){
		this.latitude = live.latitude;
		this.longitude = live.longitude;
		this.speed = live.speed;
		this.direction = live.direction;
		this.time = live.time;
		this.device = live.device;
		this.fixed = live.fixed;
		this.created_at = live.created_at;
	}
	/**
     * Assumed to be in 6 decimal space.
     * Hence, 103.546762 becomes 103546762
     * While, 103.546 becomes 103546000
     */
    public String latitude;

    /**
     * Assumed to be in 6 decimal space.
     * Hence, 103.546762 becomes 103546762
     * While, 103.546 becomes 103546000
     */
    public String longitude;

    /**
     * Assumed to be 2 decimal space.
     * Hence 120.01 becomes 12001
     * While 70 becomes 7000
     */
    public Integer speed = 0;

    /**
     * Assumed to be 2 decimal space.
     * Hence 120.01 becomes 12001
     * While 70 becomes 7000
     */
    public Integer direction = 0;
    
    /**
     * Time given by device.
     */
    public Date time = new Date();

    /**
     * Can be left empty.
     */
    @ManyToOne(fetch=FetchType.EAGER, cascade= CascadeType.REFRESH)
    @JoinColumn(name = "device_key", referencedColumnName = "device_key")
    public Device device;

    /**
     * Whether this point is fixed by the user.
     * True means the point was entered through "edit device".
     * False or null means the point was provided by the device.
     */
    public Boolean fixed;

    /**
     * System generated. Do not modify unless have a good reason.
     */
    public Date created_at = Calendar.getInstance().getTime();
}
