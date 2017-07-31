package com.finacialsys.mapper;

import com.finacialsys.model.entity.Plan;

public interface PlanMapper {
   
	Plan findPlanByUserID(String userID);
	int insertPlan(Plan plan);
	int updatePlan(Plan plan);
	int deletePlan(int planID);
}
