package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.dto.Page;
import com.finacialsys.model.entity.Income;


public interface IncomeService {
	
	int establishIncome(Income income);
	
	int removeIncome(int inID);
	
	int editIncome(Income income);
	
	int resetPlan(int planID);
	
	List<Income> getIncomeByUserID(String userID);
	
	List<Income> getIncomeByGroupID(int groupID);
	
	List<Income> getIncomeByLogID(Income income);
	
	Page getItems(int current, String userID);
	Page getItemsByID(int current, String userID, int groupID);
	
//	
//	String sumIncome(SumMoney sumMoney);
//	
//	String sumIncomeInLog(SumMoney sumMoney);
//	
}
