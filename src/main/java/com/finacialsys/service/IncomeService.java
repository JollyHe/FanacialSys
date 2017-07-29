package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.entity.Income;

public interface IncomeService {
	
	int establishIncome(Income income);
	
	int removeIncome(int inID);
	
	int editIncome(Income income);
	
	List<Income> getIncomeByUserID(String userID);
	
	List<Income> getIncomeByGroupID(int groupID);
	
	List<Income> getIncomeByLogID(Income income);
	
	/*
	Income getIncomeInPlan(int planID);
	*/
}
