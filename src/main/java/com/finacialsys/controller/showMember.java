package com.finacialsys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finacialsys.model.dto.Page;
import com.finacialsys.service.ExpandGroupService;
import com.finacialsys.service.ExpandService;
import com.finacialsys.service.IncomeGroupService;
import com.finacialsys.service.IncomeService;
import com.finacialsys.service.LogService;

@Controller
public class showMember {
	@Autowired
	private ExpandService expandService;
	@Autowired
	private IncomeService incomeService;
	@Autowired
	private ExpandGroupService expandGroupService;
	@Autowired
	private IncomeGroupService incomeGroupService;
	@Autowired
	private LogService logService;
	
	@RequestMapping(value="/showMemberExpand", method=RequestMethod.GET)
	public String showMember(@RequestParam(name="current", defaultValue="1") int current,@RequestParam(name="memberID", defaultValue="1") String id, Model model){	
		System.out.println("id"+id);
		Page page = expandService.getItems(current, id);
		model.addAttribute("page", page);	
		model.addAttribute("memberID", id);
		return "showMemberExpand";
	}
	
	@RequestMapping(value="/showMemberIncome", method=RequestMethod.GET)
	public String showMemberIncome(@RequestParam(name="current", defaultValue="1") int current,@RequestParam(name="memberID", defaultValue="1") String id, Model model){	
		System.out.println("id"+id);
		Page page = incomeService.getItems(current, id);
		model.addAttribute("page", page);	
		model.addAttribute("memberID", id);
		return "showMemberIncome";
	}
	
	@RequestMapping(value="/showMemberExpandGroup", method=RequestMethod.GET)
	public String showMemberExpandGroup(@RequestParam(name="current", defaultValue="1") int current,@RequestParam(name="memberID", defaultValue="1") String id, Model model){	
		System.out.println("id"+id);
		Page page = expandGroupService.getItems(current, id);
		model.addAttribute("page", page);	
		model.addAttribute("memberID", id);
		return "showMemberEXG";
	}
	@RequestMapping(value="/showMemberExpandGroupDetails", method=RequestMethod.GET)
	public String showMemberEGDetails(@RequestParam(name="groupID", defaultValue="1") int groupID,@RequestParam(name="memberID", defaultValue="1") String id, Model model){	
		System.out.println("id"+id);
		Page page = expandService.getItemsByID(1,id, groupID);
		model.addAttribute("page", page);	
		model.addAttribute("memberID", id);
		return "showMemberExpand";
	}
	@RequestMapping(value="/showMemberIncomeGroup", method=RequestMethod.GET)
	public String showMemberIncomeGroup(@RequestParam(name="current", defaultValue="1") int current,@RequestParam(name="memberID", defaultValue="1") String id, Model model){	
		System.out.println("id"+id);
		Page page = incomeGroupService.getItems(current, id);
		model.addAttribute("page", page);	
		model.addAttribute("memberID", id);
		return "showMemberING";
	}
	@RequestMapping(value="/showMemberIncomeGroupDetails", method=RequestMethod.GET)
	public String showMemberINGetails(@RequestParam(name="groupID", defaultValue="1") int groupID,@RequestParam(name="memberID", defaultValue="1") String id, Model model){	
		System.out.println("id"+id);
		Page page = incomeService.getItemsByID(1,id, groupID);
		model.addAttribute("page", page);	
		model.addAttribute("memberID", id);
		return "showMemberIncome";
	}
}
