package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.entity.ExpandGroup;

public interface ExpandGroupService {

	int establishExpandGroup(ExpandGroup expandGroup);
	
	int removeExpandGroup(int outgroupID);
	
	int editExpandGroup(ExpandGroup expandGroup);
	
	List<ExpandGroup> getExpandGroup(String userID);
	
}
