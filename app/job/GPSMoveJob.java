package job;

import java.util.List;

import javax.persistence.EntityTransaction;

import models.GPSDataRecord;
import models.LiveGPSData;
import models.Vehicle;
import play.Logger;
import play.db.jpa.GenericModel;
import play.jobs.Every;
import play.jobs.Job;

@Every("10s")
public class GPSMoveJob extends Job{
	static int COUNT = -1;
	static int VEHICLE_COUNT = -1;
	public void doJob() {
		if (VEHICLE_COUNT == -1){
			VEHICLE_COUNT = Integer.parseInt(String.valueOf(Vehicle.count()));
			COUNT = VEHICLE_COUNT * 60 ;
		}
		
		long allCount = LiveGPSData.count();
        if (allCount >= COUNT + VEHICLE_COUNT){
        	// 保证留下至少每辆车一条GPS数据，让前台地图保持显示图标
        	EntityTransaction trans = null;
    		try{
    			trans = GenericModel.em().getTransaction();
    			if (!trans.isActive()){
    				Logger.warn("GPSMoveJob Transaction is not active!");
    				return ;
    			}
    			
    			Logger.info("GPSMoveJob Transaction begin!");
    			List<LiveGPSData> all = LiveGPSData.all().fetch(1, COUNT);
    			for (LiveGPSData live : all) {
    				new GPSDataRecord(live).create();
    				live.delete();
    			}
    			
    			trans.commit();
    			Logger.info("GPSMoveJob Transaction commit");
    		}catch(Throwable e) {
    			e.printStackTrace();
    			if (trans != null){
    				trans.rollback();
    				Logger.info("GPSMoveJob Transaction rollback!");
    			}
    		}
        }
	}
	
}
