package org.sdrc.crvs.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CommonUtility {

	private final static String DATE_AND_TIME_FORMAT_01 = "dd-MM-YYYY HH:mm:ss";
	private final static String DATE_ONLY_FORMAT_01 = "dd-MM-YYYY";
	public static String currentDateAndTime(){
		DateFormat df = new SimpleDateFormat(DATE_AND_TIME_FORMAT_01);
		Calendar calobj = Calendar.getInstance();
		return df.format(calobj.getTime());
	}
	public static String currentDate(){
		DateFormat df = new SimpleDateFormat(DATE_ONLY_FORMAT_01);
		Calendar calobj = Calendar.getInstance();
		return df.format(calobj.getTime());
	}
	public static void main(String[] args) {
		System.out.println(currentDateAndTime());
		System.out.println(currentDate());
	}
}
