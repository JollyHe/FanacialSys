package com.finacialsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.SumMoney;

public interface ExpandMapper {
	List<Expand> findExpandByID(String userID);
	List<Expand> findExpandByGroup(int groupID);
	List<Expand> findExpandByLog(Expand expand);
	List<Expand> showPage(@Param("offset")int offset,@Param("size") int size, @Param("userID")String userID);
	List<Expand> showPageByGroupID(@Param("offset")int offset,@Param("size") int size, @Param("userID")String userID,@Param("groupID")int groupID);
	int insertExpand(Expand expand);
	int deleteExpand(int outID);
	int updateExpand(Expand expand);
	int countExpand(String userID);
	int countByEXGID(@Param("userID")String userID,@Param("groupID")int groupID);
	int resetPlan(int planID);
	List<Expand> findExpandByPlan(int planID);
	Double SumExpandInLog(SumMoney sumMoney);
}
