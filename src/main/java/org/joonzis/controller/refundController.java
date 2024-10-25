package org.joonzis.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;



@Log4j
@Controller
@RequestMapping("/refund/*")
public class refundController {
	
	
//	@Autowired
//	private GameService refundservice;
	
	
	//game entrance page open.
	@GetMapping("/refundDetail")
	public String entrance(@RequestParam("mno") int mno, Model model) {
		log.info("refund.......");
		
		
		model.addAttribute("mno", mno);
		return "/refund/refund";
	}
	
	
	
	
	
	
	

}
