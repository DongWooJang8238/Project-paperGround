package org.joonzis.controller;

import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@Autowired
	UserService service;
	
	@Autowired
	PasswordEncoder pwencoder;
	
	@GetMapping("/login")
	public String loginInput(String err, String logout, Model model) {
		log.info("error : " + err);
		log.info("logout : " + logout);
		
		if(err != null) {
			model.addAttribute("error", "Login Error Check your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}

		return "/login";
	}
	
	@GetMapping("/customLogout")
	public String customLogout() {
		log.warn("로..그..아..웃.. ( 도 적 나 가 )");
		return "/";
	}
}
