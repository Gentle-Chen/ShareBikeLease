package com.bike.Dao;

import java.util.List;
import java.util.Map;

import com.bike.Dto.Bike;
import com.bike.Dto.Lease;
import com.bike.Dto.Site;

public interface PageDao {
	
	Long selectBikeTotalCount(Map<String, Object> pageMap);
	
	List<Bike> selectPageBike(Map<String,Object> pageMap);
	
	List<Site> selectPageSite(Map<String,Object> pageMap);
	
	List<Bike> countUsingBikeByTime(Map<String,Object> timeMap);
	
	Long selectSiteTotalCount();
	
	List<Bike> countOtherBike(Map<String, Object> bikeMap);
	
	Long selectLeaseBikeTotalCount(int u_uuid);
	
	List<Lease> selectPageLeaseBike(Map<String,Object> pageMap);

	

}
