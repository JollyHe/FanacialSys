package com.finacialsys.mapper;

import org.apache.ibatis.annotations.Param;

import com.finacialsys.model.entity.User;

public interface UserMapper {

	User findByID(String userID);
	int insertUser(User user);
	int updateUser(User user);
	int delete(String userID);
	int updateUserGroupID(@Param("groupID")String groupID, @Param("userID")String userID);
	int updateUserLevel(User user);
	
}

