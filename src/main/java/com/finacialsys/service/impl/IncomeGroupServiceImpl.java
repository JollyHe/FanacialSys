package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.IncomeGroupMapper;
import com.finacialsys.model.dto.Page;
import com.finacialsys.model.entity.ExpandGroup;
import com.finacialsys.model.entity.IncomeGroup;
import com.finacialsys.service.IncomeGroupService;

@Service
public class IncomeGroupServiceImpl implements IncomeGroupService {

	@Autowired
	private IncomeGroupMapper inGroupMapper;

	@Override
	public int establishIncomeGroup(IncomeGroup incomeGroup) {

		return inGroupMapper.insertInGroup(incomeGroup);
	}

	@Override
	public int removeIncomeGroup(int ingroupID) {

		return inGroupMapper.deleteInGroup(ingroupID);
	}

	@Override
	public int editIncomeGroup(IncomeGroup incomeGroup) {
		
		return inGroupMapper.updateInGroup(incomeGroup);
	}

	@Override
	public List<IncomeGroup> getIncomeGroup(String userID) {
		
		return inGroupMapper.findInGroupByID(userID);
	}

	@Override
	public Page getItems(int current, String userID) {
		// TODO Auto-generated method stub
		Page page = new Page(current);
		int count = inGroupMapper.count(userID);
		page.setCount(count);
		int offset = page.getOffset();
		int size = page.getSize();
		System.out.println("offset: "+offset+" size:"+size+"userID"+userID);
		List<IncomeGroup> items = inGroupMapper.showPage(offset,size, userID);
		System.out.println(items);
		page.setList(items);
		return page;
	}

	@Override
	public IncomeGroup getOtherGroup(String userID) {
		// TODO Auto-generated method stub
		return inGroupMapper.findOtherGroup(userID);
	}

}
