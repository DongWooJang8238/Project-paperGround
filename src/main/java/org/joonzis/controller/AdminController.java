package org.joonzis.controller;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UserVO;
import org.joonzis.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;



@Log4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	
	@Autowired
	private AdminService adminservice;
	
	
	@GetMapping("/adminEntrance")
	public String entrance(@RequestParam("mno") int mno, Model model) {
		log.info("adminEntrance.......");
		if(mno != 1) {
			return "/";
		}
		model.addAttribute("mno", mno);
		return "/admin/adminEntrance";
	}
	
	@GetMapping("/userList")
	public String userList(Model model ,Criteria cri) {
		log.warn("userList........................");
		//make some
		if(cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(100);
		}
		int total = adminservice.getUserTotal();
		log.info(total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", adminservice.getUserList(cri));
		log.info(adminservice.getUserList(cri));

		return "/admin/userList";
	}
	
	@GetMapping("/userCut")
	public String userCut(@RequestParam("mno") int mno, Model model) {
		log.warn("cutcutcut........................");
		model.addAttribute("mno", mno);
		return "/admin/userList";
	}
	
	@PostMapping("/changeRole")
	@ResponseBody
	public ResponseEntity<String> changeRole(@RequestBody UserVO uservo, Model model) {
		//받고있는 데이터 = userId, username, role
		log.warn("userRenewuserRenew........................");
		int result = 0;
		if(uservo.getUserId().equals("admin")) {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}else {
			result = adminservice.changeRole(uservo);			
			log.warn(result);
			return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
		}
		
		
	}
	
	
	@GetMapping("/scriptList")
	public String scriptList(   Model model) {
		log.warn("scriptList........................");
		return "/admin/scriptList";
	}
	@GetMapping("/scriptCut")
	public String scriptCut(@RequestParam("mno") int mno, Model model) {
		log.warn("scriptCutscriptCut........................");
		model.addAttribute("mno", mno);
		return "/admin/scriptList";
	}
	@GetMapping("/scriptRenew")
	public String scriptRenew(@RequestParam("mno") int mno, Model model) {
		log.warn("scriptRenewscriptRenew........................");
		model.addAttribute("mno", mno);
		return "/admin/scriptList";
	}
	
	@GetMapping("/dataList")
	public String dataList( Model model) {
		log.warn("scriptList........................");
		return "/admin/dataList";
	}
	
	@GetMapping("/dataRenew")
	public String dataRenew(@RequestParam("mno") int mno, Model model) {
		log.warn("scriptRenewscriptRenew........................");
		model.addAttribute("mno", mno);
		return "/admin/dataList	";
	}
	
	
	
	

}
