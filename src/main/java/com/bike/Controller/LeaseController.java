package com.bike.Controller;

import java.text.ParseException;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.bike.Constant.GlobalConstants;
import com.bike.Dao.LeaseDao;
import com.bike.Dao.UserDao;
import com.bike.Dto.Deposit;
import com.bike.Dto.Lease;
import com.bike.Dto.User;
import com.bike.Helper.UserSessionHelper;
import com.bike.Utils.TimeUtil;


@Controller
public class LeaseController {
	
	@Autowired
	private LeaseDao leaseDao;
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="toLeaseBike")
	public String toLeaseBike(){
		return "bike/leaseBike";
	}
	@RequestMapping(value="lease/{b_uuid}/{s_uuid}",method=RequestMethod.POST)
	@ResponseBody
	public String leaseBike(@PathVariable("b_uuid")String b_uuid,@PathVariable("s_uuid")String s_uuid,
			HttpServletRequest request) throws ParseException{
		
		JSONObject json = new JSONObject();
		
		UserSessionHelper.getUserLoginUUID(request.getSession());
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		List<Lease> l = leaseDao.getLeaseBike(Integer.parseInt(user.getU_uuid()));
		for(int i=0;i<l.size();i++) {
			if(l.get(i).getL_status().equals(GlobalConstants.lease_no_return)) {
				json.put("result", GlobalConstants.lease_no_return);
				return json.toJSONString();
			}
		}
		User u = userDao.checkMoney(Integer.parseInt(user.getU_uuid()), 0);
		Deposit deposit = userDao.checkDeposit(Integer.parseInt(user.getU_uuid()));
		if(deposit.getD_status().equals(GlobalConstants.deposit_no_pay)) {
			json.put("result", GlobalConstants.deposit_no_pay);
//		}
//		if(u == null) {
//			json.put("result", GlobalConstants.not_enough_money);
		}else {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("b_uuid",b_uuid);
			map.put("l_leaseSite",s_uuid);
			map.put("u_uuid",user.getU_uuid());
			map.put("l_leaseTime",TimeUtil.timeStampChangeTime(new Date().getTime()));
			map.put("l_status",GlobalConstants.lease_no_return);
			int l_uuid = leaseDao.leaseBike(map);
			Lease leaseBike = leaseDao.getLeaseBikeByUUID(l_uuid).get(0);
//			JSONObject json = (JSONObject) JSON.toJSON(leaseBike);
			json.put("result", GlobalConstants.success);
			json.put("l_uuid", leaseBike.getL_uuid());
		}
		
		return json.toJSONString();
	}
	@RequestMapping(value="toShowLeaseBike/{l_uuid}",method=RequestMethod.GET)
	public String toShowLeaseBike(HttpServletRequest request,@PathVariable int l_uuid){
		List<Lease> leaseBike = leaseDao.getLeaseBikeByUUID(l_uuid);
		request.setAttribute("leaseBike", leaseBike);
		return "bike/showLeaseBike";
	}
//	@RequestMapping(value="ShowLeaseBike/{u_uuid}",method=RequestMethod.GET)
//	public String ShowLeaseBike(HttpServletRequest request,@PathVariable int u_uuid){
//		List<Lease> leaseBike = leaseDao.getLeaseBikeByUUID(u_uuid);
//		request.setAttribute("leaseBike", leaseBike);
//		return "bike/showLeaseBike";
//	}
	
	
	@RequestMapping(value="toPay/{u_uuid}/{b_uuid}/{s_uuid}/{l_uuid}",method=RequestMethod.GET)
	 public String toPay(HttpServletRequest request, @PathVariable String u_uuid,
			 @PathVariable String b_uuid, @PathVariable String s_uuid, @PathVariable String l_uuid) throws Exception {
        String leaseTime = leaseDao.getLeaseBikeByUUID(Integer.parseInt(l_uuid)).get(0).getL_leaseTime();
		String returnTime = TimeUtil.timeStampChangeTime(new Date().getTime());
		double money = TimeUtil.caculate(TimeUtil.timeChangeTimeStamp(returnTime),TimeUtil.timeChangeTimeStamp(leaseTime));
		money = Math.round(money);
		Map<String,Object> leaseMap = new HashMap<String,Object>();
        leaseMap.put("l_money", money);
        leaseMap.put("u_uuid", u_uuid);
        leaseMap.put("b_uuid", b_uuid);
        leaseMap.put("s_uuid", s_uuid);
        leaseMap.put("l_uuid", l_uuid); 
        leaseMap.put("l_returnTime", returnTime); 
        request.setAttribute("leaseMap", leaseMap);
		return "pay/billing";
    }
	
	@RequestMapping(value="return",method=RequestMethod.POST)
	@ResponseBody
	public String returnBike(@RequestBody Map<String,Object> leaseMap,HttpServletRequest request) throws ParseException{
		int l_uuid = Integer.parseInt(leaseMap.get("l_uuid").toString());
		int u_uuid = Integer.parseInt(leaseMap.get("u_uuid").toString());
		int b_uuid = Integer.parseInt(leaseMap.get("b_uuid").toString());
		int s_uuid = Integer.parseInt(leaseMap.get("s_uuid").toString());
		String leaseTime = leaseDao.getLeaseBikeByUUID(l_uuid).get(0).getL_leaseTime();
		String returnTime = TimeUtil.timeStampChangeTime(new Date().getTime());
		double money = TimeUtil.caculate(TimeUtil.timeChangeTimeStamp(returnTime),TimeUtil.timeChangeTimeStamp(leaseTime));
		money = Math.round(money);
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		returnMap.put("l_money", money);
		returnMap.put("u_uuid", u_uuid);
		returnMap.put("b_uuid", b_uuid);
		returnMap.put("s_uuid", s_uuid);
		returnMap.put("l_uuid", l_uuid); 
		returnMap.put("l_returnTime", returnTime); 
		
		JSONObject json = new JSONObject();
		
		returnMap.put("l_money", money);
		returnMap.put("l_status",GlobalConstants.lease_returned);
		returnMap.put("l_returnTime",returnTime);
		
		User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
		if(money>=user.getU_balance()) {
			json.put("result", GlobalConstants.not_enough_money);
		}else {
			String flag = leaseDao.returnBike(returnMap);
			if(flag.equals("yes")) {
				json.put("result", GlobalConstants.success);
			}else {
				
			}
		}
		return json.toJSONString();
	}
//	List<Lease> userLease = leaseDao.getLeaseBike(Integer.parseInt(leaseMap.get("u_uuid").toString()));
//	for(int i=0;i<userLease.size();i+ +) {
//		if(userLease.get(i).getL_status().equals(GlobalConstants.lease_no_return)) {
//			json.put("result", GlobalConstants.lease_no_return);
//			return json.toJSONString();
//		}
//	}
//	Map<String,Object> map = new HashMap<String,Object>();
//	map.put("u_uuid",leaseMap.get("u_uuid"));//�޸��û����
//	map.put("b_uuid",leaseMap.get("b_uuid"));//�޸ĵ���״̬
//	map.put("s_uuid",leaseMap.get("s_uuid"));//�޸�վ������                                                             
//	map.put("l_uuid",leaseMap.get("l_uuid"));//�޸����ޱ�Ļ���ʱ�䡢��״̬
//	String leaseTime = bikeDao.getLeaseBikeByUUID((int)leaseMap.get("l_uuid")).get(0).getL_leaseTime();
//	String returnTime = TimeUtil.timeStampChangeTime(new Date().getTime());
//	map.put("l_returnTime",returnTime);
//	double money = TimeUtil.caculate(TimeUtil.timeChangeTimeStamp(returnTime),TimeUtil.timeChangeTimeStamp(leaseTime));
//	map.put("l_money",money);
	
//	double money = Double.parseDouble((String) leaseMap.get("l_money"));
//	leaseMap.put("l_money", money);
//	leaseMap.put("l_status",GlobalConstants.lease_returned);
//	String flag = leaseDao.returnBike(leaseMap);
//	return flag;
}
