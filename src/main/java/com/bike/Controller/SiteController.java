package com.bike.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
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
import com.bike.Dto.Bike;
import com.bike.Dto.Page;
import com.bike.Dto.Site;
import com.bike.Helper.UserSessionHelper;

@Controller
@RequestMapping(value="site/")
public class SiteController {
	
	@Autowired
	private BikeDao bikeDao;
	
	@Autowired
	private SiteDao siteDao;
	
	@RequestMapping(value="all",method=RequestMethod.GET)
	@ResponseBody
	public String getSiteToReturnBike(HttpServletRequest request ){
		JSONObject json = new JSONObject();
		List<Site> site = siteDao.getAllSite();
		json.put("site", site);
		return json.toJSONString();
	}
	
	@RequestMapping(value="{s_uuid}",method=RequestMethod.GET)
	public String getBikeBySite(HttpServletRequest request , @PathVariable int s_uuid){
		List<Bike> bike = bikeDao.getBikeBySite(s_uuid);
		request.setAttribute("Bike",bike);
		return "bike/bike";
	}
	
	@RequestMapping(value="get")
	public ModelAndView getAllSite(@RequestParam(required = false, defaultValue = "1")
    int pageNum, @RequestParam(required = false, defaultValue = "2")
    int pageSize, HttpServletRequest request){
		
		String a_email = UserSessionHelper.getAdminLoginUUID(request.getSession());
		request.setAttribute("a_email", a_email);
		ModelAndView mv = new ModelAndView("admin/siteManage");
		Map<String, String> params = getParams(request);
//		String b_status = params.get("b_status");
//        String l_beginTime = params.get("startTime");
//        String l_endTime = params.get("endTime");
//        String s_uuid = params.get("site");
//        
//        mv.addObject("start", l_beginTime);
//        mv.addObject("end", l_endTime);
//        mv.addObject("b_status", b_status);
//        mv.addObject("site", s_uuid);
		
        
        Map<String,Object> pageMap = new HashMap<String,Object>();
        pageMap.put("pageNum", pageNum);
		pageMap.put("pageSize", pageSize);
//		pageMap.put("b_status", b_status);
//		pageMap.put("s_uuid", s_uuid);
//		pageMap.put("l_beginTime", l_beginTime);
//		pageMap.put("l_endTime", l_endTime);
        
		Page page = null;
//        if(b_status == null || b_status == "" || b_status.equals("")){
//        	page = bikeDao.getAllBikeByPage(pageMap);
//        	mv.addObject("item", page);
//			return mv;
//		}
//        
//        if(b_status.equals("1") || b_status == "1"){
//			page =  bikeDao.countUsingBikeByTime(pageMap);
//		}else{
//			page =  bikeDao.countOtherBike(pageMap);
//		}
		page = siteDao.getAllSiteByPage(pageMap);
		mv.addObject("item", page);
		return mv;
	}

	
	@RequestMapping(value="detail/{s_uuid}",method=RequestMethod.GET)
	@ResponseBody
	public String getBikeBySiteId(HttpServletRequest request , @PathVariable int s_uuid){
		List<Bike> bike = bikeDao.getBikeBySite(s_uuid);
		JSONObject json = new JSONObject();
		json.put("bikeList", bike);
		json.put("result", "success");
		request.setAttribute("Bike",bike);
		return json.toJSONString();
	}
	
	@RequestMapping(value="toAddSite")
	public String toAddSite(){
		return "admin/addSite";
	}
	
	@RequestMapping(value="addSite",method=RequestMethod.POST)
	public ModelAndView addSite(Site site,HttpServletRequest request){
		siteDao.addSite(site);
		return new ModelAndView(new RedirectView("get"));
	}
	
	@RequestMapping(value="delete/{s_uuid}",method=RequestMethod.GET)
	@ResponseBody
	public String deleteSite(HttpServletRequest request , @PathVariable int s_uuid){
		Site site = siteDao.deleteSite(s_uuid);
		JSONObject json = new JSONObject();
		if(site != null) {
			json.put("result", GlobalConstants.success);
		}else{
		}
		return json.toJSONString();
	}
	
	
	 protected Map<String, String> getParams(HttpServletRequest request) {
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
