package com.bike.Thread;


import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.sun.istack.internal.logging.Logger;

public class DynamicCronTask extends QuartzJobBean{
	
	Logger logger = Logger.getLogger(DynamicCronTask.class);

	
	
	private BikeJobBean bikeJobBean;   
	    
	  @Override  
	    protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {    
		  bikeJobBean.updateBike();
	    }    
	    
	    public void setEBankJobBean(BikeJobBean bikeJobBean) {    
	        this.bikeJobBean = bikeJobBean;    
	    }    
	
	

}
