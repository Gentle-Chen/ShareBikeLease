package com.bike.Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.jfree.chart.ChartUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.alibaba.fastjson.JSONObject;
import com.bike.Constant.GlobalConstants;
import com.bike.Dao.BikeDao;
import com.bike.Dao.SiteDao;
import com.bike.Dao.UserDao;
import com.bike.Dto.Bike;
import com.bike.Dto.Page;
import com.bike.Dto.Site;
import com.bike.Dto.User;
import com.bike.Helper.UserSessionHelper;
import com.bike.Utils.DrawUtil;

@Controller
@RequestMapping(value="bike/")
public class BikeController {
	
	@Autowired
	private BikeDao bikeDao;
	@Autowired
	private SiteDao siteDao;
	@Autowired
	private UserDao userDao;
	
	
	@RequestMapping(value="toAddBike")
	public ModelAndView toAddBike(HttpServletRequest request){
		ModelAndView mv;
		
		String a_email = UserSessionHelper.getAdminLoginUUID(request.getSession());
		if(a_email == null) {
			mv = new ModelAndView("login");
		}else{
			mv = new ModelAndView("admin/addBike");
			UserSessionHelper.getUserLoginUUID(request.getSession());
			User user = userDao.getUserByEmail(UserSessionHelper.getUserLoginUUID(request.getSession()));
			mv.addObject("User",user);
		}
		return mv;
	}
	@RequestMapping(value="checkBike/{b_id}",method=RequestMethod.GET)
	@ResponseBody
	public String checkBike(@PathVariable("b_id")String b_id, HttpServletRequest request){
		JSONObject json = new JSONObject();
		List<Bike> bikeList = bikeDao.getBikeById(b_id);
		if(bikeList == null || bikeList.isEmpty()){
			json.put("result", GlobalConstants.success);
		}else{
			json.put("result", GlobalConstants.bike_exits);
		}
		return json.toJSONString();
	}
	@RequestMapping(value="addBike",method=RequestMethod.POST)
	public ModelAndView addBike(Bike b,String s_uuid,HttpServletRequest request){
		Site beforeSite = siteDao.getSiteByUuid(Integer.parseInt(s_uuid));
		b.setSite(beforeSite);
		b.setB_status("0");
		Bike bike = bikeDao.addBike(b);
		Site afterSite = siteDao.getSiteByUuid(Integer.parseInt(s_uuid));
		b.setSite(afterSite);
		if(bike != null){
			request.setAttribute("Bike",bike);
		}else{
			request.setAttribute("Bike",null);
		}
		return new ModelAndView(new RedirectView("bikeManage"));
	}

	@RequestMapping(value="get")
	public ModelAndView getAllBike(@RequestParam(required = false, defaultValue = "1")
    int pageNum, @RequestParam(required = false, defaultValue = "2")
    int pageSize, HttpServletRequest request){
			
			ModelAndView mv = null;
			String type = UserSessionHelper.returnType(request.getSession());
			if( type != null && type.equals(GlobalConstants.admin_type)){
				String a_email = UserSessionHelper.getAdminLoginUUID(request.getSession());
				if(a_email == null) {
					mv = new ModelAndView("login");
				}else {
					request.setAttribute("a_email", a_email);
					mv = new ModelAndView("admin/admin");
					Map<String, String> params = getParams(request);
					String b_status = params.get("b_status");
			        String l_beginTime = params.get("startTime");
			        String l_endTime = params.get("endTime");
			        String s_uuid = params.get("site");
			        
			        mv.addObject("start", l_beginTime);
			        mv.addObject("end", l_endTime);
			        mv.addObject("b_status", b_status);
			        mv.addObject("site", s_uuid);
					
			        
			        Map<String,Object> pageMap = new HashMap<String,Object>();
			        pageMap.put("pageNum", pageNum);
					pageMap.put("pageSize", pageSize);
					pageMap.put("b_status", b_status);
					pageMap.put("s_uuid", s_uuid);
					pageMap.put("l_beginTime", l_beginTime);
					pageMap.put("l_endTime", l_endTime);
			        
					Page page = null;
			        if(b_status == null || b_status == "" || b_status.equals("")){
			        	page = bikeDao.getAllBikeByPage(pageMap);
			        	mv.addObject("item", page);
						return mv;
					}
			        
			        if(b_status.equals("1") || b_status == "1"){
						page =  bikeDao.countUsingBikeByTime(pageMap);
					}else{
						page =  bikeDao.countOtherBike(pageMap);
					}
					mv.addObject("item", page);
				}
			}
			return mv;
		
	}
	
	
	@RequestMapping(value="countBike")
	public void countBike(HttpServletRequest request,HttpServletResponse response){
		int a = bikeDao.countBike("0");
		int b = bikeDao.countBike("1");
		int c = bikeDao.countBike("2");
		int d = bikeDao.countBike("3");
		int e = bikeDao.countBike("4");
		try {
			DrawUtil drawUtil = new DrawUtil(a,b,c,d,e);
			ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1.0f, drawUtil.getChartPanel().getChart(), 500, 270, null);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	
	@RequestMapping(value="bikeManage")
	public ModelAndView BikeManage(@RequestParam(required = false, defaultValue = "1")
    int pageNum, @RequestParam(required = false, defaultValue = "2")
    int pageSize, HttpServletRequest request){
		
		ModelAndView mv;
		
		String a_email = UserSessionHelper.getAdminLoginUUID(request.getSession());
		if(a_email == null) {
			mv = new ModelAndView("login");
		}else{
			request.setAttribute("a_email", a_email);
			mv = new ModelAndView("admin/bikeManage");
			Map<String, String> params = getParams(request);
			String b_status = params.get("b_status");
	        String l_beginTime = params.get("startTime");
	        String l_endTime = params.get("endTime");
	        String s_uuid = params.get("site");
	        
	        mv.addObject("start", l_beginTime);
	        mv.addObject("end", l_endTime);
	        mv.addObject("b_status", b_status);
	        mv.addObject("site", s_uuid);
			
	        
	        Map<String,Object> pageMap = new HashMap<String,Object>();
	        pageMap.put("pageNum", pageNum);
			pageMap.put("pageSize", pageSize);
			pageMap.put("b_status", b_status);
			pageMap.put("s_uuid", s_uuid);
			pageMap.put("l_beginTime", l_beginTime);
			pageMap.put("l_endTime", l_endTime);
	        
			Page page = null;
	        if(b_status == null || b_status == "" || b_status.equals("")){
	        	page = bikeDao.getAllBikeByPage(pageMap);
	        	mv.addObject("item", page);
				return mv;
			}
	        
	        if(b_status.equals("1") || b_status == "1"){
				page =  bikeDao.countUsingBikeByTime(pageMap);
			}else{
				page =  bikeDao.countOtherBike(pageMap);
			}
			
			mv.addObject("item", page);
		}
		return mv;
	}
	
	
	@RequestMapping(value="checkSite/{launch_site}")
	@ResponseBody
	public String checkSite(@PathVariable("launch_site")String launch_site){
		JSONObject json = new JSONObject();
		Site site = siteDao.getSiteByUuid(Integer.parseInt(launch_site));
		if(Integer.parseInt(site.getS_capacity()) <=0){
			json.put("result", GlobalConstants.bike_not_empty_location);
		}else{
			json.put("result", GlobalConstants.success);
		}
		return json.toJSONString();
	}
	@RequestMapping(value="bikeLaunch")
	public ModelAndView launch(String launch_b_uuid, String launch_b_id, String launch_b_status, String launch_site){
		Map<String,Object> launchMap = new HashMap<String,Object>();
		JSONObject json = new JSONObject();
		launchMap.put("b_uuid", launch_b_uuid);
		launchMap.put("b_status", launch_b_status);
		launchMap.put("s_uuid", launch_site);
		Site site = siteDao.getSiteByUuid(Integer.parseInt(launch_site));
		int i = bikeDao.launchBike(launchMap, site);
		return new ModelAndView(new RedirectView("bikeManage"));
	}
	
	@RequestMapping(value="delete/{b_uuid}")
	@ResponseBody
	public String deleteBike(@PathVariable(value = "b_uuid") int b_uuid,HttpServletRequest request){
		int i = bikeDao.deleteBike(b_uuid);
		JSONObject json = new JSONObject();
		if(i>0){
			json.put("result", "success");
		}else{
			json.put("result", "error");
		}
		return json.toJSONString();
	}
	
	@RequestMapping(value="fix/{b_uuid}")
	@ResponseBody
	public String fixBike(@PathVariable(value = "b_uuid") int b_uuid,HttpServletRequest request){
		Map<String,Object> bikeMap = new HashMap<String,Object>();
		bikeMap.put("b_status", GlobalConstants.bike_fixing_status);
		bikeMap.put("b_uuid", b_uuid);
		bikeMap.put("s_uuid", 1);
		Bike bike = bikeDao.getBikeByUuid(b_uuid).get(0);
		int s_uuid = Integer.parseInt(bike.getSite().getS_uuid());
		Site site = siteDao.getSiteByUuid(s_uuid);
		int i = bikeDao.fixBike(bikeMap,site);
		JSONObject json = new JSONObject();
		if(i>0){
			json.put("result", "success");
		}else{
			json.put("result", "error");
		}
		return json.toJSONString();
	}
	
	@RequestMapping(value="scrap/{b_uuid}",method=RequestMethod.POST)
	@ResponseBody
	public String scrap(@PathVariable("b_uuid")String b_uuid) {
		JSONObject json = new JSONObject();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("b_uuid", Integer.parseInt(b_uuid));
		map.put("b_status", GlobalConstants.bike_scrap_status);
		int i = bikeDao.scrapBike(map);
		if(i>0) {
			json.put("result", GlobalConstants.success);
		}
		return json.toJSONString();
	}
	
	
	 protected static Map<String, String> getParams(HttpServletRequest request) {
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
