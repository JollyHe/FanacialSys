package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.UserGroupMapper;
import com.finacialsys.mapper.UserMapper;
import com.finacialsys.model.entity.Level;
import com.finacialsys.model.entity.User;
import com.finacialsys.model.entity.UserGroup;
import com.finacialsys.service.UserGroupService;

@Service
public class UserGroupServiceImpl implements UserGroupService {

	@Autowired
	private UserGroupMapper userGroupMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User establishUserGroup(String userID, UserGroup userGroup) {
		
		User user = userMapper.findByID(userID);
		System.out.println("find by id "+user);
		Level level = new Level();
		level.setLevelID(2);
		user.setLevel(level);
		userMapper.updateUserLevel(user);
		userGroup.setGroupSum(1);
		userGroup.setGroupID( userID );
		userGroupMapper.insertUserGroup(userGroup);
		userMapper.updateUserGroupID(userID, userID);
		user = userMapper.findByID(userID);
		System.out.println("find by id after"+user);
		return user;
	}

	@Override
	public int removeUserGroup(String groupID) {
	
		UserGroup userGroup = userGroupMapper.findByGroupID(groupID);
		System.out.println(userGroup);
		int sum = userGroupMapper.SumGroupMember(groupID);
		List<User> user = userGroup.getUsers();
		for(int i = 0; i < sum; i++){

			User userWithNullGroupID = user.get(i);
			Level level = new Level();
			level.setLevelID(3);
			userWithNullGroupID.setLevel(level);
			userMapper.updateUserLevel(userWithNullGroupID);
			String userID = userWithNullGroupID.getUserID();
			userMapper.updateUserGroupID(null, userID);
		}
		return userGroupMapper.deleteUserGroup(groupID);
	}

	@Override
	public int editUserGroup(UserGroup userGroup) {
		
		return userGroupMapper.updateUserGroup(userGroup);
	}

	@Override
	public UserGroup getUserGroup(String groupID) {
		
		return userGroupMapper.findByGroupID(groupID);
	}

	@Override
	public UserGroup sumGroupMember(String groupID) {
		
		UserGroup userGroup = userGroupMapper.findByGroupID(groupID);
		userGroup.setGroupSum( userGroupMapper.SumGroupMember(groupID) );
		return userGroup;	
	}

	@Override
	public UserGroup addMember(String userID, String groupID) {
		
		userMapper.updateUserGroupID(groupID, userID);
		UserGroup userGroup = userGroupMapper.findByGroupID(groupID);
		userGroup.setGroupSum(userGroupMapper.SumGroupMember(groupID));
		userGroupMapper.updateUserGroup(userGroup);
		System.out.println(userGroup);
		return userGroup;
	}

	@Override
	public UserGroup deductMember(String userID, String groupID) {
		
		userMapper.updateUserGroupID(null, userID);
		UserGroup userGroup = userGroupMapper.findByGroupID(groupID);
		userGroup.setGroupSum(userGroupMapper.SumGroupMember(groupID));
		userGroupMapper.updateUserGroup(userGroup);
		System.out.println(userGroup);
		return userGroup;
	}


}
