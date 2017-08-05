package com.finacialsys.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finacialsys.mapper.UserGroupMapper;
import com.finacialsys.model.entity.Level;
import com.finacialsys.model.entity.User;
import com.finacialsys.model.entity.UserGroup;
import com.finacialsys.service.UserGroupService;
import com.finacialsys.service.UserService;

@Controller
public class userGroupController {
	@Autowired
	UserGroupService userGroupService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/userGroup", method=RequestMethod.GET)
	public String toUserGroup(){
		
		return "userGroup";
	}
	
	@RequestMapping(value="/createUserGroup", method=RequestMethod.POST)
	public String createUserGroup(UserGroup userGroup,HttpSession session){
		User user = (User)session.getAttribute("user");
		user = userGroupService.establishUserGroup(user.getUserID(), userGroup);
		System.out.println(user);
		session.setAttribute("user", user);
		return "redirect:/userGroup";
	}
	
	@RequestMapping(value="/removeUserGroup", method=RequestMethod.POST)
	public String removeUserGroup(UserGroup userGroup,HttpSession session){
		Level level = new Level();
		level.setLevelID(3);
		userGroupService.removeUserGroup(userGroup.getGroupID());
		User user = (User)session.getAttribute("user");
		user.setUserGroup(null);
		user.setLevel(level);
		session.setAttribute("user", user);
		return "redirect:/userGroup";
	}
	@RequestMapping(value="/editUserGroup", method=RequestMethod.POST)
	public String editUserGroup(UserGroup userGroup,HttpSession session){
		User user = (User)session.getAttribute("user");
		String userGroupID = user.getUserGroup().getGroupID();
		UserGroup olduserGroup = userGroupService.getUserGroup(userGroupID);
		olduserGroup.setGroupName(userGroup.getGroupName());
		olduserGroup.setGroupMsg(userGroup.getGroupMsg());
		userGroupService.editUserGroup(olduserGroup);
		user.setUserGroup(olduserGroup);
		session.setAttribute("user", user);
		return "redirect:/userGroup";
	}
	
//	@RequestMapping(value="/addMember", method=RequestMethod.POST)
//	public String addMember(User member,HttpSession session){
//		User user = (User)session.getAttribute("user");
//		UserGroup userGroup = userGroupService.addMember(member.getUserID(), user.getUserGroup().getGroupID());
//		user.setUserGroup(userGroup);
//		session.setAttribute("user", user);
//		System.out.println(user);
//		return "redirect:/userGroup";
//	}
	
	@RequestMapping(value="/addMember", method=RequestMethod.GET)
	public @ResponseBody User addMember(String userID,HttpSession session){
		try {
			User user = (User)session.getAttribute("user");
			if(userService.getUserInformation(userID) == null) {
				System.out.println("不存在该用户");
				User users = new User();
				users.setUserID(null);
				users.setUserPic("123");
				return users;
			} else if( userService.getUserInformation(userID).getUserGroup() != null || user.getUserID().equals(userID)) {
				System.out.println("我不返回users");
				User users = new User();
				users.setUserID(null);
				return users;
			}  else {
				System.out.println("我要返回users");
				UserGroup userGroup = userGroupService.addMember(userID, user.getUserGroup().getGroupID());
				user.setUserGroup(userGroup);
				session.setAttribute("user", user);
				System.out.println("啦啦啦"+user);
				System.out.println(userID);
				User users = userService.getUserInformation(userID);
				users.setUserGroup(userGroup);
				System.out.println(users);
				return users;
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
		
	}
	
	@RequestMapping(value="/removeMember/{id}", method=RequestMethod.GET)
	public @ResponseBody String removeExpand(@PathVariable(name="id") String id,HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		UserGroup userGroup = userGroupService.deductMember(id, user.getUserGroup().getGroupID());
		user.setUserGroup(userGroup);
		session.setAttribute("user", user);
		System.out.println(user);
		return "ok";
	}
//	@RequestMapping(value="/removeMember/{id}", method=RequestMethod.GET)
//	public String removeExpand(@PathVariable(name="id") String id,HttpSession session)
//	{
//		User user = (User)session.getAttribute("user");
//		UserGroup userGroup = userGroupService.deductMember(id, user.getUserGroup().getGroupID());
//		user.setUserGroup(userGroup);
//		session.setAttribute("user", user);
//		System.out.println(user);
//		return "redirect:/userGroup";
//	}
	
	@RequestMapping(value="/signOutUserGroup", method=RequestMethod.POST)
	public String signOutUserGroup(HttpSession session)
	{
		User user = (User)session.getAttribute("user");
		userGroupService.deductMember(user.getUserID(), user.getUserGroup().getGroupID());
		user.setUserGroup(null);
		session.setAttribute("user", user);
		System.out.println(user);
		return "redirect:/userGroup";
	}
}
