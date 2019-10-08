package com.royal.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatUtil {
	/**
	 *  格式化时间(日期转时间)
	 */
	public static String timeFormat(String format,Date date){
		SimpleDateFormat formater =new SimpleDateFormat(format);
		return formater.format(date);
	}

	/**
	 * 格式化时间(时间转日期)
	 * @param format
	 * @param time
	 * @return
	 */
	public static Date timeDateFormat(String format,String time){
		SimpleDateFormat formater =new SimpleDateFormat(format);
		try {
			return formater.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.err.println("时间转换错误");
		}
		return null;
	}
}
