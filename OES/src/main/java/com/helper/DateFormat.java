package com.helper;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;

public class DateFormat {

	public static java.sql.Date getsqlDate(String strDate) {
		java.sql.Date sqlDate = null;

		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			java.util.Date utilDate = format.parse(strDate);
			sqlDate = new java.sql.Date(utilDate.getTime());
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlDate;
	}
	
	/*
	 * public static java.sql.Date getsqlDatetime(String strDate) { java.sql.Date
	 * sqlDate = null; try { DateTimeFormatter formatter =
	 * DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
	 * 
	 * } catch (Exception e) { System.out.println(e); } return sqlDate; }
	 */

	public static java.sql.Date getCurrentDate() {
		java.sql.Date sqlCurrentDate = null;

		try {
			java.util.Date utilDate = java.util.Calendar.getInstance().getTime();
			sqlCurrentDate = new java.sql.Date(utilDate.getTime());
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlCurrentDate;
	}
}/*
	 * DateTimeFormatter formatter =
	 * DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
	 * 
	 * //2018-08-03 03:50:17 LocalDateTime.now().format(formatter);
	 * 
	 * //2018-09-03 03:50:17 LocalDateTime.now().plusMonths(1).format(formatter);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * //Convert string to date. String string = "January 2, 2010"; SimpleDateFormat
	 * format = new SimpleDateFormat("yyyy-MM-dd hh.mm.ss"); Date date =
	 * format.parse(string); System.out.println(date); // Sat Jan 02 00:00:00 GMT
	 * 2010
	 * 
	 * //Plus future day. DateTime dtOrg = new DateTime(date); DateTime dtPlusOne =
	 * dtOrg.plusDays(1);
	 */