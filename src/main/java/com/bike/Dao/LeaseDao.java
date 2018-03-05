package com.bike.Dao;

import java.util.List;
import java.util.Map;

import com.bike.Dto.Lease;

public interface LeaseDao {

	public int leaseBike(Map<String,Object> map);
	
	public String returnBike(Map<String,Object> map);
	
	public List<Lease> getLeaseBikeByUUID(int l_uuid);
	
	public List<Lease> getLeaseBike(int u_uuid);
	
}
