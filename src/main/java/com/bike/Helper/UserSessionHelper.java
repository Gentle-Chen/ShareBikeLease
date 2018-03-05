package com.bike.Helper;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.bike.Dto.Admin;
import com.bike.Dto.User;
import com.bike.Utils.CommonUtil;

public class UserSessionHelper {
	
	
	private static Logger logger = LogManager.getLogger(UserSessionHelper.class);
	
	/**
	 * check uuid of Login user in httpSession
	 */
	public static boolean checkLogin(HttpSession httpSession){
		String userLoginUUID = null;
		String adminLoginUUID = null;
		userLoginUUID = (String) httpSession.getAttribute("id");
		adminLoginUUID = (String) httpSession.getAttribute("a_id");
		logger.debug("userLoginID:"+userLoginUUID);
		logger.debug("adminLoginID:"+adminLoginUUID);
		boolean userFlag = CommonUtil.isNullOrEmpty(userLoginUUID);
		if(userFlag){
			return !CommonUtil.isNullOrEmpty(adminLoginUUID);
		}else{
			return !userFlag;
		}
	}
	
	/**
	 * set user info(uuid, id, name) in httpSession when user Login
	 */
	public static void userLogin(HttpSession httpSession,User loginUser,String type){
		httpSession.setAttribute("id", loginUser.getU_email());
		httpSession.setAttribute(httpSession.getId(), type);
		httpSession.setAttribute("name", loginUser.getU_name());
	}
	
	public static void adminLogin(HttpSession httpSession,Admin loginUser,String type){
		httpSession.setAttribute("a_id", loginUser.getA_email());
		httpSession.setAttribute(httpSession.getId(), type);
	}
	
	/**
	 * remove user info(uuid, id, name) in httpSession when user Logout
	 */
	public static void userLogout(HttpSession httpSession){
		if(httpSession.getAttribute("a_id") != null){
			httpSession.removeAttribute("a_id");
		}
		httpSession.removeAttribute("id");
		httpSession.removeAttribute("name");
	}
	
	/**
	 * get User Login UUID from httpSession
	 */
	public static String getUserLoginUUID(HttpSession httpSession){
		return (String) httpSession.getAttribute("id");
	}
	
	public static String getAdminLoginUUID(HttpSession httpSession){
		return (String) httpSession.getAttribute("a_id");
	}
	
	public static String returnType(HttpSession httpSession){
		return httpSession.getAttribute(httpSession.getId()).toString();
	}
	
}
