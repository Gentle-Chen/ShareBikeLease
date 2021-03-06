package com.bike.Utils;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

public class CommonUtil {
	/**
	 * Determine whether the object is empty
	 * 
	 * @param object
	 * @return
	 */
	public static boolean isNull(Object object) {
		return object == null ? true : false;
	}

	/**
	 * Determine whether the collection is empty or null
	 * 
	 * @param collection
	 * @return
	 */
	public static boolean isNullOrEmpty(Collection collection) {
		return null == collection || 0 == collection.size() ? true : false;
	}

	/**
	 * Determine whether the map is empty or null
	 * 
	 * @param map
	 * @return
	 */
	public static boolean isNullOrEmpty(Map map) {
		return null == map || 0 == map.size() ? true : false;
	}

	/**
	 * Determine whether the object array is empty or null
	 * 
	 * @param objects
	 * @return
	 */
	public static boolean isNullOrEmpty(Object[] objects) {
		return null == objects || 0 == objects.length ? true : false;
	}

	/**
	 * Determine whether the string is empty or null
	 * 
	 * @param subject
	 * @return
	 */
	public static boolean isNullOrEmpty(String subject) {
		return subject == null || "".equals(subject) ? true : false;
	}

	/**
	 * Determine whether the byte array is empty or null
	 * 
	 * @param bt
	 * @return
	 */
	public static boolean isNullOrEmpty(byte[] bt) {
		return bt == null || bt.length == 0 ? true : false;
	}

	/**
	 * generate UUID
	 */
	public static String generateUUID() {
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replace("-", "");
		return uuid;
	}

	/**
	 * get Current Time
	 */
	public static Date getCurrentTime() {
		return new Date();
	}

	/**
	 * get Current Time like HH:mm:ss
	 */
	public static String getCurentTimeHHmmss() {
		DateFormat format = new SimpleDateFormat("HH:mm:ss");
		return format.format(getCurrentTime());
	}
	
	/**
	 * bigDecimal To String
	 */
	public static String bigDecimalToString(BigDecimal curBigDecimal){
		return curBigDecimal.toString();
	}
	
	 public static Map<String, String> getParams(HttpServletRequest request) {
	        Map<String, String> params = new HashMap<String, String>();
	        Map<String, String[]> paramsMap = request.getParameterMap();
	        Set<String> keySet = paramsMap.keySet();
	        for (String key : keySet) {
	            String[] values = (String[]) paramsMap.get(key);
	            if (1 == values.length) {
	                params.put(key, StringUtils.trim(values[0]));
	            } else if (values.length > 1) {
	                params.put(key, StringUtils.join(values, ","));
	            }
	        }
	        return params;
	    }

}
