package org.joonzis.controller;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.joonzis.domain.ChatRoomDTO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.usedBookImgVO;
import org.joonzis.service.UsedShopService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		ChatRoomDTO chat = new ChatRoomDTO();
		chat.setUbno(ubno);
		chat.setSellmno(sellmno);
		chat.setBuymno(buymno);
		model.addAttribute("numbers", chat);
		return "/test";
	}
	
	@ResponseBody
	@GetMapping(value = "/sellChat/{ubno}/{mno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ChatRoomDTO>> myChattingList(@PathVariable("ubno") int ubno, @PathVariable("mno") int mno){
		log.warn("넘어 온 데이터 1 : " + ubno);
		log.warn("넘어 온 데이터 2 : " + mno);
		
		ChatRoomDTO chat = new ChatRoomDTO();
		chat.setUbno(ubno);
		chat.setSellmno(mno);
		
		List<ChatRoomDTO> list = service.selectSellChatRoomList(chat);
		for (ChatRoomDTO dto : list) {
			log.warn("구매자 정보 조회를 위한 buymno : " + dto.getBuymno());
			UserVO vo = userService.userSelectOne(dto.getBuymno());
			log.warn("구매자 정보 조회 결과 닉네임 : " + vo.getNickName());
			dto.setUserName(vo.getNickName());
		}
		
		for (int i = 0; i < list.size(); i++) {
			log.warn("구매자 번호 : " + list.get(i).getBuymno());
			log.warn("구매자 이름 : " + list.get(i).getUserName());
		}
		return list != null ? new ResponseEntity<List<ChatRoomDTO>>(list, HttpStatus.OK) : new ResponseEntity<List<ChatRoomDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
