package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.entity.Expand;

public interface ExpandService {

	int establishExpand(Expand expand);
	
	int removeExpand(int outID);
	
	int editExpand(Expand expand);
	
	List<Expand> getExpandByUserID(String userID);
	
	List<Expand> getExpandByGroupID(int groupID);
	
	List<Expand> getExpandByLogID(Expand expand);
	
	/*
	Expand getExpandInPlan(int planID);
	*/
}
