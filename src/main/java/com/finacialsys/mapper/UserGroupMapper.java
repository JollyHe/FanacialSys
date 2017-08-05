package com.finacialsys.mapper;

import com.finacialsys.model.entity.UserGroup;

public interface UserGroupMapper {

	UserGroup findByGroupID(String groupID);
	int insertUserGroup(UserGroup userGroup);
	int deleteUserGroup(String groupID);
	int updateUserGroup(UserGroup userGroup);
	int SumGroupMember(String groupID);
}
