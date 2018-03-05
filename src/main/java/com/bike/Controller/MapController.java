package com.bike.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
}
