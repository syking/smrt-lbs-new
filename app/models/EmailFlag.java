package models;

import play.*;
import play.db.jpa.*;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name="t_email_flag")
public class EmailFlag extends Model {
    
	@Column(name="time_type")
	public String timeType;
	
	public String day;
	
	@ManyToOne
	public Driver leader;
	
	@ManyToOne
	public Department dept;
	
	@Column(name="is_email")
	public Boolean isEmail;
	
	public EmailFlag(String timeType, String day, Driver leader, Department dept, Boolean isEmail) {
		super();
		this.timeType = timeType;
		this.day = day;
		this.leader = leader;
		this.dept = dept;
		this.isEmail = isEmail;
	}



	public static EmailFlag findOne(String timeType, String day, long leaderId, long deptId){
		return EmailFlag.find("timeType = ? and day = ? and leader_id = ? and dept_id = ?", timeType, day, leaderId, deptId).first();
	}
	
}
