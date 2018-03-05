package com.bike.Dao;

import java.util.List;
import java.util.Map;

import com.bike.Dto.Bike;
import com.bike.Dto.Lease;
import com.bike.Dto.Page;
import com.bike.Dto.Site;

public interface BikeDao {
	
	public Bike addBike(Bike bike);
	
	public  List<Bike> getBikeByUuid(int b_uuid);
	
	public  List<Bike> getBikeById(String b_id);
	
	public Page getAllBikeByPage(Map<String,Object> pageMap);
	
	public List<Bike> getBikeBySite(int s_uuid);
	
	public int countBike(String b_status);
	
	public Page countUsingBikeByTime(Map<String,Object> timeMap);
	
	public Page countOtherBike(Map<String,Object> bikeMap);
	
	public int launchBike(Map<String,Object> bikeMap,Site site);
	
	public int deleteBike(int b_uuid);
	
	public int fixBike(Map<String,Object> bikeMap,Site site);
	
	public int fixedBike(Map<String,Object> bikeMap);
	
}
