package com.bike.Dao;

import java.util.Map;

import com.bike.Dto.Page;
import com.bike.Dto.Site;


public interface SiteDao {
	
	public Site getSiteByUuid(int s_uuid);
	
	public Page getAllSiteByPage(Map<String,Object> pageMap);
	
	
}
