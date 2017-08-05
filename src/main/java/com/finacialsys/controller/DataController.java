package com.finacialsys.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finacialsys.model.entity.LogMoney;
import com.finacialsys.model.entity.SumMoney;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.ExpandService;
import com.finacialsys.service.LogService;
import com.mchange.v2.encounter.StrongEqualityEncounterCounter;

@Controller
public class DataController {
	
	@Autowired
	ExpandService expandService;
	@Autowired
	LogService logService;
   
	@RequestMapping(value="/data", method=RequestMethod.GET)
	public String toData(){
		
		return "data";
	}
	
	@RequestMapping(value="/SelectMoney",method=RequestMethod.GET)
	public @ResponseBody LogMoney SelectMoney(@Param("HeadTime")String HeadTime,@Param("TailTime")String TailTime,HttpSession session) {

		User user = (User)session.getAttribute("user");
	    LogMoney data = new LogMoney();
		SumMoney sumMoney = new SumMoney();
		List<String> logName = new ArrayList<String>();
		List<Double> money = new ArrayList<Double>();
		sumMoney.setUserID(user.getUserID());
		sumMoney.setHeadTime(HeadTime);
		sumMoney.setTailTime(TailTime);
		for(int i = 1;i < 14;i++){
			sumMoney.setLogID(i);
			logName.add(logService.getLogName(i));
			if(expandService.sumExpandInLog(sumMoney) == null){
				money.add(0.00);
			}
			else{
				money.add(expandService.sumExpandInLog(sumMoney));
			}
		}
		for(Double m:money){
			if(m != 0){
				data.setLogName(logName);
				data.setMoney(money);
				break;
			}
			data.setLogName(null);
		}
		return data;
		
	}
}
