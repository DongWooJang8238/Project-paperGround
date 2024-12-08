package org.joonzis.controller;



import java.util.Map;

import org.joonzis.domain.BoardVO;
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
	public String entrance( Model model) {
		log.info("adminEntrance.......");
		
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
	
	@PostMapping("/userCut")
	@ResponseBody
	public ResponseEntity<String> userCut(@RequestBody String userId, Model model) {
		log.warn("cutcutcut........................");
		int result = 0;
		log.warn(userId);
		if(userId.equals("admin")) {
			log.warn(userId);
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}else {
			result =adminservice.userCut(userId);
			log.warn(userId);
			log.warn(result);
			return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
		}

	}
	
	@PostMapping("/scriptCut")
	@ResponseBody
	public ResponseEntity<String> scriptCut(@RequestBody String boardno, Model model) {
		log.warn("scriptCut........................");
		
		int result = 0;
		int bno=0;
		
        bno = Integer.parseInt(boardno);
        log.warn(bno);
    
		result = adminservice.scriptCut(bno);
		log.warn(result);
		
		return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 

		
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
	public String scriptList(Model model,Criteria cri) {
		log.warn("scriptList........................");
		if(cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(20);
		}
		int total = adminservice.getAllListTotal();
		log.warn("스크립트 리스트 : " +total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", adminservice.getAllList(cri));
		
		return "/admin/scriptList";
	}
	
	@GetMapping("/scriptCategoryList")
	public String scriptCategoryList(@RequestParam String category,   Model model, Criteria cri) {
		log.warn("scriptCategoryList........................");
		if(cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(20);
		}
		int total = adminservice.getCategoryListTotal(category);
		
		log.warn("카테고리 : " + total);
		cri.setCategory(category);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", adminservice.getCategoryList(cri));
		
		return "/admin/scriptList";
		
		
	}	
	

}
