package com.finacialsys.mapper;

import java.util.List;

import com.finacialsys.model.entity.Expand;

public interface ExpandMapper {

	List<Expand> findExpandByID(String userID);
	List<Expand> findExpandByGroup(int groupID);
	List<Expand> findExpandByLog(Expand expand);
	int insertExpand(Expand expand);
	int deleteExpand(int outID);
	int updateExpand(Expand expand);
}
