package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.ExpandGroup;

public interface ExpandGroupMapper {
   
	List<ExpandGroup> findOutGroupByID(String userID);
	int insertOutGroup(ExpandGroup expandGroup);
	int deleteOutGroup(int outgroupID);
	int updateOutGroup(ExpandGroup expandGroup);
	
}
