package com.finacialsys.service;

import com.finacialsys.model.entity.User;
import com.finacialsys.model.entity.UserGroup;

public interface UserGroupService {

	User establishUserGroup(String userID, UserGroup userGroup);
	
	int removeUserGroup(String groupID);
	
	int editUserGroup(UserGroup userGroup);
	
	UserGroup getUserGroup(String groupID);
	
	UserGroup addMember(String userID, String groupID);
	
	UserGroup deductMember(String userID, String groupID);
		
	UserGroup sumGroupMember(String groupID);
}
