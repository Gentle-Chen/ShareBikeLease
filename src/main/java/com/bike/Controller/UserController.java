package com.bike.Controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bike.Constant.GlobalConstants;
import com.bike.Dao.BikeDao;
import com.bike.Dao.LeaseDao;
import com.bike.Dao.UserDao;
import com.bike.Dto.Deposit;
import com.bike.Dto.Lease;
import com.bike.Dto.Page;
import com.bike.Dto.User;
import com.bike.Helper.UserSessionHelper;
import com.bike.Thread.AuditResultEmailThread;
import com.bike.Utils.ApplicationUtil;
import com.bike.Utils.CommonUtil;

import sun.misc.BASE64Decoder;

@Controller
@RequestMapping(value="user/")
public class UserController {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BikeDao bikeDao;
	
	@Autowired
	private LeaseDao leaseDao;
	
	@RequestMapping(value="/toRegist")
	public String toRegist(){
		return "user/regist";
	}
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	public String regist(User u, HttpServletRequest request){
		if(u.getU_sex().equals("0")){
			u.setU_sex("��");
		}else{
			u.setU_sex("Ů");
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
	
	@RequestMapping(value="location")
	public ModelAndView location(@RequestParam(required = false, defaultValue = "1")
    int pageNum, @RequestParam(required = false, defaultValue = "2")
    int pageSize, HttpServletRequest request) {
		String ip = getClientIp(request);
		
		String json = getIPXY(null);
        JSONObject obj = JSONObject.parseObject(json);
        String province = obj.getJSONObject("content").getJSONObject("address_detail").get("province").toString();
        String city = obj.getJSONObject("content").getJSONObject("address_detail").get("city").toString();
        String x = obj.getJSONObject("content").getJSONObject("point").get("x").toString();
        String y = obj.getJSONObject("content").getJSONObject("point").get("y").toString();
        
		String aa = "113.543494,22.370807";
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		ModelAndView mv = new ModelAndView("user/location");
		mv.addObject("User",user);
		mv.addObject("province",province);
		mv.addObject("city",city);
		mv.addObject("x",x);
		mv.addObject("y",y);
		
		Map<String, String> params = CommonUtil.getParams(request);
        String s_uuid = params.get("site");
        
        mv.addObject("site", s_uuid);
		
        
        Map<String,Object> pageMap = new HashMap<String,Object>();
        pageMap.put("pageNum", pageNum);
		pageMap.put("pageSize", pageSize);
		pageMap.put("b_status", GlobalConstants.bike_free_status);
		pageMap.put("s_uuid", s_uuid);
        
		Page page = null;
		page =  bikeDao.countOtherBike(pageMap);
		
		mv.addObject("item", page);
		
		return mv;
	}
	
	
	@RequestMapping(value="recharge")
	public ModelAndView toRecharge(HttpServletRequest request) {
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		ModelAndView mv = new ModelAndView("user/recharge");
		mv.addObject("User",user);
		return mv;
	}
	
	@RequestMapping(value="rechargeMoney")
	@ResponseBody
	public String recharge(HttpServletRequest request,@RequestBody Map<String,Object> map) {
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		JSONObject json = new JSONObject();
		String money = map.get("money").toString();
		user.setU_balance(Float.parseFloat(money) + user.getU_balance());
		int i = userDao.recharge(user);
		if(i>0) {
			json.put("result", GlobalConstants.success);
		}else{
			
		}
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="deposit")
	public ModelAndView toPayDeposit(HttpServletRequest request) {
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		ModelAndView mv = new ModelAndView("user/payDeposit");
		Deposit deposit = userDao.checkDeposit(Integer.parseInt(user.getU_uuid()));
		mv.addObject("User",user);
		mv.addObject("deposit",deposit);
		return mv;
	}
	
	@RequestMapping(value="payDeposit")
	@ResponseBody
	public String PayDeposit(HttpServletRequest request,@RequestBody Map<String,Object> map) {
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		JSONObject json = new JSONObject();
		int i = userDao.payDeposit(user);
		if(i>1) {
			json.put("result", GlobalConstants.success);
		}else{
			
		}
		
		return json.toJSONString();
	}
	
	@RequestMapping(value="returnDeposit")
	@ResponseBody
	public String returnDeposit(HttpServletRequest request,@RequestBody Map<String,Object> map) {
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		JSONObject json = new JSONObject();
		int i = userDao.returnDeposit(user);
		if(i>1) {
			json.put("result", GlobalConstants.success);
		}else{
			
		}
		return json.toJSONString();
	}
	
	
	public static String getIPXY(String ip) {
		 
		String ak = "vLqhOPGXX1Q8CqvTbvg3yL6QE5mCoIuM";
		StringBuilder json = new StringBuilder();
		if (null == ip) {
			ip = "";
		}
		try {
			URL url = new URL("http://api.map.baidu.com/location/ip?ak=" + ak
			+ "&ip=" + ip + "&coor=bd09ll");
			URLConnection urlConnection = url.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(
            		urlConnection.getInputStream()));
            String inputLine = null;
            while ( (inputLine = in.readLine()) != null) {
                json.append(inputLine);
            }
            in.close();
        } catch (IOException e) {
        }
        return json.toString();
	}
	
	/**
	 * get client ip
	 * @return IP address
	 */
	public String getClientIp(HttpServletRequest request){
		String ipAddress = request.getHeader("x-forwarded-for");
		
		// if IP address is null
		 if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
		 //get get Remote address
			 ipAddress = request.getRemoteAddr();
		 if(ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")){
			 //get IP address by local host network adapter
	         InetAddress inetAddress = null;
	         try {
	             	inetAddress = InetAddress.getLocalHost();
		         } catch (UnknownHostException e) {
		         }
		         ipAddress = inetAddress.getHostAddress();
		    }
		 }
		 
		 //For multiple agents case, the first IP address is the actual IP address of client
		 if(null != ipAddress && ipAddress.length() > 15){
		     if(ipAddress.indexOf(",") > 0){
		    	 ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
		     }
		 }
		 
		 return ipAddress;
	}
	
	@RequestMapping(value="order",method=RequestMethod.GET)
	public ModelAndView ShowLeaseBike(@RequestParam(required = false, defaultValue = "1")
    int pageNum, @RequestParam(required = false, defaultValue = "2")
    int pageSize, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("user/order");
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		mv.addObject("User",user);
        
        Map<String,Object> pageMap = new HashMap<String,Object>();
        pageMap.put("pageNum", pageNum);
		pageMap.put("pageSize", pageSize);
		pageMap.put("u_uuid", user.getU_uuid());
        
		Page page = null;
		page =  leaseDao.showLeaseBike(pageMap);
		
		mv.addObject("item", page);
		return mv;
	}
	
}
