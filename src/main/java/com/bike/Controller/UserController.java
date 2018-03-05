package com.bike.Controller;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.alibaba.fastjson.JSONObject;
import com.bike.Constant.GlobalConstants;
import com.bike.Dao.UserDao;
import com.bike.Dto.User;
import com.bike.Helper.UserSessionHelper;
import com.bike.Thread.AuditResultEmailThread;
import com.bike.Utils.ApplicationUtil;

@Controller
@RequestMapping(value="user/")
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/toRegist")
	public String toRegist(){
		return "user/regist";
	}
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(User u, HttpServletRequest request){
		if(u.getU_sex().equals("0")){
			u.setU_sex("ÄÐ");
		}else{
			u.setU_sex("Å®");
		}
		User user = userDao.regist(u);
		if(user != null){
			request.setAttribute("User",user);
		}else{
			request.setAttribute("User",null);
		}
		return "index";
	}
	@RequestMapping(value="/checkEmail",method=RequestMethod.POST)
	@ResponseBody
	public String checkEmail(@RequestBody Map<String,Object> u_email){
		JSONObject json = new JSONObject();
		if(userDao.checkEmail((String)u_email.get("u_email"))){
			json.put("result", GlobalConstants.email_no_exit);
			return json.toJSONString();
		}else{
			json.put("result", GlobalConstants.email_exit);
			return json.toJSONString();
		}
		
	}
	
	@RequestMapping(value="operation/{u_uuid}")
	public ModelAndView operation(@PathVariable("u_uuid")int u_uuid,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("index");
		User user = userDao.getUserByUuid(u_uuid);
		mv.addObject("User",user);
		return mv;
	}
	
	
	@RequestMapping(value="info/{u_uuid}")
	public ModelAndView userInfo(@PathVariable("u_uuid")int u_uuid,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("user/userInfo");
		User user = userDao.getUserByUuid(u_uuid);
		mv.addObject("User",user);
		return mv;
	}
	
	@RequestMapping(value="update")
	public ModelAndView updateUser(int u_uuid,String phone,String address , HttpServletRequest request){
		ModelAndView mv = new ModelAndView("user/userInfo");
		User user = userDao.updateUser(u_uuid, phone, address);
		mv.addObject("User",user);
		return mv;
	}
	
	@RequestMapping(value="toUpdatePassword")
	public ModelAndView toUpdatePassword(HttpServletRequest request){
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		ModelAndView mv = new ModelAndView("user/updatePassword");
		mv.addObject("User",user);
		return mv;
	}
	
	@RequestMapping(value="checkOldPassword/{u_uuid}/{u_password}")
	@ResponseBody
	public String checkPassword(@PathVariable("u_uuid")int u_uuid,
			@PathVariable("u_password")String u_password , HttpServletRequest request){
		JSONObject json = new JSONObject();
		User user = userDao.getUserByUuid(u_uuid);
		if(user.getU_password().equals(u_password)){
			json.put("result", GlobalConstants.success);
		}else{
			json.put("result", GlobalConstants.oldPassword_wrong);
		}
		return json.toJSONString();
	}
	
	@RequestMapping(value="updatePassword")
	public ModelAndView updatePassword(int u_uuid,String newPassword , HttpServletRequest request){
		ModelAndView mv = new ModelAndView("user/userInfo");
		User user = userDao.updatePassword(u_uuid, newPassword);
		mv.addObject("User",user);
		return mv;
	}
	
	@RequestMapping(value="confirmResetPassword")
	public String toConfirmResetPassword(){
		return "user/confirmResetPassword";
	}
	
	@RequestMapping(value="showResetPassword",method=RequestMethod.POST)
	@ResponseBody
	public String showResetPassword(@RequestBody Map<String,Object> map){
		JSONObject json = new JSONObject();
		User user = userDao.getUserByEmail(map.get("email").toString());
		if(user.getU_identityCard().equals(map.get("identityCard").toString())){
			json.put("result", GlobalConstants.success);
			json.put("email", map.get("email").toString());
			String templatePath = ApplicationUtil.getInstance().getProjectPath() + "/"
	                + "WEB-INF/views/user/showResetPassword.html";
	        AuditResultEmailThread emailThread = new AuditResultEmailThread(map.get("email").toString(), templatePath);
	        new Thread(emailThread).start();
		}else{
			json.put("result", GlobalConstants.identityCard_wrong);
		}
		return json.toJSONString();
	}
	@RequestMapping(value="toResetPassword")
	public String toResetPassword(){
		return "user/resetPassword";
	}
	@RequestMapping(value="resetPassword",method=RequestMethod.POST)
	public String resetPassword(String emailByte,String newPassword) throws IOException{
		BASE64Decoder decoder = new BASE64Decoder();
    	byte[] emailbyte = decoder.decodeBuffer(emailByte);
    	String emailStr = new String(emailbyte);  
    	String userEmail = emailStr.toString();
		
		System.out.println(newPassword);
		System.out.println(userEmail);
		userDao.resetPassword(userEmail, newPassword);
		return "login";
	}
	
}
