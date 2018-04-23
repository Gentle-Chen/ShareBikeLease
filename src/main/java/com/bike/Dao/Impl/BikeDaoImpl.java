package com.bike.Dao.Impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bike.Constant.GlobalConstants;
import com.bike.Dao.BikeDao;
import com.bike.Dao.PageDao;
import com.bike.Dto.Bike;
import com.bike.Dto.Lease;
import com.bike.Dto.Page;
import com.bike.Dto.Site;

@Repository
public class BikeDaoImpl implements BikeDao{

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	private PageDao pageDao;

	public Bike addBike(Bike bike) {
		String insertStatement = "com.bike.Mapper.BikeMapper.addBike";
		String updateStatement = "com.bike.Mapper.BikeMapper.updateSite_addBike";
		Site site = bike.getSite();
		int i = sqlSessionTemplate.insert(insertStatement, bike);
		int j = sqlSessionTemplate.update(updateStatement, site);
		if(i>0 && j>0){
			return bike;
		}else{
			sqlSessionTemplate.rollback();
			return null;
		}
	}
	
	public  List<Bike> getBikeByUuid(int b_uuid){
		String statement = "com.bike.Mapper.BikeMapper.getBikeByUuid";
		List<Bike> bike = sqlSessionTemplate.selectList(statement,b_uuid);
		return bike;
	}
	
	public  List<Bike> getBikeById(String b_id){
		String statement = "com.bike.Mapper.BikeMapper.getBikeById";
		List<Bike> bike = sqlSessionTemplate.selectList(statement,b_id);
		return bike;
	}
	
			

	public Page getAllBikeByPage(Map<String,Object> pageMap){
		Long totalCount = pageDao.selectBikeTotalCount(null);
		int pageNum = Integer.parseInt(pageMap.get("pageNum").toString());
		int pageSize = Integer.parseInt(pageMap.get("pageSize").toString());
        Page page = new Page(pageSize, totalCount.intValue());
        page.setCurrentPage(pageNum);
        int startNum = (page.getCurrentPage() - 1) * page.getPageSize();
        pageMap.put("startNum", startNum);
        List<Bike> bike = pageDao.selectPageBike(pageMap);
        page.setListObject(bike);
		return page;
	}

	


	public int countBike(String b_status) {
		String statement = "com.bike.Mapper.BikeMapper.countBike";
		List<Object>  list = sqlSessionTemplate.selectList(statement,b_status);
		Object o = list.get(0);
		int i = Integer.parseInt(o.toString());
		return i;
	}


	public Page countUsingBikeByTime(Map<String,Object> pageMap) {
		pageMap.put("b_status", GlobalConstants.bike_using_status) ;
		Long totalCount = pageDao.selectBikeTotalCount(pageMap);
		int pageNum = Integer.parseInt(pageMap.get("pageNum").toString());
		int pageSize = Integer.parseInt(pageMap.get("pageSize").toString());
        Page page = new Page(pageSize, totalCount.intValue());
        page.setCurrentPage(pageNum);
        int startNum = (page.getCurrentPage() - 1) * page.getPageSize();
        pageMap.put("startNum", startNum);
		List<Bike>  bike = pageDao.countUsingBikeByTime(pageMap);
		page.setListObject(bike);
		return page;
	}


	public Page countOtherBike(Map<String, Object> pageMap) {
		pageMap.put("b_status", GlobalConstants.bike_free_status) ;
		Long totalCount = pageDao.selectBikeTotalCount(pageMap);
		int pageNum = Integer.parseInt(pageMap.get("pageNum").toString());
		int pageSize = Integer.parseInt(pageMap.get("pageSize").toString());
        Page page = new Page(pageSize, totalCount.intValue());
        page.setCurrentPage(pageNum);
        int startNum = (page.getCurrentPage() - 1) * page.getPageSize();
        pageMap.put("startNum", startNum);
		List<Bike>  bike = pageDao.countOtherBike(pageMap);
		page.setListObject(bike);
		return page;
	}


	public List<Bike> getBikeBySite(int s_uuid) {
		String statement = "com.bike.Mapper.BikeMapper.getBikeBySite";
		List<Bike> bike = sqlSessionTemplate.selectList(statement,s_uuid);
		return bike;
	}


	public int launchBike(Map<String, Object> bikeMap,Site site) {
		String statement = "com.bike.Mapper.BikeMapper.launchBike";
		String updateStatement = "com.bike.Mapper.BikeMapper.updateSite_addBike";
		int i = sqlSessionTemplate.update(statement,bikeMap);
		int j = sqlSessionTemplate.update(updateStatement,site);
		return i+j;
	}
	
	public int deleteBike(int b_uuid){
		String statement = "com.bike.Mapper.BikeMapper.deleteBike";
		int i = sqlSessionTemplate.delete(statement,b_uuid);
		return i;
	}
	
	public int fixBike(Map<String,Object> bikeMap,Site site){
		String statement = "com.bike.Mapper.BikeMapper.fixBike";
		String statement2 = "com.bike.Mapper.BikeMapper.updateSite_fixBike";
		int i = sqlSessionTemplate.delete(statement,bikeMap);
		int j = sqlSessionTemplate.update(statement2,site);
		return i+j;
	}
	
	public int fixedBike(Map<String,Object> bikeMap){
		String statement = "com.bike.Mapper.BikeMapper.fixedBike";
		int i = sqlSessionTemplate.delete(statement,bikeMap);
		return i;
	}
	
	
}
