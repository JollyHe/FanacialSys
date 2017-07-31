package com.finacialsys.service;

import java.util.List;

import com.finacialsys.model.dto.Page;
import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.Log;
import com.finacialsys.model.entity.User;
import com.finacialsys.model.dto.Page;

public interface ExpandService {

	int establishExpand(Expand expand);
	
	int removeExpand(int outID);
	
	int editExpand(Expand expand);
	
	List<Expand> getExpandByUserID(String userID);
	
	List<Expand> getExpandByGroupID(int groupID);
	
	List<Expand> getExpandByLogID(Expand expand);
	
	
	Page getItems(int current, String userID);
	
//	String sumExpand(SumMoney sumMoney);
//	
//	String sumExpandInLog(SumMoney sumMoney);
//	
}
