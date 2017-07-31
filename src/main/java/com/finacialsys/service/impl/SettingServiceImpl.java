package com.finacialsys.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.finacialsys.model.entity.User;
import com.finacialsys.mapper.UserMapper;
import com.finacialsys.service.SettingService;

@Service
public class SettingServiceImpl implements SettingService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}



}
