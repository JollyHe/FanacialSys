//package com.finacialsys.service.impl;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.finacialsys.mapper.UserMapper;
//import com.finacialsys.model.entity.User;
//import com.finacialsys.service.LevelService;
//
//@Service
//public class LevelServiceImpl implements LevelService {
//	
//	@Autowired
//	private UserMapper userMapper;
//
//	@Override
//	public User setLevel(String userID, int levelID) {
//		
//		User user = userMapper.findByID(userID);
//		if( null == user ){
//			
//			throw new RuntimeException("用户名不存在");
//		}
//		else{
//			
//			userMapper.setLevelID(levelID);
//			return user;
//		}
//		return null;
//	}
//
//	@Override
//	public int getLevel(String userID) {
//		
//		User user = userMapper.findByID(userID);
//		if( null == user ){
//			
//			throw new RuntimeException("用户名不存在");
//		}
//		else{
//			
//			return userMapper.getLevelID(userID);
//		}
//		return 0;
//	}
//
//}
