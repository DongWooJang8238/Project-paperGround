package org.joonzis.controller;



import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;



@Log4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	
//	@Autowired
//	private AdminService adminservice;
	
	@GetMapping("/adminEntrance")
	public String entrance(@RequestParam("mno") int mno, Model model) {
		log.info("refund.......");
		if(mno != 1) {
			return "/";
		}
		model.addAttribute("mno", mno);
		return "/admin/adminEntrance";
	}
	
	@GetMapping("/userList")
	public String userList(@RequestParam("mno") int mno, Model model) {
		log.warn("cutcutcut........................");
		model.addAttribute("mno", mno);
		return "/admin/userList";
	}
	
	@GetMapping("/userCut")
	public String userCut(@RequestParam("mno") int mno, Model model) {
		log.warn("cutcutcut........................");
		model.addAttribute("mno", mno);
		return "/admin/userCut";
	}
	
	
	
	
	
	
	

}
