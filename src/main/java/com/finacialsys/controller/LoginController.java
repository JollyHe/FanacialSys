package com.finacialsys.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finacialsys.model.entity.Level;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.LoginService;
@Controller
public class LoginController {

	@Autowired
	public LoginService loginService;
	
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public String toIndex(HttpSession session){
		if(session.getAttribute("user")!=null)
			return "redirect:/logout";
		return "index";
	}
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String toHome(HttpSession session){
		return "home";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String get(HttpSession session){
		if(session.getAttribute("user")!=null)
			return "redirect:/logout";
		return "login";
	}
	
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String reg(HttpSession session){
		if(session.getAttribute("user")!=null)
			return "redirect:/logout";
		return "register";
	}
		
	@RequestMapping( value="/login", method=RequestMethod.POST )
	public String login( String username, String password, HttpSession session, Model model ) {
		
		try {
			
			User user = loginService.login( username, password );
			session.setAttribute( "user", user );
			return "home";
			
		}catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute( "msg", e.getMessage() );
			
		}
		return "login";
	}
	
	@RequestMapping( value="/logout", method=RequestMethod.GET )
	public String logout( HttpSession session, Model model ) {
		
		try {
			
			loginService.logout();
			session.invalidate();
			
		}catch (Exception e) {
			e.printStackTrace();
			model.addAttribute( "msg", "登出失败" );
		}
		return "redirect:/index";
	}
	
	@RequestMapping( value="/register",method=RequestMethod.POST )
	public String register(User user,Model model){
		
		try {
			System.out.println(user);
			user.setLevel(new Level());
			System.out.println(user);
			user.setUserPic("qq.png");
			int count = loginService.register(user);
			if(count == 1) {
				System.out.println("插入成功");
			} else {
				System.out.println("插入失败");
			}
			return "redirece:/login";
			
		}catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute( "msg", e.getMessage() );
			
		}
		
		return "register";
	}
}
