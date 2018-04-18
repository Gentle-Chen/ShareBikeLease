package com.bike.Dao;

import java.util.List;
import java.util.Map;

import com.bike.Dto.Page;
import com.bike.Dto.Site;


public interface SiteDao {
	
	public Site getSiteByUuid(int s_uuid);
	
	public Page getAllSiteByPage(Map<String,Object> pageMap);
	
	public List<Site> getAllSite();
	
	public Site addSite(Site site);
	
	public Site updateSite(Site site);
	
	public Site deleteSite(int s_uuid);
	
	
}


