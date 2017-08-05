package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.dto.Page;
import com.finacialsys.model.entity.ExpandGroup;
import com.finacialsys.model.entity.IncomeGroup;

public interface IncomeGroupService {

	int establishIncomeGroup(IncomeGroup incomeGroup);
	
	int removeIncomeGroup(int ingroupID);
	
	int editIncomeGroup(IncomeGroup incomeGroup);
	
	List<IncomeGroup> getIncomeGroup(String userID);
	
	Page getItems(int current, String userID);
	
	IncomeGroup getOtherGroup(String userID);
}
