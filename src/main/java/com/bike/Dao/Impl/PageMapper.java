package com.bike.Dao.Impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bike.Dto.Bike;

public interface PageMapper {
	
	Long selectBikeTotalCount();
	
	List<Bike> selectPageBike(@Param("startNum") int startNum , @Param("pageSize") int pageSize);

}
