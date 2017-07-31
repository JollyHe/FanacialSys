package com.finacialsys.controller;

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
	
	@RequestMapping(value="/finacialCreate", method=RequestMethod.GET)
	public String finacialCreate(){
		return "finacialCreate";
	}
	
	@RequestMapping(value="/createExpand", method=RequestMethod.GET)
	public String toCreateExpand(HttpSession session,Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("logs", logService.getLogs());
		model.addAttribute("groups", expandGroupService.getExpandGroup(user.getUserID()));
		return "createExpand";
	}
	
	@RequestMapping(value="/createExpand", method=RequestMethod.POST)
	public String createExpand(Expand expand,HttpSession session){
		System.out.println(expand);
		System.out.println("COMING");
		User user = (User)session.getAttribute("user");
		expand.setUser(user);
		System.out.println(expand);
		expandService.establishExpand(expand);
		return "finacialCreate";
	}
	
	@RequestMapping(value="/createIncome", method=RequestMethod.GET)
	public String toCreateIncome(HttpSession session,Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("logs", logService.getLogs());
		model.addAttribute("groups", incomeGroupService.getIncomeGroup(user.getUserID()));
		return "createIncome";
	}
	
	@RequestMapping(value="/createIncome", method=RequestMethod.POST)
	public String createIncome(Income income,HttpSession session){
		System.out.println(income);
		System.out.println("COMING");
		User user = (User)session.getAttribute("user");
		income.setUser(user);
		System.out.println(income);
		incomeService.establishIncome(income);
		return "finacialCreate";
	}
}
