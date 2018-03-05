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
		logger.debug("定时任务[修理单车]完成，返回结果：" + i + "条");
    } 

}
