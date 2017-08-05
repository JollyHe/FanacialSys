package com.finacialsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finacialsys.model.entity.IncomeGroup;

public interface IncomeGroupMapper {
	List<IncomeGroup> findInGroupByID(String userID);
	List<IncomeGroup> showPage(@Param("offset")int offset,@Param("size") int size, @Param("userID")String userID);
	IncomeGroup findOtherGroup(String userID);
	int insertInGroup(IncomeGroup incomeGroup);
	int deleteInGroup(int ingroupID);
	int updateInGroup(IncomeGroup incomeGroup);
	int count(String userID);
}
