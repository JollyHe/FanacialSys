package com.finacialsys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.UserMapper;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public User getUserInformation(String userID) {
		
		return userMapper.findByID(userID);
	}
	
	

}
