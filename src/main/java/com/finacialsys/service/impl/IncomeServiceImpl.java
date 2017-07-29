package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.IncomeMapper;
import com.finacialsys.model.entity.Income;
import com.finacialsys.service.IncomeService;

@Service
public class IncomeServiceImpl implements IncomeService {

	@Autowired
	private IncomeMapper incomeMapper;

	@Override
	public int establishIncome(Income income) {
		
		return incomeMapper.insertIncome(income);
	}

	@Override
	public int removeIncome(int inID) {
		
		return incomeMapper.deleteIncome(inID);
	}

	@Override
	public int editIncome(Income income) {
		
		return incomeMapper.updateIncome(income);
	}

	@Override
	public List<Income> getIncomeByUserID(String userID) {

		return incomeMapper.findIncomeByID(userID);
	}

	@Override
	public List<Income> getIncomeByGroupID(int groupID) {
		
		return incomeMapper.findIncomeByGroup(groupID);
	}

	@Override
	public List<Income> getIncomeByLogID(Income income) {
		
		return incomeMapper.findIncomeByLog(income);
	}

	/*
	@Override
	public Income displayIncomeInPlan(int planID) {
		
		Income income = incomeMapper.findByPlanID(planID);
		if (null == income ){
			
			throw new RuntimeException("该计划暂无收入项");
		}
		else{
			
			return income;
		}
	}
	*/
	

}
