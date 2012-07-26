package models;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

@Entity
@Table(name="t_live_gps_data")
public class LiveGPSData extends Model {
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
