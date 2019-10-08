package com.royal.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatUtil {
	/**
	 *  ��ʽ��ʱ��(����תʱ��)
	 */
	public static String timeFormat(String format,Date date){
		SimpleDateFormat formater =new SimpleDateFormat(format);
		return formater.format(date);
	}

	/**
	 * ��ʽ��ʱ��(ʱ��ת����)
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
			System.err.println("ʱ��ת������");
		}
		return null;
	}
}
