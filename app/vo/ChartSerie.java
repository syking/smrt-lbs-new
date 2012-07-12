package vo;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * kendo chart series
 * @author weiwei
 *
 */
public class ChartSerie {
	public ArrayList<Long> speeding = new ArrayList<Long>();
	public ArrayList<Long> suddenAcceleration = new ArrayList<Long>();
	public ArrayList<Long> suddenBrake = new ArrayList<Long>();
	public ArrayList<Long> suddenLTurn = new ArrayList<Long>();
	public ArrayList<Long> suddenRTurn = new ArrayList<Long>();
	public ArrayList<Long> idling = new ArrayList<Long>();
	
	public void assemDriverReportData(EventReportVO drVO){
		this.speeding.add(drVO.speeding);
		this.suddenAcceleration.add(drVO.suddenAcceleration);
		this.suddenBrake.add(drVO.suddenBrake);
		this.suddenLTurn.add(drVO.suddenLTurn);
		this.suddenRTurn.add(drVO.suddenRTurn);
	}
	
	public List<Map> generateChartSeries(){
		Field[] fs = ChartSerie.class.getDeclaredFields();
		if (fs == null || fs.length == 0)
			return null;
		
		List<Map> series = new ArrayList<Map>(fs.length);
		for (Field f :fs){
			try {
				Map ser = new HashMap();
				ser.put("name", f.getName());
				f.setAccessible(true);
				Object list = f.get(this);
				ser.put("data", list);
				series.add(ser);
			} catch (Throwable e) {
				e.printStackTrace();
				continue;
			}
		}
		
		return series;
	}
}
