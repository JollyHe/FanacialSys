package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.DetailMapper;
import com.finacialsys.model.entity.Detail;
import com.finacialsys.service.DetailService;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailMapper detailMapper;

	@Override
	public int establishPlanDetail(Detail detail) {
		
		return detailMapper.insertDetail(detail);
	}

	@Override
	public int removePlanDetail(int detailID) {
		
		return detailMapper.deleteDetail(detailID);
	}

	@Override
	public int editPlanDetail(Detail detail) {
		
		return detailMapper.updateDetail(detail);
	}

	@Override
	public List<Detail> getPlanDetail(int planID) {
		
		return detailMapper.findDetailByPlanID(planID);
	}

	@Override
	public Detail getDetailByID(int detailID) {
		// TODO Auto-generated method stub
		return detailMapper.getDetailByID(detailID);
	}

	@Override
	public Detail getLogDetail(Detail detail) {
		
		return detailMapper.findDetailByPlanLog(detail);
	}

	@Override
	public int removeDetails(int planID) {
		// TODO Auto-generated method stub
		return detailMapper.removeDetails(planID);
	}

}
