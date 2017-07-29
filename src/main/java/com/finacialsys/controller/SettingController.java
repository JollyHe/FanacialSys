package com.finacialsys.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.finacialsys.model.entity.User;
import com.finacialsys.service.LoginService;
import com.finacialsys.service.SettingService;
@Controller
public class SettingController {
	@Autowired
	private SettingService settingService;
	@RequestMapping(value="/userSetting", method=RequestMethod.GET)
	public String userSetting(HttpSession session){

		return "userSetting";
	}
	@RequestMapping(value="/userSetting", method=RequestMethod.POST)
	public String updateUser(User user,HttpSession session,HttpServletRequest request,Model model,  MultipartFile file){
		System.out.println("i coming");
		User olduser = (User)session.getAttribute("user");
		olduser.setUserPassword(user.getUserPassword());
		olduser.setUserGender(user.getUserGender());
		olduser.setUserNickname(user.getUserNickname());
		olduser.setUserAddress(user.getUserAddress());
		System.out.println(olduser);
		String path = request.getServletContext().getRealPath("/assets/img");
		System.out.println( "path=" + path);
		
		String fileName = UUID.randomUUID() + file.getOriginalFilename();
		File f = new File(path, fileName);
		try {
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		olduser.setUserPic(fileName);
		System.out.println(olduser);
		int count = settingService.updateUser(olduser);
		System.out.println(count);
		if(count != 1) {
			System.out.println("修改失败");
			return "userSetting";
		} else {
			System.out.println("修改成功");
			model.addAttribute("user",olduser);
			return "redirect:/home";
		}
		
	}
}
