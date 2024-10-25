package org.joonzis.controller;

import java.util.Random;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.chatRoomDTO;
import org.joonzis.domain.usedBookImgVO;
import org.joonzis.service.UsedShopService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/used")
public class UsedShopController {
	
	@Autowired
	UsedShopService service;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/list")
	public String goList(Criteria cri, Model model) {
		
		log.warn("list 컨트롤러 : " + cri);
		log.warn("컨트롤러 장르 번호 : " + cri.getGener());
		
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		
		
			int total = service.getTotal();
			log.info("total..." + total);
			
			model.addAttribute("list", service.getuBookList(cri));
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		return "/usedShop/usedShopList";
	}
	
	@GetMapping("/goInsert")
	public String goInsert() {
		log.warn("컨트롤러 중고상품등록페이지 이동..");
		return "usedShop/usedShopInsert";
	}
	
	@PostMapping("/insert")
	public String usedShopInsert(UsedBookVO vo) {
		log.warn("컨트롤러 중고상품등록..." + vo);
		if(vo.getUsedBookImgs() != null) {
			for (usedBookImgVO ubivo : vo.getUsedBookImgs()) {
				log.warn("컨트롤러 중고상품 이미지 : " + ubivo.getUbookimage());
			}
		}
		// 중고상품 등록 ( 대표이미지 = 리스트에 뿌려줄 이미지 )
		int result = service.usedShopInsert(vo);
		log.warn("컨트롤러 중고상품 등록 확인.." + result);
		return "redirect:/used/list?genre=0&pageNum=1&amount=10";
	}
	
	@GetMapping("/goGet")
	public String usedShopGoGet(int ubno, Model model) {
		
		log.warn("컨트롤러 중고 상품 보기 : " + ubno);
		UsedBookVO vo = service.getuBookOne(ubno);
		
		Random ran = new Random();
		int ranNum = ran.nextInt(10)+1;
		
		model.addAttribute("ubvo", vo);
		model.addAttribute("sellUser", userService.userSelectOne(vo.getMno()));
		model.addAttribute("ranNum", ranNum);
		
		return "usedShop/usedShopGet";
	}
	
	@GetMapping("/test")
	public String chatTest(int ubno, int sellmno, int buymno, Model model) {
		
		log.warn("ubno : " + ubno);
		log.warn("sellmno : " + sellmno);
		log.warn("buymno : " + buymno);
		chatRoomDTO chat = new chatRoomDTO();
		chat.setUbno(ubno);
		chat.setSellmno(sellmno);
		chat.setBuymno(buymno);
		model.addAttribute("numbers", chat);
		return "/test";
	}
}
