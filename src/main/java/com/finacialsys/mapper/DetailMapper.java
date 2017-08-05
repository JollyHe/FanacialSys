package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.Detail;

public interface DetailMapper {
   
	Detail findDetailByPlanLog(Detail detail);
	List<Detail> findDetailByPlanID(int planID);
	int updateDetail(Detail detail);
	int deleteDetail(int detailID);
	int insertDetail(Detail detail);
	int removeDetails(int planID);
	Detail getDetailByID(int detailID);
	
}
