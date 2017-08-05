package com.finacialsys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.model.entity.Level;
import com.finacialsys.model.entity.User;
import com.finacialsys.model.entity.UserGroup;
import com.finacialsys.mapper.LevelMapper;
import com.finacialsys.mapper.UserGroupMapper;
import com.finacialsys.mapper.UserMapper;
import com.finacialsys.service.LoginService;
import com.finacialsys.service.UserGroupService;

@Service
public class LoginServiceImpl implements LoginService {


	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private UserGroupMapper userGroupMapper;
	
	@Autowired LevelMapper levelMapper;
	
	@Override
	public User login(String userID, String password) {
		
		User user = userMapper.findByID(userID);
	
		if( null == user ){
			
			throw new RuntimeException("用户名不存在");
			
		}else if ( ! password.equals( user.getUserPassword() ) ) {
			
			throw new RuntimeException("密码错误");
		}
		Level level = levelMapper.getLevel(userID);
		user.setLevel(level);
		UserGroup userGroup = user.getUserGroup();
		if(null != userGroup) {
			String id = userGroup.getGroupID();
			user.setUserGroup(userGroupMapper.findByGroupID(id));
		}		
		System.out.println(user);
		return user;
	}


	@Override
	public User logout() {
		
		return null;
	}


	@Override
	public int register(User user) {
		// TODO Auto-generated method stub
		int count = userMapper.insertUser(user);
		return count;
	}
	
	

}
