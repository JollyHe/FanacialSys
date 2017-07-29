package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.IncomeGroupMapper;
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
	public int editExpandGroup(IncomeGroup incomeGroup) {
		
		return inGroupMapper.updateInGroup(incomeGroup);
	}

	@Override
	public List<IncomeGroup> getIncomeGroup(String userID) {
		
		return inGroupMapper.findInGroupByID(userID);
	}

}
