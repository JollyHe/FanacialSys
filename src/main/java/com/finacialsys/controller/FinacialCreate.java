package com.finacialsys.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FinacialCreate {
	@RequestMapping(value="/finacialCreate", method=RequestMethod.GET)
	public String finacialCreate(){
		return "finacialCreate";
	}
}
