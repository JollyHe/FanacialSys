package com.finacialsys.mapper;

import com.finacialsys.model.entity.User;

public interface UserMapper {

	User findByID(String userID);
	int insertUser(User user);
	int updateUser(String userID);
	int delete(User user);
	
}
