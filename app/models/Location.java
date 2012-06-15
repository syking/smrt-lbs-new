package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.Model;

/**
 * 列出公交车站及总站信息
 * @author weiwei
 *
 */
@Entity
@Table(name="t_location") 
public class Location extends Model{
	
	/* 编号 */
	@Column(unique = true)
	public String number;
	
	/* 名称 */
	@Column(unique = true)
	public String name;
	
	/* 公交车站还是总站 */
	@Column(length = 8)
	public String type;//bus-stop or depot
	
	/* 分组 */
	@ManyToOne
	public Department group;
	
	/* 描述 */
	@Column(nullable = false)
	public String description;
	
	/* 所在的道路名称 */
	public String road;
	
	/* 纬度 */
	public String latitude;//y
	
	/* 经度 */
	public String longitude;//x
}
