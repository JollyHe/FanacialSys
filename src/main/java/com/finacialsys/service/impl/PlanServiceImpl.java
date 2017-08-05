package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.DetailMapper;
import com.finacialsys.mapper.ExpandMapper;
import com.finacialsys.mapper.IncomeMapper;
import com.finacialsys.mapper.PlanMapper;
import com.finacialsys.model.entity.Detail;
import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.Income;
import com.finacialsys.model.entity.Log;
import com.finacialsys.model.entity.Plan;
import com.finacialsys.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {

	@Autowired
	private PlanMapper planMapper;
	
	@Autowired
	private ExpandMapper expandMapper;
	
	@Autowired
	private IncomeMapper incomeMapper;
	
	@Autowired
	private DetailMapper detailMapper;
		
	@Override
	public int establishPlan(Plan plan) {
		
		return planMapper.insertPlan(plan);
	}

	@Override
	public int removePlan(int planID) {

		return planMapper.deletePlan(planID);
	}

	@Override
	public int editPlan(Plan plan) {
		
		return planMapper.updatePlan(plan);
	}

	@Override
	public List<Plan> getPlan(String userID) {
		
		return planMapper.findPlanByUserID(userID);
	}

	@Override
	public Plan getPlanByDetailID(int detailID) {
		// TODO Auto-generated method stub
		return planMapper.getPlanByDetailID(detailID);
	}

	@Override
	public Plan getPlanByID(int planID) {
		// TODO Auto-generated method stub
		return planMapper.getPlanByID(planID);
	}

	@Override
	public float calculateDifference(int planID, Log log) {
		
		float differenceMoney;
		
		List<Detail> details = detailMapper.findDetailByPlanID(planID);
		float detailMoney = 0;
		for(Detail detail: details) {
			Log _log = detail.getLog();
			if ( _log.getLogID() == log.getLogID() ) {
				detailMoney += detail.getDetailMoney();
			}
		}
		
		List<Expand> expands = expandMapper.findExpandByPlan(planID);
		float expandMoney = 0;
		for(Expand expand: expands) {
			Log _log = expand.getLog();
			if ( _log.getLogID() == log.getLogID() ) {
				expandMoney += expand.getOutMoney();
			}
		}
		
		List<Income> incomes = incomeMapper.findIncomeByPlan(planID);
		float incomeMoney = 0;
		for(Income income: incomes) {
			Log _log = income.getLog();
			if ( _log.getLogID() == log.getLogID() ) {
				incomeMoney += income.getInMoney();
			}
		}
		
		differenceMoney = detailMoney - expandMoney + incomeMoney;
		return differenceMoney;
	}

	@Override
	public float calculatePercent(int planID, Log log) {
		
		float percent;
		
		List<Detail> details = detailMapper.findDetailByPlanID(planID);
		float detailMoney = 0;
		float detailSumMoney = 0;
		for(Detail detail: details) {
			detailSumMoney += detail.getDetailMoney();
			if ( detail.getLog().getLogID() == log.getLogID() ) {
				detailMoney += detail.getDetailMoney();
			}
		}
		
		percent = detailMoney / detailSumMoney;
		return percent;
	}

	@Override
	public List<Expand> getExpandInPlan(int planID) {
		
		return expandMapper.findExpandByPlan(planID);
	}

	@Override
	public List<Income> getIncomeInPlan(int planID) {
		
		return incomeMapper.findIncomeByPlan(planID);
	}

	
}
