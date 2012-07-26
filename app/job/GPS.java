package job;

import java.util.HashMap;
import java.util.Map;

import models.Device;
import models.LiveGPSData;
import models.Vehicle;
import play.jobs.Every;
import play.jobs.Job;
import utils.CommonUtil;
import vo.CurrentBusData;

/**
 * 模拟GPS定时更新数据
 * @author weiwei
 *
 */
@Every("10s")
public class GPS extends Job {

	public static CurrentBusData[] currentBusDatas;
    public static int currentBusCount = 0;
    public final static Map<String, Integer> dire = new HashMap<String, Integer>();
    static{
    	dire.put("left", 0);
    	dire.put("right", 1);
    	dire.put("up", 2);
    	dire.put("down", 3);
    }

    public void doJob(){
    	try{
    		GPS.generate(21, "");
    	}catch(Throwable e){
    		System.out.println(CommonUtil.getNowTime() + "-----------------" + e);
    	}
    }
    
    /**
     * 这个得使用 Job 定时进行发送
     * @param count 条数
     * @param mode 模式：reload 重新生成车辆对象；!reload 移动已有的车辆对象的位置
     */
    public static void generate(int count, String mode){
        CurrentBusData[] newCurrentData;
        if(count == currentBusCount && !mode.toLowerCase().equals("reload"))
            newCurrentData = moveVehicle(currentBusDatas);
        else 
            newCurrentData = generateCurrentBusData(count);
        
        long allCount = LiveGPSData.count();
        if (allCount >= 10000)
        	LiveGPSData.deleteAll();
        
        for (CurrentBusData c : newCurrentData){
        	LiveGPSData gps = new LiveGPSData();
        	
        	Vehicle v = Vehicle.find("number = ?", c.busPlateNumber).first();
        	if (v == null)
        		continue;
        	
        	gps.device = Device.findById(v.device.id);
        	gps.direction = dire.get(c.direction);
        	gps.fixed = true;
        	gps.longitude = String.valueOf(c.xCoord);
        	gps.latitude = String.valueOf(c.yCoord);
        	gps.speed = c.currentSpeed;
        	
        	gps.save();
        }
        
    }

    protected static CurrentBusData[] moveVehicle(CurrentBusData[] currentDatas){
        double minXCoord = 10240.0529981345;
        double maxXCoord = 39516.1129604966;
        double minYCoord = 28876.64251572593;
        double maxYCoord = 44469.9694430107;
        
        CurrentBusData[] newCurrentData = new CurrentBusData[currentBusCount];
        
        if(currentDatas.length == 0 || currentDatas.length != currentBusCount)
            newCurrentData = generateCurrentBusData(currentBusCount);
        else {
            for(int i = 0; i< currentDatas.length; i++){
                CurrentBusData currentData = currentDatas[i];

                if(currentData.direction.equals("left")){
                    currentData.xCoord = currentData.xCoord - (30 + Math.random() * 70);
                    currentData.yCoord = currentData.yCoord - Math.random() * 30;
                }
                
                else if(currentData.direction.equals("right")){
                    currentData.xCoord = currentData.xCoord + (30 + Math.random() * 70);
                    currentData.yCoord = currentData.yCoord + Math.random() * 30;
                }
                
                else if(currentData.direction.equals("up")){
                    currentData.xCoord = currentData.xCoord + Math.random() * 30;
                    currentData.yCoord = currentData.yCoord + (30 + Math.random() * 70);
                }
                
                else if(currentData.direction.equals("down")){
                    currentData.xCoord = currentData.xCoord - Math.random() * 30;
                    currentData.yCoord = currentData.yCoord - (30 + Math.random() * 70);
                }

                if(currentData.xCoord < minXCoord)
                    currentData.direction = "right";
                
                if(currentData.xCoord > maxXCoord)
                    currentData.direction = "left";
                
                if(currentData.yCoord < minYCoord)
                    currentData.direction = "up";
                
                if(currentData.yCoord > maxYCoord)
                    currentData.direction = "down";
                
            }
        }
        return currentDatas;
    }

    protected static CurrentBusData[] generateCurrentBusData(int count){
        CurrentBusData[] newCurrentData = new CurrentBusData[count];
        double minXCoord = 10240.0529981345;
        double maxXCoord = 39516.1129604966;
        double minYCoord = 28876.64251572593;
        double maxYCoord = 44469.9694430107;
        String[] activeStatuses = {"on"};
        String[] vehicleTypes = {"car", "bus"};
        String[] directions = {"left", "right", "up", "down"};
        String[] serviceNumbers = {"961","851","61","188","196","197","864","75","147","174","51","63","133"};

        int minId = 0;
        for (int i = 0; i<count; i++){
            CurrentBusData data = new CurrentBusData();

            int id = minId + i;
            String number = String.valueOf(i);
            if (i < 10)
            	number = "0"+(i+1);
            
            String busPlateNumber = "vehicle" + number;
            int currentSpeed = (int)Math.ceil(Math.random() * 100);
            double xCoord = minXCoord + (Math.random() * (maxXCoord - minXCoord));
            double yCoord = minYCoord + (Math.random() * (maxYCoord - minYCoord));
            String activeStatus = activeStatuses[(int)Math.floor(Math.random() * activeStatuses.length)];
            String  vehicleType = vehicleTypes[(int)Math.floor(Math.random() * vehicleTypes.length)];
            String serviceNumber = serviceNumbers[(int)Math.floor(Math.random() * serviceNumbers.length)];
            String direction = directions[(int)Math.floor(Math.random() * directions.length)];

            data.id = id;
            data.busPlateNumber = busPlateNumber;
            data.serviceNumber = serviceNumber;
            data.driver = "DR"+number;
            data.currentSpeed = currentSpeed;
            data.xCoord = xCoord;
            data.yCoord = yCoord;
            data.vehicleType = vehicleType;
            data.activeStatus = activeStatus;
            data.direction = direction;

            newCurrentData[i] = data;
        }

        currentBusCount = count;
        currentBusDatas = newCurrentData;
        return newCurrentData;
    }
    

}