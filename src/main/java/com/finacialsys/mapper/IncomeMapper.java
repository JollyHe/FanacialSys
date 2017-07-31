package com.finacialsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finacialsys.model.entity.Income;

public interface IncomeMapper {
	
	List<Income> findIncomeByID(String userID);
	List<Income> findIncomeByGroup(int groupID);
	List<Income> findIncomeByLog(Income income);
	List<Income> showPage(@Param("offset")int offset,@Param("size") int size, @Param("userID")String userID);
	int insertIncome(Income income);
	int deleteIncome(int incomeID);
	int updateIncome(Income income);
	int count(String userID);
}
