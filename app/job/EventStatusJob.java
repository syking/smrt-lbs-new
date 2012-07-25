package job;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityTransaction;

import models.Driver;
import models.Event;
import models.EventRecord;
import models.Schedule;
import models.Vehicle;
import play.db.jpa.GenericModel;
import play.jobs.Every;
import play.jobs.Job;
import utils.CommonUtil;

/**
 * <p>
 * Event状态定时处理
 * </p>
 * 
 * @author weiwei
 *         <p>
 *         每隔一段时间，本程序会将 EventRecord 的所有 status = '0' (待处理) 的记录取出来，然后修改 status =
 *         '1' (处理中), 接着进入主处理程序。
 *         </p>
 *         <p>
 *         <ol>
 *         <li>首先程序入口必须上锁同步</li>
 *         <li>开启事务锁</li>
 *         <li>找到 status=0的所有EventRecord记录</li>
 *         <li>将这些记录更新 status=1</li>
 *         <li>遍历这些记录</li>
 *         <li>根据设备找到车辆。</li>
 *         <li>然后根据车辆编号找到调度安排表中的具体的若干记录。</li>
 *         <li>在安排表中的这些记录中根据事件发生的时间找到最符合的那条记录。</li>
 *         <li>计算</li>
 *         <li>将新的数据插入到Event中，与EventRecord一一对应</li>
 *         <li>提交事务，关闭事务锁</li>
 *         <li>打开程序同步锁</li>
 *         </ol>
 *         </p>
 */
@Every("30s")
public class EventStatusJob extends Job {

	public void doJob() {
		EntityTransaction trans = null;
		try {
			List<EventRecord> ers = EventRecord.findAll();
			if (ers == null)
				return;

			for (EventRecord er : ers) {
				if (er.status != 0)
					continue;

				System.out.println("\n process event record --> " + er);

				trans = GenericModel.em().getTransaction();
				if (!trans.isActive())
					continue;

				er.status = 1;// 处理中...
				er.save();

				System.out.println(" status --> " + 1);

				Vehicle v = Vehicle.find("device_id = ?", er.device.id).first();
				if (v == null) {
					trans.rollback();
					System.out.println(" v -> null -> rollback");
					continue;
				}

				Date et = er.time;
				Schedule schedule = Schedule
						.find("vehicle_number = ? and start_time <= ? and end_time >= ? ",
								v.number, et, et).first();

				if (schedule == null) {
					trans.rollback();
					System.out.println(" schedule -> null -> rollback");
					continue;
				}

				Event e = new Event();
				e.vehicle = v;
				e.fleet = v.fleet;
				e.eventRecord = er;
				e.driver = schedule.driver;
				e.serviceNumber = schedule.serviceNumber;
				e.department = schedule.driver.department;

				/*
				 * TODO 计算得到 road
				 */
				e.road = "";

				/*
				 * TODO 计算得到是否在高速公路
				 */
				e.isHighWay = false;

				/*
				 * TODO 计算得到是否在公交车站旁边
				 */
				e.isNearBusStop = false;

				e.save();

				er.status = 2; // 处理成功
				er.save();

				trans.commit();
				System.out.println(CommonUtil.getNowTime()
						+ " success -> commit");
			}
		} catch (Error e) {
			if (trans != null)
				trans.rollback();
			
			System.out.println(" error -> " + e.toString() + " -> rollback");
		} catch (Exception e) {
			if (trans != null)
				trans.rollback();
			System.out.println(" exception -> " + e.toString() + " -> rollback");
		}
	}
}
