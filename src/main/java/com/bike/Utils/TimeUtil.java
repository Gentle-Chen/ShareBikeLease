package com.bike.Utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	
	public static double caculate(long returnTime , long leaseTime){
		
//		Date date1 = new Date();
//		Date date2 = new Date();
//		date1.setTime(leaseTime);
//		date2.setTime(returnTime);
//		return Math.floor((date2.getTime()-date1.getTime())%86400%3600/60);
		double time = Math.floor((returnTime-leaseTime)/1000/60);
		double money = time * 0.03;
		return money;
	}
	
	public static String timeStampChangeTime(long timestamp) throws ParseException{ 
		
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    String time = format.format(timestamp);  
	    Date date= format.parse(time);  
	    System.out.println("Format To String(Date):"+time);  
	    System.out.println("Format To Date:"+date); 
	    return time;
		
	}
	
	public static long timeChangeTimeStamp(String time) throws ParseException{ 
		
		SimpleDateFormat format =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    Date date = format.parse(time);
        long timeStamp = date.getTime();
	    return timeStamp;
		
	}

}
