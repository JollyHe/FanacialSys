package com.finacialsys.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finacialsys.mapper.PlanMapper;
import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.ExpandGroup;
import com.finacialsys.model.entity.Income;
import com.finacialsys.model.entity.IncomeGroup;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.ExpandGroupService;
import com.finacialsys.service.ExpandService;
import com.finacialsys.service.IncomeGroupService;
import com.finacialsys.service.IncomeService;
import com.finacialsys.service.LogService;
import com.finacialsys.service.PlanService;

@Controller
public class FinacialCreateController {
	@Autowired
	public LogService logService;
	
	@Autowired
	public ExpandService expandService;
	
	@Autowired
	public IncomeService incomeService;
	
	@Autowired
	public ExpandGroupService expandGroupService;
	
	@Autowired
	public IncomeGroupService incomeGroupService;
	
	@Autowired
	private PlanService planService;
	
	@RequestMapping(value="/finacialCreate", method=RequestMethod.GET)
	public String finacialCreate(){
		return "finacialCreate";
	}
	
	@RequestMapping(value="/createExpand", method=RequestMethod.GET)
	public String toCreateExpand(HttpSession session,Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("logs", logService.getLogs());
		model.addAttribute("groups", expandGroupService.getExpandGroup(user.getUserID()));
		model.addAttribute("plans", planService.getPlan(user.getUserID()));
		return "createExpand";
	}
	
	@RequestMapping(value="/createExpand", method=RequestMethod.POST)
	public String createExpand(Expand expand,HttpSession session){
		
		if(expand.getPlan().getPlanID() == 0)
			expand.setPlan(null);
		User user = (User)session.getAttribute("user");
		expand.setUser(user);
		expandService.establishExpand(expand);
		return "finacialCreate";
	}
	
	@RequestMapping(value="/createIncome", method=RequestMethod.GET)
	public String toCreateIncome(HttpSession session,Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("logs", logService.getLogs());
		model.addAttribute("groups", incomeGroupService.getIncomeGroup(user.getUserID()));
		model.addAttribute("plans", planService.getPlan(user.getUserID()));
		return "createIncome";
	}
	
	@RequestMapping(value="/createIncome", method=RequestMethod.POST)
	public String createIncome(Income income,HttpSession session){
		

		if(income.getPlan().getPlanID() == 0)
			income.setPlan(null);
		User user = (User)session.getAttribute("user");
		income.setUser(user);
		incomeService.establishIncome(income);
		return "finacialCreate";
	}
	

	@RequestMapping(value="/createExpandGroup", method=RequestMethod.GET)
	public String tocreateExpandGroup(){
		return "createExpandGroup";
	}
	
	@RequestMapping(value="/createExpandGroup", method=RequestMethod.POST)
	public String createExpandGroup(ExpandGroup expandGroup, HttpSession session){
		User user = (User)session.getAttribute("user");
		Date utilDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		expandGroup.setOutgroupTime(formatter.format(utilDate));
		expandGroup.setUser(user);
		expandGroupService.establishExpandGroup(expandGroup);
		return "finacialCreate";
	}
	
	@RequestMapping(value="/createIncomeGroup", method=RequestMethod.GET)
	public String tocreateIncomeGroup(){
		return "createIncomeGroup";
	}
	
	@RequestMapping(value="/createIncomeGroup", method=RequestMethod.POST)
	public String createIncomeGroup(IncomeGroup incomeGroup, HttpSession session){
		User user = (User)session.getAttribute("user");
		Date utilDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		incomeGroup.setIncomegroupTime(formatter.format(utilDate));
		incomeGroup.setUser(user);
		incomeGroupService.establishIncomeGroup(incomeGroup);
		return "finacialCreate";
	}
}









