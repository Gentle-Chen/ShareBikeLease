package com.bike.Thread;

import java.util.HashMap;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.bike.Constant.GlobalConstants;
import com.bike.Dao.BikeDao;

public class BikeJobBean {
	
	private static Logger logger = LogManager.getLogger(BikeJobBean.class);
	
	@Autowired
	BikeDao bikeDao;
	
	public void updateBike(){    
		Map<String,Object> bikeMap = new HashMap<String,Object>();
		bikeMap.put("status", GlobalConstants.bike_fixing_status);
		bikeMap.put("b_status", GlobalConstants.bike_idle_status);
		int i = bikeDao.fixedBike(bikeMap);
		logger.debug("SBLS->成功修理" + i + "辆单车");
    } 

}
