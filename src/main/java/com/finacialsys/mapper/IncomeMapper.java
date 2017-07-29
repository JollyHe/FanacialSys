package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.Income;

public interface IncomeMapper {
	
	List<Income> findIncomeByID(String userID);
	List<Income> findIncomeByGroup(int groupID);
	List<Income> findIncomeByLog(Income income);
	int insertIncome(Income income);
	int deleteIncome(int incomeID);
	int updateIncome(Income income);
}
