package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.Income;
import com.finacialsys.model.entity.Log;
import com.finacialsys.model.entity.Plan;

public interface PlanService {

	int establishPlan(Plan plan);
	
	int removePlan(int planID);
	
	int editPlan(Plan plan);
	
	List<Plan> getPlan(String userID);
	
	List<Expand> getExpandInPlan(int planID);
	
	List<Income> getIncomeInPlan(int planID);
	
	float calculateDifference(int planID, Log log);
	
	float calculatePercent(int planID, Log log);
	
	Plan getPlanByID(int planID);
	
	Plan getPlanByDetailID(int detailID);
}
