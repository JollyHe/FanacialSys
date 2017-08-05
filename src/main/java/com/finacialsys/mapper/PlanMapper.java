package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.Plan;

public interface PlanMapper {
   
	List<Plan> findPlanByUserID(String userID);
	int insertPlan(Plan plan);
	int updatePlan(Plan plan);
	int deletePlan(int planID);
	Plan getPlanByID(int planID);
	Plan getPlanByDetailID(int detailID);
}
