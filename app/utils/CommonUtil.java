package utils;

import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import models.DriverReport;

import vo.VehicleVO;

import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CommonUtil {
	
	public static String percent(long a, long b){
		double k = (double)a/b*100;
		java.math.BigDecimal big = new java.math.BigDecimal(k);   
		return big.setScale(2,java.math.BigDecimal.ROUND_HALF_UP).doubleValue() +"%";
	}
	
	public static long[] changeSecondsToTime(long seconds){
		long hour = seconds/3600;
		long minute = (seconds-hour*3600)/60;
		long second = (seconds-hour*3600-minute*60);
		
		return new long[]{hour, minute, second};
	}

	public static Date[] getStartAndEndDate(String timeType, String time){
		Date start = null;
		Date end = null;
		
		Date chooseDate = null;
		try{
			if (timeType  != null && !timeType.isEmpty()){
				if (time != null && !time.isEmpty()){
					if (DriverReport.TIME_TYPE.DAILY.equals(timeType)){
						chooseDate = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", chooseDate) + " 00:00:00");
    					end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd",CommonUtil.addDate(start, 1)) + " 00:00:00");
    				}else if (DriverReport.TIME_TYPE.WEEKLY.equals(timeType)){
    					chooseDate = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					int day = CommonUtil.getDayOfWeek(chooseDate);
    					// day == 1 表示星期日， 所以要补回2
    					start = CommonUtil.addDate(chooseDate, -day+2);
    					end = CommonUtil.addDate(start, 7);
    				}else if (DriverReport.TIME_TYPE.MONTHLY.equals(timeType)){
    					chooseDate = new SimpleDateFormat("yyyy/MM").parse(time);
    					int lastDay = CommonUtil.getLastDayOfMonth(chooseDate);
    					start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM", chooseDate)+"-01 00:00:00");
    					end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) +" 00:00:00");
    				}else if (DriverReport.TIME_TYPE.YEARLY.equals(timeType)) {
    					chooseDate = new SimpleDateFormat("yyyy").parse(time);
    					int lastDay = CommonUtil.getLastDayOfYear(chooseDate);
    					start = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy", chooseDate)+"-01-01 00:00:00");
    					end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) + " 00:00:00");
    				}
				}
	    	}
		}catch(Throwable e){
			throw new RuntimeException(e);
		}
		
		return new Date[]{start, end};
	}
	
	public static Date getDateByTimeTypeAndTime(String timeType, String time){
		Date date = null;
		Date chooseDate = null;
		try{
			if (timeType  != null && !timeType.isEmpty()){
				if (time != null && !time.isEmpty()){
					if (DriverReport.TIME_TYPE.DAILY.equals(timeType)){
						chooseDate = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					date = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", chooseDate) + " 00:00:00");
    					//end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd",CommonUtil.addDate(start, 1)) + " 00:00:00");
    				}else if (DriverReport.TIME_TYPE.WEEKLY.equals(timeType)){
    					chooseDate = new SimpleDateFormat("yyyy/MM/dd").parse(time);
    					int day = CommonUtil.getDayOfWeek(chooseDate);
    					// day == 1 表示星期日， 所以要补回2
    					date = CommonUtil.addDate(chooseDate, -day+2);
    					//end = CommonUtil.addDate(start, 7);
    				}else if (DriverReport.TIME_TYPE.MONTHLY.equals(timeType)){
    					chooseDate = new SimpleDateFormat("yyyy/MM").parse(time);
    					//int lastDay = CommonUtil.getLastDayOfMonth(chooseDate);
    					date = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM", chooseDate)+"-01 00:00:00");
    					//end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) +" 00:00:00");
    				}else if (DriverReport.TIME_TYPE.YEARLY.equals(timeType)) {
    					chooseDate = new SimpleDateFormat("yyyy").parse(time);
    					//int lastDay = CommonUtil.getLastDayOfYear(chooseDate);
    					date = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy", chooseDate)+"-01-01 00:00:00");
    					//end = CommonUtil.parse("yyyy-MM-dd HH:mm:ss", CommonUtil.formatTime("yyyy-MM-dd", CommonUtil.addDate(start, lastDay)) + " 00:00:00");
    				}
				}
	    	}
		}catch(Throwable e){
			throw new RuntimeException(e);
		}
		
		return date;
	}
	
	public static int getDayOfYear(Date date){
		Calendar c = Calendar.getInstance(); 
        c.setTime(date); 
        
        return c.get(Calendar.DAY_OF_YEAR);
	}
	
	public static int getLastDayOfYear(Date date){
		 Calendar c = Calendar.getInstance(); 
         c.setTime(date); 
         
         return c.getActualMaximum(Calendar.DAY_OF_YEAR);
	}
	
	public static int getDayOfMonth(Date date){
		Calendar c = Calendar.getInstance(); 
        c.setTime(date); 
        
        return c.get(Calendar.DAY_OF_MONTH);
	}
	
	public static int getLastDayOfMonth(Date date){
		 Calendar c = Calendar.getInstance(); 
         c.setTime(date); 
         
         return c.getActualMaximum(Calendar.DAY_OF_MONTH);
	}
	
	// 判断日期为星期几,0为星期六,依此类推
	public static int getDayOfWeek(Date date) {
		// 首先定义一个calendar，必须使用getInstance()进行实例化
		Calendar aCalendar = Calendar.getInstance();
		// 里面野可以直接插入date类型
		aCalendar.setTime(date);
		// 计算此日期是一周中的哪一天
		int x = aCalendar.get(Calendar.DAY_OF_WEEK);
		return x;
	}
	
	public static int getLastDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance(); 
        c.setTime(date); 
        
        return c.getActualMaximum(Calendar.DAY_OF_WEEK);
	}

	public static <T> T jsonStr2JavaObj(String jsonStr, Class<T> clazz) {
		String json = jsonStr.substring(1, jsonStr.length() - 1);
		Gson gson = new Gson();
		return gson.fromJson(json, clazz);
	}

	public static long difference(Date date1, Date date2) {
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date1);

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(date2);

		if (cal2.after(cal1)) {
			return cal2.getTimeInMillis() - cal1.getTimeInMillis();
		}

		return cal1.getTimeInMillis() - cal2.getTimeInMillis();
	}

	public static Date addSecond(Date source, int s){
		Calendar cal = Calendar.getInstance();
		cal.setTime(source);
		cal.add(Calendar.SECOND, s);

		return cal.getTime();
	}
	
	public static Date addMinute(Date source, int min){
		Calendar cal = Calendar.getInstance();
		cal.setTime(source);
		cal.add(Calendar.MINUTE, min);

		return cal.getTime();
	}
	
	public static Date addHour(Date source, int hour){
		Calendar cal = Calendar.getInstance();
		cal.setTime(source);
		cal.add(Calendar.HOUR_OF_DAY, hour);

		return cal.getTime();
	}
	
	public static Date addDate(Date source, int day) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(source);
		cal.add(Calendar.DAY_OF_MONTH, day);

		return cal.getTime();
	}

	public static Date addMonth(Date source, int month) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(source);
		cal.add(Calendar.MONTH, month);

		return cal.getTime();
	}

	public static Date addYear(Date source, int year) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(source);
		cal.add(Calendar.YEAR, year);

		return cal.getTime();
	}
	
	public static Date parse(String format, String source){
		SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);
		try {
			return sdf.parse(source);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
	}

	public static String upperFirst(String s) {
		return s.replaceFirst(s.substring(0, 1), s.substring(0, 1)
				.toUpperCase());
	}

	public static Map map(String k, Object v) {
		Map map = new HashMap(1);
		map.put(k, v);
		return map;
	}

	public static Map map(String[] keys, Object[] values) {
		Map map = new HashMap(keys.length);
		for (int i = 0; i < keys.length; i++) {
			map.put(keys[i], values[i]);
		}

		return map;
	}

	/**
	 * 按照给定的 by 分割字符串，然后转化成Long数组。
	 * 
	 * @param source
	 * @param by
	 * @return
	 */
	public static long[] splitToLong(String source, String by) {

		if (source == null || source.trim().length() == 0 || by == null
				|| by.trim().length() == 0)
			return null;

		String[] strs = source.split(by);
		long[] longs = new long[strs.length];
		for (int i = 0; i < strs.length; i++) {
			longs[i] = Long.parseLong(strs[i]);
		}

		return longs;
	}

	/**
	 * 按照给定的 by 分割字符串，然后转化成int数组。
	 * 
	 * @param source
	 * @param by
	 * @return
	 */
	public static int[] splitToInt(String source, String by) {

		if (source == null || by == null)
			return null;

		String[] strs = source.split(by);
		int[] ints = new int[strs.length];
		for (int i = 0; i < strs.length; i++)
			ints[i] = Integer.parseInt(strs[i]);

		return ints;
	}

	public static Gson getGson(final String... skipField) {
		if (skipField == null || skipField.length == 0)
			return new Gson();

		// 由于Gson没有内置解决循环引用的问题，需要手动给定class或者field的名字告诉它哪些字段跳过
		return new GsonBuilder()
				.setExclusionStrategies(new ExclusionStrategy() {

					public boolean shouldSkipClass(Class<?> clazz) {
						return false;
					}

					public boolean shouldSkipField(FieldAttributes f) {
						for (String field : skipField) {
							if (f.getName().equals(field))
								return true;
						}

						return false;
					}

				}).serializeNulls().create();
	}

	/**
	 * 格式化时间 yyyy-MM-dd HH:mm:ss
	 * 
	 * @param date
	 * @return
	 */
	public static String formatTime(Date date) {
		return formatTime(null, date);
	}

	/**
	 * 格式化时间
	 * 
	 * @param format
	 *            格式，默认yyyy-MM-dd HH:mm:ss
	 * @param date
	 * @return
	 */
	public static String formatTime(String format, Date date) {
		if (format == null) {
			format = "yyyy-MM-dd HH:mm:ss";
		}

		String time = new java.text.SimpleDateFormat(format).format(date);
		return time;
	}

	/**
	 * 取得当前时间,给定格式
	 * 
	 * @return
	 */
	public static String getNowTime(String format) {
		if (format == null) {
			format = "yyyy-MM-dd HH:mm:ss";
		}

		String now = new java.text.SimpleDateFormat(format)
				.format(java.util.Calendar.getInstance().getTime());
		return now;
	}

	/**
	 * 取得当前时间
	 * 
	 * @return
	 */
	public static String getNowTime() {
		return getNowTime(null);
	}

	/**
	 * 组装KendoGrid需要的data
	 * 
	 * @param models
	 *            models Model list
	 * @param unless
	 *            unless 哪些字段不需要显示的
	 * @return {data:data, columns:columns}
	 */
	public static Map assemGridData(List<?> models, String... unless) {
		return assemGridData(models, new HashMap<Class<?>, String>(1), unless);
	}

	/**
	 * 组装返回 KendoGrid 需要的 columns
	 * 
	 * @param model
	 *            Model class
	 * @param unless
	 *            哪些字段不需要显示的。
	 * @return {field:xxx, title:xxx}
	 */
	public static List<Map> assemColumns(Class<?> model, String... unless) {
		return assemColumns(model, new HashMap<Class<?>, String>(1), unless);
	}

	/**
	 * 组装KendoGrid需要的data
	 * 
	 * @param models
	 *            Model list
	 * @param pojos
	 *            指定对应的POJO显示字段
	 * @param unless
	 *            哪些字段不需要显示的
	 * @return {data:data, columns:columns}
	 */
	public static Map assemGridData(List<?> models,
			Map<Class<?>, String> pojos, String... unless) {
		if (models == null || models.size() == 0)
			return null;

		Map map = new HashMap();
		Class<?> clazz = models.get(0).getClass();
		map.put("data", models);
		map.put("columns", assemColumns(clazz, pojos, unless));

		return map;
	}

	/**
	 * 组装返回 KendoGrid 需要的 columns
	 * 
	 * @param model
	 *            Model class
	 * @param pojos
	 *            指定对应的POJO显示字段
	 * @param unless
	 *            哪些字段不需要显示的。
	 * @return {field:xxx, title:xxx}
	 */
	public static List<Map> assemColumns(Class<?> model,
			Map<Class<?>, String> pojos, String... unless) {

		Field[] fields = model.getDeclaredFields();

		final List<Map> columns = new ArrayList<Map>(fields.length);

		label: for (Field f : fields) {
			String name = f.getName();
			if (unless != null) {
				for (String un : unless) {
					if (name.equals(un)) {
						continue label;
					}
				}
			}

			if (pojos != null && !pojos.isEmpty()
					&& pojos.containsKey(f.getType()))
				name = pojos.get(f.getType());

			Map map = new HashMap();

			map.put("field", name);
			map.put("title", Splitter.init(name).byUpperCase().by("_", ".")
					.connect(" ").split().upperFirst().toString());

			columns.add(map);
		}

		return columns;
	}

	public static Date newDate(String pattern, String time) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		try {
			return sdf.parse(time);
		} catch (ParseException e) {
			throw new RuntimeException();
		}
	}
}
