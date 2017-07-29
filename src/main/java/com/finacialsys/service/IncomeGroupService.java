package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.entity.IncomeGroup;

public interface IncomeGroupService {

	int establishIncomeGroup(IncomeGroup incomeGroup);
	
	int removeIncomeGroup(int ingroupID);
	
	int editExpandGroup(IncomeGroup incomeGroup);
	
	List<IncomeGroup> getIncomeGroup(String userID);
}
