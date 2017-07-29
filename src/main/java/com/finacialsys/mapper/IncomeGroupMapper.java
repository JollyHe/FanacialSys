package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.IncomeGroup;

public interface IncomeGroupMapper {
	List<IncomeGroup> findInGroupByID(String userID);
	int insertInGroup(IncomeGroup incomeGroup);
	int deleteInGroup(int ingroupID);
	int updateInGroup(IncomeGroup incomeGroup);
}
