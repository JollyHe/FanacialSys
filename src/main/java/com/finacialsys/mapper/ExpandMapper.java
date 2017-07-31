package com.finacialsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finacialsys.model.entity.Expand;

public interface ExpandMapper {
	List<Expand> findExpandByID(String userID);
	List<Expand> findExpandByGroup(int groupID);
	List<Expand> findExpandByLog(Expand expand);
	List<Expand> showPage(@Param("offset")int offset,@Param("size") int size, @Param("userID")String userID);
	int insertExpand(Expand expand);
	int deleteExpand(int outID);
	int updateExpand(Expand expand);
	int count(String userID);
}
