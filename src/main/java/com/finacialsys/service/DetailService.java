package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.entity.Detail;

public interface DetailService {

	int establishPlanDetail(Detail detail);
	
	int removePlanDetail(int detailID);
	
	int editPlanDetail(Detail detail);
	
	List<Detail> getPlanDetail(int planID);
	
	Detail getLogDetail(Detail detail);
	
	int removeDetails(int planID);
	
	Detail getDetailByID(int detailID);
}
