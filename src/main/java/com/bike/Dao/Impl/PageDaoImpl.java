package com.bike.Dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bike.Dao.PageDao;
import com.bike.Dto.Bike;
import com.bike.Dto.Lease;
import com.bike.Dto.Site;

@Repository
public class PageDaoImpl implements PageDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	PageMapper pageMapper;
	
	public Long selectBikeTotalCount(String b_status) {
		String statement = "com.bike.Mapper.BikeMapper.selectBikeTotalCount";
		Map<String,String> statusMap = new HashMap<String,String>();
		statusMap.put("b_status",b_status);
		Long totalCount = sqlSessionTemplate.selectOne(statement,statusMap);
		return totalCount;
	}

	public List<Bike> selectPageBike(Map<String,Object> pageMap) {
		
		String statement = "com.bike.Mapper.BikeMapper.selectPageBike";
		List<Bike> bike = sqlSessionTemplate.selectList(statement,pageMap);
		return bike;
	}

	public List<Bike> countUsingBikeByTime(Map<String, Object> pageMap) {
		
		String statement = "com.bike.Mapper.BikeMapper.countUsingBikeByTime";
		List<Bike> bike = sqlSessionTemplate.selectList(statement,pageMap);
		return bike;
	}

	public List<Bike> countOtherBike(Map<String, Object> pageMap) {
		String statement = "com.bike.Mapper.BikeMapper.countOtherBike";
		List<Bike> bike = sqlSessionTemplate.selectList(statement,pageMap);
		return bike;
	}

	public Long selectSiteTotalCount() {
		String statement = "com.bike.Mapper.SiteMapper.selectSiteTotalCount";
		Long totalCount = sqlSessionTemplate.selectOne(statement);
		return totalCount;
	}
	
	public List<Site> selectPageSite(Map<String, Object> pageMap) {
		String statement = "com.bike.Mapper.SiteMapper.selectPageSite";
		List<Site> site = sqlSessionTemplate.selectList(statement,pageMap);
		return site;
	}

	public Long selectLeaseBikeTotalCount(int u_uuid) {
		String statement = "com.bike.Mapper.LeaseMapper.selectLeaseBikeTotalCount";
		Long totalCount = sqlSessionTemplate.selectOne(statement,u_uuid);
		return totalCount;
	}

	public List<Lease> selectPageLeaseBike(Map<String, Object> pageMap) {
		String statement = "com.bike.Mapper.LeaseMapper.selectPageLeaseBike";
		List<Lease> lease = sqlSessionTemplate.selectList(statement,pageMap);
		return lease;
	}

}
