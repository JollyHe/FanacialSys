package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.ExpandGroupMapper;
import com.finacialsys.model.entity.ExpandGroup;
import com.finacialsys.service.ExpandGroupService;

@Service
public class ExpandGroupServiceImpl implements ExpandGroupService {

	@Autowired
	private ExpandGroupMapper exGroupMapper;
	
	@Override
	public int establishExpandGroup(ExpandGroup expandGroup) {
		
		return exGroupMapper.insertOutGroup(expandGroup);
	}

	@Override
	public int removeExpandGroup(int outgroupID) {
		
		return exGroupMapper.deleteOutGroup(outgroupID);
	}

	@Override
	public int editExpandGroup(ExpandGroup expandGroup) {
		
		return exGroupMapper.updateOutGroup(expandGroup);
	}

	@Override
	public List<ExpandGroup> getExpandGroup(String userID) {
		
		return exGroupMapper.findOutGroupByID(userID);
	}

	
}
