package org.joonzis.controller;

import java.util.List;

import org.joonzis.domain.ChatRoomDTO;
import org.joonzis.domain.ChattingDTO;
import org.joonzis.domain.Criteria;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
		String checkGener = null;
		// gener이 null이 아닌 경우
		if(cri.getGener() != null) {
			log.warn("generOne : " + cri.getGener()[0]);
			checkGener = "" + cri.getGener()[0];
			
			for (int i = 1; i < cri.getGener().length; i++) {
				log.warn("generTwo : " + cri.getGener()[i]);
				checkGener += "," + cri.getGener()[i];
				log.warn("generCheck : " + checkGener);
			}
			model.addAttribute("checkCategorys", checkGener);
		}
		log.warn("generCheckFinal : " + checkGener);
		
		if(cri.getSelectValue() != null) {
			log.warn("검색 옵션 : " + cri.getSelectOption());
			log.warn("검색 내용 : " + cri.getSelectValue());
				
			String returnValue = cri.getSelectValue();
			String selectValue = "%" + cri.getSelectValue() + "%";
			cri.setSelectValue(selectValue);
			log.warn("검색 옵션 : " + cri.getSelectOption());
			log.warn("검색 내용 : " + cri.getSelectValue());
	
			model.addAttribute("selectValue", returnValue);
		
		}
		
		model.addAttribute("list", service.getuBookList(cri));
			
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
		return "redirect:/used/list?pageNum=1&amount=10";
	}
	
	@GetMapping("/goGet")
	public String usedShopGoGet(int ubno, int mno, Model model) {
		
		log.warn("컨트롤러 중고 상품 보기 : " + ubno);
		log.warn("컨트롤러 중고 상품 보기 : " + mno);
		UsedBookVO ubvo = service.getuBookOne(ubno);
		if(mno > 0) {
			UsedBookVO vo = new UsedBookVO();
			vo.setMno(mno);
			vo.setUbno(ubno);
			
			// 찜 기록 불러오기
			model.addAttribute("wish", service.selectWishList(vo));
		}else {
			model.addAttribute("wish", 0);
		}
		
		model.addAttribute("ubvo", ubvo);
		model.addAttribute("sellUser", userService.userSelectOne(ubvo.getMno()));
		model.addAttribute("uservo", userService.userSelectOne(mno));
		
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
	
	@ResponseBody
	@GetMapping(value = "chatHistory/{chatno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ChattingDTO>> loadChatHistory(@PathVariable("chatno") int chatno){
		
		List<ChattingDTO> list = service.getChattingContent(chatno);
		for (ChattingDTO dto : list) {
			log.warn(dto.getContent());
		}
		
		return list != null ? new ResponseEntity<List<ChattingDTO>>(list, HttpStatus.OK) : new ResponseEntity<List<ChattingDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	@ResponseBody
	@GetMapping(value = "chatHistoryBuy/{ubno}/{buymno}/{sellmno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ChattingDTO>> loadChatHistoryBuy(@PathVariable("ubno") int ubno, @PathVariable("buymno") int buymno, @PathVariable("sellmno") int sellmno){
		
		log.warn("구매자 넘어온 데이터 1 : " + ubno);
		log.warn("구매자 넘어온 데이터 2 : " + buymno);
		log.warn("구매자 넘어온 데이터 3 : " + sellmno);
		
		ChatRoomDTO chat = new ChatRoomDTO();
		chat.setUbno(ubno);
		chat.setBuymno(buymno);
		chat.setSellmno(sellmno);
		int chatno = service.getChattingNumber(chat);
		
		List<ChattingDTO> list = service.getChattingContent(chatno);
		for (ChattingDTO dto : list) {
			log.warn(dto.getContent());
		}
		
		return list != null ? new ResponseEntity<List<ChattingDTO>>(list, HttpStatus.OK) : new ResponseEntity<List<ChattingDTO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	// 찜하기 기능
	@ResponseBody
	@PostMapping(value = "/wishList", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> wishList(@RequestBody UsedBookVO vo){
		log.warn("찜하기 컨트롤러 넘어온 데이터 : " + vo);
		log.warn("찜하기 컨트롤러 넘어온 데이터 : " + vo.getMno());
		log.warn("찜하기 컨트롤러 넘어온 데이터 : " + vo.getUbno());
		int selectWishList = service.selectWishList(vo);
		if(selectWishList > 0) {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
		int result = service.insertWishList(vo);
		
		return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 찜 삭제하기 기능
	@ResponseBody
	@PostMapping(value = "/unWishList", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> unWishList(@RequestBody UsedBookVO vo){
		log.warn("찜하기 컨트롤러 넘어온 데이터 : " + vo);
		log.warn("찜하기 컨트롤러 넘어온 데이터 : " + vo.getMno());
		log.warn("찜하기 컨트롤러 넘어온 데이터 : " + vo.getUbno());
		
		int result = service.deleteWishList(vo);
		
		log.warn("찜 삭제 결과" + result);
		
		return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 거래 완료 처리 ( 수정 )
	@ResponseBody
	@PostMapping(value = "/successSell", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> successSell(@RequestBody int ubno){
		log.warn("거래 완료 컨트롤러 넘어온 데이터 : " + ubno);
		int result = service.successSell(ubno);
		log.warn("거래 완료 컨트롤러 처리 결과 : " + result);
		
		return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 삭제 처리
	@ResponseBody
	@PostMapping(value = "/deleteUbook", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteUbook(@RequestBody int ubno){
		log.warn("중고 상품 삭제 컨트롤러 넘어온 데이터 : " + ubno);
		int result = service.deleteUbook(ubno);
		log.warn("중고 상품 삭제 컨트롤러 처리 결과 : " + result);
		
		return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
