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

	public Site getSiteByUuid(int s_uuid) {
		String statement = "com.bike.Mapper.SiteMapper.getSiteByUuid";
		Site site = sqlSessionTemplate.selectOne(statement, s_uuid);
		return site;
	}

	public Page getAllSiteByPage(Map<String, Object> pageMap) {
		Long totalCount = pageDao.selectSiteTotalCount();
		int pageNum = Integer.parseInt(pageMap.get("pageNum").toString());
		int pageSize = Integer.parseInt(pageMap.get("pageSize").toString());
        Page page = new Page(pageSize, totalCount.intValue());
        page.setCurrentPage(pageNum);
        int startNum = (page.getCurrentPage() - 1) * page.getPageSize();
        pageMap.put("startNum", startNum);
        List<Site> site = pageDao.selectPageSite(pageMap);
        page.setListObject(site);
		return page;
	}

	public List<Site> getAllSite() {
		String statement = "com.bike.Mapper.SiteMapper.getAllSite";
		List<Site> site = sqlSessionTemplate.selectList(statement);
		return site;
	}

	@Override
	public Site addSite(Site site) {
		String statement = "com.bike.Mapper.SiteMapper.addSite";
		int i = sqlSessionTemplate.insert(statement,site);
		if(i>0) return site;
		else return null;
	}

	@Override
	public Site updateSite(Site site) {
		String statement = "com.bike.Mapper.SiteMapper.updateSite";
		int i = sqlSessionTemplate.update(statement,site);
		if(i>0) return site;
		else return null;
	}

	@Override
	public Site deleteSite(int s_uuid) {
		String statement = "com.bike.Mapper.SiteMapper.deleteSite";
		int i = sqlSessionTemplate.delete(statement,s_uuid);
		Site site = sqlSessionTemplate.selectOne(statement, s_uuid);
		if(i>0) return site;
		else return null;
	}

	
}
