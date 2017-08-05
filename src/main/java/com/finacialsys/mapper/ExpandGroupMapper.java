package com.finacialsys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finacialsys.model.entity.ExpandGroup;

public interface ExpandGroupMapper {
   
	List<ExpandGroup> findOutGroupByID(String userID);
	List<ExpandGroup> showPage(@Param("offset")int offset,@Param("size") int size, @Param("userID")String userID);
	ExpandGroup findOtherGroup(String userID);
	int insertOutGroup(ExpandGroup expandGroup);
	int deleteOutGroup(int outgroupID);
	int updateOutGroup(ExpandGroup expandGroup);
	int count(String userID);
	
}
