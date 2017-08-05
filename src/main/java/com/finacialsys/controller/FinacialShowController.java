package com.finacialsys.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.finacialsys.service.UserService;
import com.finacialsys.mapper.UserMapper;
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
	@Autowired
	private LogService logService;
	@Autowired
	private PlanService planService;


	
	@RequestMapping(value="/expandShow", method=RequestMethod.GET)
	public String showExpand(@RequestParam(name="current", defaultValue="1") int current,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = expandService.getItems(current, user.getUserID());
		model.addAttribute("page", page);		
		return "expandShow";
	}
	
	@RequestMapping(value="/expandShowDetails", method=RequestMethod.GET)
	public String showExpandDetails(@RequestParam(name="current", defaultValue="1") int current,@RequestParam(name="id", defaultValue="1") int id,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = expandService.getItemsByID(current, user.getUserID(),id);
		model.addAttribute("id", id);
		model.addAttribute("page", page);		
		return "expandShowDetails";
	}

	
	@RequestMapping(value="/showExpandGroupDetails/{p}/{id}", method=RequestMethod.GET)
	public String showExpandGroupDetails(@PathVariable(name="p") int current,@PathVariable(name="id") int id,Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		return "redirect:/expandShowDetails?current=" + current+"&id="+id;
	}
	
	@RequestMapping(value="/incomeShowDetails", method=RequestMethod.GET)
	public String showExpandDetail(@RequestParam(name="current", defaultValue="1") int current,@RequestParam(name="id", defaultValue="1") int id,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = incomeService.getItemsByID(current, user.getUserID(),id);
		model.addAttribute("id", id);
		model.addAttribute("page", page);		
		return "incomeShowDetails";
	}
	
	@RequestMapping(value="/showIncomeGroupDetails/{p}/{id}", method=RequestMethod.GET)
	public String showIncomeGroupDetails(@PathVariable(name="p") int current,@PathVariable(name="id") int id,Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("user");	
		return "redirect:/incomeShowDetails?current=" + current+"&id="+id;
	}
	
	@RequestMapping(value="/expandShow/removeExpand/{p}/{id}", method=RequestMethod.GET)
	public String removeExpand(@PathVariable(name="p") int current,@PathVariable(name="id") int id)
	{
		expandService.removeExpand(id);
		return "redirect:/expandShow?current=" + current;
	}
	
	@RequestMapping(value="/editExpand/{p}/{id}", method=RequestMethod.GET)
	public String toeditExpand(@PathVariable(name="p") int current,@PathVariable(name="id") int id,Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		Page page = expandService.getItems(current, user.getUserID());
		model.addAttribute("logs", logService.getLogs());
		model.addAttribute("groups", expandGroupService.getExpandGroup(user.getUserID()));
		model.addAttribute("current", current);
		model.addAttribute("id", id);
		model.addAttribute("page", page);
		model.addAttribute("plans", planService.getPlan(user.getUserID()));
		System.out.println(page);
		return "editExpand";
	}
	
	@RequestMapping(value="/editExpand/{p}/{id}", method=RequestMethod.POST)
	public String editExpand(@PathVariable(name="p") int current,@PathVariable(name="id") int id, Expand expand)
	{
		expand.setOutID(id);
		if(expand.getPlan().getPlanID() == 0)
			expand.setPlan(null);
		System.out.println("修改后的收入"+expand);
		expandService.editExpand(expand);
		return "redirect:/expandShow?current=" + current;
	}
	
	@RequestMapping(value="/incomeShow", method=RequestMethod.GET)
	public String showIncome(@RequestParam(name="current", defaultValue="1") int current,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = incomeService.getItems(current, user.getUserID());
		model.addAttribute("page", page);		
		return "incomeShow";
	}
	
	@RequestMapping(value="/incomeShow/removeIncome/{p}/{id}", method=RequestMethod.GET)
	public String removeIncome(@PathVariable(name="p") int current,@PathVariable(name="id") int id)
	{
		incomeService.removeIncome(id);
		return "redirect:/incomeShow?current=" + current;
	}
	@RequestMapping(value="/editIncome/{p}/{id}", method=RequestMethod.GET)
	public String toeditIncome(@PathVariable(name="p") int current,@PathVariable(name="id") int id,Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		Page page = incomeService.getItems(current, user.getUserID());
		model.addAttribute("logs", logService.getLogs());
		model.addAttribute("groups", incomeGroupService.getIncomeGroup(user.getUserID()));
		model.addAttribute("current", current);
		model.addAttribute("id", id);
		model.addAttribute("page", page);
		model.addAttribute("plans", planService.getPlan(user.getUserID()));
		System.out.println(page);
		return "editIncome";
	}
	
	@RequestMapping(value="/editIncome/{p}/{id}", method=RequestMethod.POST)
	public String editIncome(@PathVariable(name="p") int current,@PathVariable(name="id") int id, Income income)
	{

		income.setInID(id);
		if(income.getPlan().getPlanID() == 0)
			income.setPlan(null);
		System.out.println("修改后的收入"+income);
		incomeService.editIncome(income);
		return "redirect:/incomeShow?current=" + current;
	}
	@RequestMapping(value="/expandGroupShow", method=RequestMethod.GET)
	public String showExpandGroup(@RequestParam(name="current", defaultValue="1") int current,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = expandGroupService.getItems(current, user.getUserID());
		model.addAttribute("page", page);		
		return "expandGroupShow";
	}


	@RequestMapping(value="/expandGroupShow/removeExpandGroup/{p}/{id}", method=RequestMethod.GET)
	public String removeExpandGroup(@PathVariable(name="p") int current,@PathVariable(name="id") int id,HttpSession session){
		User user = (User)session.getAttribute("user");
		ExpandGroup other = expandGroupService.getOtherGroup(user.getUserID());
		List<Expand> expands =   expandService.getExpandByGroupID(id);
		for (Expand expand : expands) {
			expand.setExpandgroup(other);
			expand.setUser(user);
			expandService.editExpand(expand);
		}
		expandGroupService.removeExpandGroup(id);	
		return "redirect:/expandGroupShow?current=" + current;
	}
	
	@RequestMapping(value="/editExpandGroup/{p}/{id}", method=RequestMethod.GET)
	public String toeditExpandGroup(@PathVariable(name="p") int current,@PathVariable(name="id") int id,Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		Page page = expandGroupService.getItems(current, user.getUserID());
		model.addAttribute("groups", expandGroupService.getExpandGroup(user.getUserID()));
		model.addAttribute("current", current);
		model.addAttribute("id", id);
		System.out.println("id:"+id);
		model.addAttribute("page", page);
		System.out.println(page);
		return "editExpandGroup";
	}
	
	@RequestMapping(value="/editExpandGroup/{p}/{id}", method=RequestMethod.POST)
	public String editExpandGroup(@PathVariable(name="p") int current,@PathVariable(name="id") int id, ExpandGroup expandGroup)
	{
		System.out.println("我正在修改");
		System.out.println(expandGroup);
		expandGroup.setOutgroupID(id);
		expandGroupService.editExpandGroup(expandGroup);
		return "redirect:/expandGroupShow?current=" + current;
	}
	

	
	
	@RequestMapping(value="/incomeGroupShow", method=RequestMethod.GET)
	public String showIncomeGroup(@RequestParam(name="current", defaultValue="1") int current,HttpSession session, Model model){	
		User user = (User)session.getAttribute("user");
		Page page = incomeGroupService.getItems(current, user.getUserID());
		model.addAttribute("page", page);		
		return "incomeGroupShow";
	}
	
	@RequestMapping(value="/incomeGroupShow/removeIncomeGroup/{p}/{id}", method=RequestMethod.GET)
	public String removeIncomeGroup(@PathVariable(name="p") int current,@PathVariable(name="id") int id,HttpSession session){
		User user = (User)session.getAttribute("user");
		IncomeGroup other = incomeGroupService.getOtherGroup(user.getUserID());
		List<Income> incomes =   incomeService.getIncomeByGroupID(id);
		for (Income income : incomes) {
			income.setIncomegroup(other);
			income.setUser(user);
			incomeService.editIncome(income);
		}
		incomeGroupService.removeIncomeGroup(id);	
		return "redirect:/incomeGroupShow?current=" + current;
	}
	
	@RequestMapping(value="/editIncomeGroup/{p}/{id}", method=RequestMethod.GET)
	public String toeditIncomeGroup(@PathVariable(name="p") int current,@PathVariable(name="id") int id,Model model,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		Page page = incomeGroupService.getItems(current, user.getUserID());
		model.addAttribute("groups", incomeGroupService.getIncomeGroup(user.getUserID()));
		model.addAttribute("current", current);
		model.addAttribute("id", id);
		System.out.println("id:"+id);
		model.addAttribute("page", page);
		System.out.println(page);
		return "editIncomeGroup";
	}
	
	@RequestMapping(value="/editIncomeGroup/{p}/{id}", method=RequestMethod.POST)
	public String editIncomeGroup(@PathVariable(name="p") int current,@PathVariable(name="id") int id, IncomeGroup incomeGroup)
	{
		System.out.println("我正在修改");
		System.out.println(incomeGroup);
		incomeGroup.setIncomegroupID(id);
		incomeGroupService.editIncomeGroup(incomeGroup);
		return "redirect:/incomeGroupShow?current=" + current;
	}

}
