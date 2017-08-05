package com.finacialsys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finacialsys.mapper.LogMapper;
import com.finacialsys.model.entity.Detail;
import com.finacialsys.model.entity.Expand;
import com.finacialsys.model.entity.Log;
import com.finacialsys.model.entity.Plan;
import com.finacialsys.model.entity.PlanDetails;
import com.finacialsys.model.entity.User;
import com.finacialsys.model.entity.PlanMsg;
import com.finacialsys.service.DetailService;
import com.finacialsys.service.ExpandService;
import com.finacialsys.service.IncomeService;
import com.finacialsys.service.LogService;
import com.finacialsys.service.PlanService;

@Controller
public class PlanController {
	
	@Autowired
	private PlanService planService;
	@Autowired
	private ExpandService expandService;
	@Autowired
	private IncomeService incomeService;
	@Autowired
	private LogService logService;
	@Autowired
	private DetailService detailService;
	
	@RequestMapping(value="/plan", method=RequestMethod.GET)
	public String toPlan(HttpSession session,Model model){
		User user = (User)session.getAttribute("user");
		model.addAttribute("logs", logService.getLogs());
		List<Plan> plans = planService.getPlan(user.getUserID());
		if(plans.isEmpty())
		{
			model.addAttribute("plans", null);
		}
		model.addAttribute("plans", plans);
		return "plan";
	}
	
	@RequestMapping(value="/createPlan", method=RequestMethod.POST)
	public String createPlan(Plan plan,HttpSession session){
		User user = (User)session.getAttribute("user");
		plan.setUser(user);
		System.out.println(plan);
		planService.establishPlan(plan);
		return "redirect:/plan";
	}
	
	@RequestMapping(value="/editPlan", method=RequestMethod.POST)
	public String editPlan(Plan plan,HttpSession session){
		User user = (User)session.getAttribute("user");
		plan.setUser(user);
		System.out.println(plan);
		planService.editPlan(plan);
		return "redirect:/plan";
	}
	
	@RequestMapping(value="/removePlan", method=RequestMethod.POST)
	public String removePlan(int[] checked,HttpSession session){
		User user = (User)session.getAttribute("user");
		for (int i : checked) {
			detailService.removeDetails(i);
			expandService.resetPlan(i);
			incomeService.resetPlan(i);
			planService.removePlan(i);
		}
		return "redirect:/plan";
	}
	
	@RequestMapping(value="/createDetail", method=RequestMethod.GET)
	public @ResponseBody PlanMsg createDetail(Detail detail){
		PlanMsg planMsg = new PlanMsg();
		Plan plan = planService.getPlanByID(detail.getPlan().getPlanID());
		Log log = logService.findLogByID(detail.getLog().getLogID());	
		List<Detail> details = new ArrayList<Detail>();
		detail.setLog(log);
		if (plan.getPlanMoney() - detail.getDetailMoney() >= 0) {
			plan.setPlanMoney(plan.getPlanMoney() - detail.getDetailMoney());
			planService.editPlan(plan);
			detailService.establishPlanDetail(detail);
			details = detailService.getPlanDetail(plan.getPlanID());
			planMsg.setSumMoney(plan.getPlanMoney());
			planMsg.setDetails(details);
			System.out.println("details:"+details);
			return planMsg;
		} else {
			planMsg.setDetails(null);
			return planMsg;
		}
		
	}
	@RequestMapping(value="/removeDetail", method=RequestMethod.GET)
	public @ResponseBody PlanMsg removeDetail(int detailID){
		
		PlanMsg planMsg = new PlanMsg();
		Plan plan = planService.getPlanByDetailID(detailID);
		Detail detail = detailService.getDetailByID(detailID);
		System.out.println("detailID"+detailID);
		System.out.println("plan:"+plan);
		System.out.println("detail:"+detail);
		plan.setPlanMoney(plan.getPlanMoney()+detail.getDetailMoney());
		planService.editPlan(plan);
		planMsg.setSumMoney(plan.getPlanMoney());
		detailService.removePlanDetail(detailID);
		System.out.println("删除后的planMsg"+planMsg);
		return planMsg;
		
	}
	@RequestMapping(value="/changePlan", method=RequestMethod.GET)
	public @ResponseBody PlanMsg changePlan(int planID){
		Plan plan = planService.getPlanByID(planID);
		List<Detail> details =  detailService.getPlanDetail(planID);
		PlanMsg planMsg = new PlanMsg();
		planMsg.setSumMoney(plan.getPlanMoney());
		planMsg.setDetails(details);
		return planMsg;
	}
	@RequestMapping(value="/changeUpdatePlan", method=RequestMethod.GET)
	public @ResponseBody Plan changeUpdatePlan(int planID){
		Plan plan = planService.getPlanByID(planID);
		return plan;
	}
	
	@RequestMapping(value="/showPlanDetails", method=RequestMethod.GET)
	public @ResponseBody PlanDetails showPlanDetails(int planID){
		PlanDetails planDetails = new PlanDetails();
		List<Log> logs = logService.getLogs();
		for (Log log : logs) {
			float diff = planService.calculateDifference(planID, log);
			System.out.println("diff"+diff);
			planDetails.getDiff().put(log.getLogName(), diff);
		}
		System.out.println(planDetails);
		return planDetails;
	}
	
	
	
}
