package com.bike.Dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bike.Constant.GlobalConstants;
import com.bike.Dao.LeaseDao;
import com.bike.Dto.Bike;
import com.bike.Dto.Lease;
import com.bike.Dto.Site;

@Repository
public class LeaseDaoImpl implements LeaseDao {

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int leaseBike(Map<String,Object> leaseMap) {
		int l_uuid = 0;
		String getBikeById = "com.bike.Mapper.BikeMapper.getBikeById";
		String getSiteById = "com.bike.Mapper.BikeMapper.getSiteById";
		String leaseBike = "com.bike.Mapper.LeaseMapper.leaseBike";
		String updateBike = "com.bike.Mapper.LeaseMapper.updateBike_leaseBike";
		String updateSite = "com.bike.Mapper.LeaseMapper.updateSite_leaseBike";
		Map<String,Object> bikeMap = new HashMap<String,Object>();
		String b_uuid = (String) leaseMap.get("b_uuid");
		Bike bike = sqlSessionTemplate.selectOne(getBikeById, b_uuid);
		String s_uuid = bike.getSite().getS_uuid();
		Site site = sqlSessionTemplate.selectOne(getSiteById, s_uuid);
		bikeMap.put("b_status",GlobalConstants.bike_using_status);
		bikeMap.put("b_uuid",leaseMap.get("b_uuid"));
		bikeMap.put("s_uuid",GlobalConstants.bike_using_nosite);
		
		try{
			sqlSessionTemplate.insert(leaseBike,leaseMap);
			l_uuid = Integer.parseInt(leaseMap.get("l_uuid").toString());
			sqlSessionTemplate.update(updateBike,bikeMap);
			sqlSessionTemplate.update(updateSite,site);
			return l_uuid;
		}catch(Exception e){
			e.printStackTrace();
			if(l_uuid != 0){
				rollback(l_uuid);
			}
			return 0;
		}
	}

	@Override
	public String returnBike(Map<String, Object> returnMap) {
		String getSiteById = "com.bike.Mapper.BikeMapper.getSiteById";
		Site site = sqlSessionTemplate.selectOne(getSiteById, returnMap.get("s_uuid"));
		String returnBike = "com.bike.Mapper.LeaseMapper.returnBike";
		String updateBike = "com.bike.Mapper.LeaseMapper.updateBike_returnBike";
		String updateSite = "com.bike.Mapper.LeaseMapper.updateSite_returnBike";
		Map<String,Object> bikeMap = new HashMap<String,Object>();
		bikeMap.put("b_status",GlobalConstants.bike_free_status);
		bikeMap.put("b_uuid",returnMap.get("b_uuid"));
		bikeMap.put("s_uuid",returnMap.get("s_uuid"));
		
		try{
			sqlSessionTemplate.update(updateBike,bikeMap);
			sqlSessionTemplate.update(updateSite,site);
			sqlSessionTemplate.update(returnBike,returnMap);
			return "yes";
		}catch(Exception e){
			e.printStackTrace();
			rollback(1);
			return "error";
		}
	}
	
	
	
	public List<Lease> getLeaseBikeByUUID(int l_uuid){
		String statement = "com.bike.Mapper.LeaseMapper.getLeaseBikeByUUID";
		List<Lease> lease = sqlSessionTemplate.selectList(statement,l_uuid);
		return lease;
	}
	
	public List<Lease> getLeaseBike(int u_uuid){
		String statement = "com.bike.Mapper.LeaseMapper.getLeaseBike";
		List<Lease> lease = sqlSessionTemplate.selectList(statement,u_uuid);
		return lease;
	}
	
	public void rollback(int l_uuid){
		String statement = "com.bike.Mapper.LeaseMapper.deleteLeaseBike";
		sqlSessionTemplate.delete(statement, l_uuid);
	}

}
