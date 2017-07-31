package com.finacialsys.controller;

import java.util.List;

import javax.jws.soap.SOAPBinding.Use;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.ExpandGroupService;
import com.finacialsys.service.ExpandService;
import com.finacialsys.service.IncomeGroupService;
import com.finacialsys.service.IncomeService;
import com.finacialsys.model.dto.Page;

@Controller
public class FinacialShowController {
	
	@Autowired
	private ExpandService expandService;
	@Autowired
	private IncomeService incomeService;
	@Autowired
	private ExpandGroupService expandGroupService;
	@Autowired
	private IncomeGroupService incomeGroupService;
	
	
	@RequestMapping(value="/expandShow", method=RequestMethod.GET)
	public String showExpand(@RequestParam(name="current", defaultValue="1") int current,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = expandService.getItems(current, user.getUserID());
		System.out.println(page);
		model.addAttribute("page", page);		
		return "expandShow";
	}
	
	@RequestMapping(value="/expandShow/removeExpand/{p}/{id}", method=RequestMethod.GET)
	public String removeExpand(@PathVariable(name="p") int current,@PathVariable(name="id") int id)
	{
		expandService.removeExpand(id);
		System.out.println("hhlo");
		return "redirect:/expandShow?current=" + current;
	}
	
	@RequestMapping(value="/incomeShow", method=RequestMethod.GET)
	public String showIncome(@RequestParam(name="current", defaultValue="1") int current,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = incomeService.getItems(current, user.getUserID());
		System.out.println(page);
		model.addAttribute("page", page);		
		return "incomeShow";
	}
	
	@RequestMapping(value="/incomeShow/removeIncome/{p}/{id}", method=RequestMethod.GET)
	public String removeIncome(@PathVariable(name="p") int current,@PathVariable(name="id") int id)
	{
		incomeService.removeIncome(id);
		System.out.println("hhlo");
		return "redirect:/incomeShow?current=" + current;
	}

}
