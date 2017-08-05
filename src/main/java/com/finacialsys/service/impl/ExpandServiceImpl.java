package com.finacialsys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finacialsys.mapper.ExpandMapper;
import com.finacialsys.model.dto.Page;
import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.Log;
import com.finacialsys.model.entity.SumMoney;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.ExpandService;

@Service
public class ExpandServiceImpl implements ExpandService {
	
	@Autowired
	private ExpandMapper expandMapper;
	
	
	
	@Override
	public int establishExpand(Expand expand) {
		
		return expandMapper.insertExpand(expand);
	}
	

	@Override
	public int resetPlan(int planID) {
		// TODO Auto-generated method stub
		return expandMapper.resetPlan(planID);
	}


	@Override
	public int removeExpand(int outID) {
		
		return expandMapper.deleteExpand(outID);
	}

	@Override
	public int editExpand(Expand expand) {
		
		return expandMapper.updateExpand(expand);
	}

	@Override
	public List<Expand> getExpandByUserID(String userID) {
		
		return expandMapper.findExpandByID(userID);
	}

	@Override
	public List<Expand> getExpandByGroupID(int groupID) {
		
		return expandMapper.findExpandByGroup(groupID);
	}

	@Override
	public List<Expand> getExpandByLogID(Expand expand) {
		
		return expandMapper.findExpandByLog(expand);
	}
	
	@Override
	public Page getItems(int current,String userID) {
		Page page = new Page(current);
		int count = expandMapper.countExpand(userID);
		page.setCount(count);
		int offset = page.getOffset();
		int size = page.getSize();
		System.out.println("offset: "+offset+" size:"+size+"userID"+userID);
		List<Expand> items = expandMapper.showPage(offset,size, userID);
		System.out.println(items);
		page.setList(items);
		return page;
	}

	@Override
	public Page getItemsByID(int current, String userID, int groupID) {
		// TODO Auto-generated method stub
		Page page = new Page(current);
		int count = expandMapper.countByEXGID(userID,groupID);
		page.setCount(count);
		int offset = page.getOffset();
		int size = page.getSize();
		System.out.println("offset: "+offset+" size:"+size+"userID"+userID);
		List<Expand> items = expandMapper.showPageByGroupID(offset,size, userID, groupID);
		System.out.println(items);
		page.setList(items);
		return page;
	}
	
	@Override
	public Double sumExpandInLog(SumMoney sumMoney) {
		
		return expandMapper.SumExpandInLog(sumMoney);
	}


//	@Override
//	public String sumExpand(SumMoney sumMoney) {
//		
//		return expandMapper.SumExpand(sumMoney);
//	}
//
//	@Override
//	public String sumExpandInLog(SumMoney sumMoney) {
//		
//		return expandMapper.SumExpandInLog(sumMoney);
//	}

	
	/*
	@Override
	public Expand displayExpandInPlan(int planID) {
		
		Expand expand = expandMapper.findByPlanID(planID);
		if( null == expand ){
			
			throw new RuntimeException("该计划暂无支出项");
		}
		else{
			
			return expand;
		}
	}
	*/

}
