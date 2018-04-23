package com.bike.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.bike.Dao.SiteDao;
import com.bike.Dto.Site;

@Controller
@RequestMapping("map/")
public class MapController {
	
	@Autowired
	SiteDao siteDao;
	
	
	@RequestMapping(value="showSiteMap",method=RequestMethod.POST)
	public ModelAndView toShowSiteMap(  int s_uuid){
//		String ss = "a";
//		int i = Integer.parseInt(ss);
		ModelAndView mv = new ModelAndView("map/showSiteMap");
		Site site = siteDao.getSiteByUuid(s_uuid);
		mv.addObject("longitude",site.getS_longitude());
		mv.addObject("latitude",site.getS_latitude());
		mv.addObject("name",site.getS_name());
		return mv;
	}
	
	@RequestMapping(value="showMap/{s_uuid}",method=RequestMethod.GET)
	public ModelAndView showMap(@PathVariable("s_uuid")String s_uuid){
//		String ss = "a";
//		int i = Integer.parseInt(ss);
		ModelAndView mv = new ModelAndView("user/location1");
		Site site = siteDao.getSiteByUuid(Integer.parseInt(s_uuid));
		
		List<Site> sites = siteDao.getAllSite();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("allSite", sites);
//		Site site2 = new Site();
//		site2.setS_uuid(site1.getS_uuid());
//		
//		List listObject = new ArrayList();
//		listObject.add(site1);
//		for(int i=0;i<sites.size();i++) {
//			listObject.add(sites.get(i));
//		}
		mv.addObject("centerSite",site);
		mv.addObject("site",jsonObject);
		return mv;
	}
}
