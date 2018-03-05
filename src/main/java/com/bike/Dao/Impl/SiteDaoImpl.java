package com.bike.Dao.Impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bike.Dao.PageDao;
import com.bike.Dao.SiteDao;
import com.bike.Dto.Bike;
import com.bike.Dto.Page;
import com.bike.Dto.Site;

@Repository
public class SiteDaoImpl implements SiteDao{

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	PageDao pageDao;

	@Override
	public Site getSiteByUuid(int s_uuid) {
		String statement = "com.bike.Mapper.SiteMapper.getSiteByUuid";
		Site site = sqlSessionTemplate.selectOne(statement, s_uuid);
		return site;
	}

	@Override
	public Page getAllSiteByPage(Map<String, Object> pageMap) {
		Long totalCount = pageDao.selectSiteTotalCount();
		int pageNum = (int) pageMap.get("pageNum");
		int pageSize = (int) pageMap.get("pageSize");
        Page page = new Page(pageSize, totalCount.intValue());
        page.setCurrentPage(pageNum);
        int startNum = (page.getCurrentPage() - 1) * page.getPageSize();
        pageMap.put("startNum", startNum);
        List<Site> site = pageDao.selectPageSite(pageMap);
        page.setListObject(site);
		return page;
	}

	
}
