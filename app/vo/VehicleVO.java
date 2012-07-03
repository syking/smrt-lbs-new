package vo;


import models.Vehicle;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/8/12
 * Time: 3:19 PM
 */
public class VehicleVO
{

    public VehicleVO init(Vehicle vehicle){
        this.id = vehicle.id;
        this.number = vehicle.number;
        this.license = vehicle.license;
        if (vehicle.fleet != null)
        	this.fleetName = vehicle.fleet.name;
        if (vehicle.device != null)
        this.deviceName = vehicle.device.name;
        this.description = vehicle.description;
        this.cctvIp = vehicle.cctvIp;
        this.type = vehicle.type;

        return this;
    }

    public long id;

    public String number;//车辆编号

    public String license;//车牌号

    public String fleetName = "";//车队

    public String deviceName = "";//一辆车有一台唯一的GPS设备

    public String description;//描述

    public String cctvIp;//录像IP地址

    public String type;//车辆类型


}
