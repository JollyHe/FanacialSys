package com.finacialsys.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.ExpandGroupMapper;
import com.finacialsys.model.dto.Page;
import com.finacialsys.model.entity.Expand;
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
	public ExpandGroup getOtherGroup(String userID) {
		// TODO Auto-generated method stub
		return exGroupMapper.findOtherGroup(userID);
	}

	@Override
	public Page getItems(int current, String userID) {
		// TODO Auto-generated method stub
		Page page = new Page(current);
		int count = exGroupMapper.count(userID);
		page.setCount(count);
		int offset = page.getOffset();
		int size = page.getSize();
		System.out.println("offset: "+offset+" size:"+size+"userID"+userID);
		List<ExpandGroup> items = exGroupMapper.showPage(offset,size, userID);
		System.out.println(items);
		page.setList(items);
		return page;
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
