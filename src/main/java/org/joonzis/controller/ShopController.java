package org.joonzis.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joonzis.domain.BookBuyListVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.OrderBookListVO;
import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.SelectDTO;
import org.joonzis.domain.UserVO;
import org.joonzis.service.ShopService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
@RequestMapping("/shop/*")
public class ShopController {
	
	@Autowired
	private ShopService service;
	
	@Autowired
	private UserService uservice;

	//	// 쇼핑 리스트 이동
//	@GetMapping("/list")
//	public String list(Model model) {
//		log.info("쇼핑 리스트 목록..");
//
//		model.addAttribute("list", service.getBookList());
//		
//		log.info("쇼핑 리스트 결과.. : " + model);
//		
//		return "/shop/shopList";
//	}
	
	// 쇼핑 리스트 이동 ( 카테고리 선택 )
	@GetMapping("/listCe")
	public String list(Model model, Criteria cri) {
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
		
		int total = service.getTotalByGno(cri.getGener());
		log.info("total..." + total);
		
		// 1,2,3,4
		
		model.addAttribute("list", service.getBookList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "/shop/shopList";
	}
	
	// 쇼핑 리스트 이동 ( 페이징 / 카테고리 선택 )
	@GetMapping("/list")
	public String list(Criteria cri, Model model) {
		
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(20);
		}
		
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
		
		log.warn("컨트롤러 필터 타입3 : " + cri.getFilterType());
			int total = service.getTotal(cri);
			log.info("total..." + total);
			
		model.addAttribute("list", service.getBookList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "/shop/shopList";
	}
	
	// 쇼핑 리스트 이동 ( 검색 )
	@GetMapping("/listSelect")
	public String listSelect(String selectOption, String selectValue, Model model) {
		String returnValue = selectValue;
		selectValue = "%" + selectValue + "%";
		log.warn("검색 옵션 : " + selectOption);
		log.warn("검색 내용 : " + selectValue);
		SelectDTO sel = new SelectDTO(selectOption, selectValue);
		
	 	model.addAttribute("list", service.getBookListSelect(sel));
	 	model.addAttribute("selectValue", returnValue);
	 	model.addAttribute("selectOption", selectOption);
		return "/shop/shopList";
	}
//	@GetMapping("/goInsert")
//	public String shopGoInsert() {
//		log.warn("인서트 드가좌..");
//		return "/shop/shopGetInsert";
//	}
	
	@GetMapping("/insert")
	public String shopInsert(BookVO vo) {
		log.warn("인서트 드가좌.." + vo);
		int result = service.insertShopBook(vo);
		log.warn("인서트 결과 result...." + result);
		return "redirect:/shop/list";
	}
	
	// 인증된 사용자라면 true
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/goInsert")
	public String register2() {
		log.info("register...");

		return "/shop/shopGetInsert";
	}

	// 상품 보기 페이지 이동
	@GetMapping("/get")
	public String get(int bno, Model model) {
		log.info("상품 보기 페이지..");
		
		// 모델에 담기
		BookVO vo = service.getBookOne(bno);
		log.warn("평점" + vo.getAvgRating());
		log.warn("좋아요 수" + vo.getLikeCount());
		// 모델 결과
		model.addAttribute("bvo", vo);
//		model.addAttribute("bc", bookContent);
//		model.addAttribute("list", list);
		
		return "/shop/shopGet";
	}
	
	// 상품페이지 -> 구매 페이지 이동
	@GetMapping("/buy")
	public String buy(int mno, int bno, int count, Model model) {
		// 단일 데이터 구매
		log.warn("상품 구매 페이지.." + mno + bno);
		// bno로 상품 데이터 조회
		BookVO bvo = service.getBookOne(bno);
		// mno로 회원 데이터 조회
//		UserVO uvo = service.userSelectOne(mno);
		UserVO uvo = uservice.userSelectOne(mno);
		// 데이터들 모델에 담아서 페이지 이동
		model.addAttribute("bvo", bvo);
		model.addAttribute("count", count);
		model.addAttribute("uvo", uvo);
		
		return "/shop/shopBuyOne";
	}
	
	// 장바구니 -> 구매 페이지 이동
	@GetMapping("/cartListBuy")
	public String buyList(int mno, Model model) {
	    log.warn("상품 구매 페이지.." + mno);
	    
	    List<BookBuyListVO> list = service.buyListSelect(mno); // 장바구니 데이터 조회
	    Map<BookVO, Integer> orderMap = new HashMap<>(); // 책 데이터와 수량을 담을 맵

	    UserVO uvo = uservice.userSelectOne(mno);
	    
	    for (BookBuyListVO bbvo : list) {
	        BookVO book = service.getBookOne(bbvo.getBno()); // 책 정보 조회
	        orderMap.put(book, bbvo.getCount()); // 책과 해당 수량을 맵에 저장
	        log.warn("책 가격 조회 컨트롤러.. : " + book.getBookPrice());
	        log.warn("책 카운트 컨트롤러 .. : " + bbvo.getCount());
	    }

	    model.addAttribute("orderMap", orderMap); // 책과 수량을 모델에 담아서 전달
	    model.addAttribute("uvo", uvo);

	    return "/shop/shopBuyList";
	}

	
	// 상품 장바구니에 저장
	@ResponseBody
	@GetMapping(value = "/buyList/{bno}/{mno}/{count}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> shopingList(@PathVariable("bno") int bno, @PathVariable("mno") int mno, @PathVariable("count") int count) {
		log.info("장바구니 저장 컨트롤러.. " + bno + "," + mno + "," + count);
		
		BookBuyListVO vo = new BookBuyListVO(bno, mno, count);
		
		int insert = service.buyList(vo);

		log.info("컨트롤러 insertCount : " + insert);
		
		return insert == 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 장바구니에서 상품 삭제
	@GetMapping("/deleteCart")
	public String deleteCart(int bno, int mno) {
		log.warn("장바구니 삭제 컨트롤러.. : " + bno + "," + mno);
		int result = service.deleteCart(bno);
		log.warn("장바구니 삭제 결과 컨트롤러 .. : " + result);
		
		return "redirect:/shop/cartListBuy?mno=" + mno;
	}
	
	// 결제완료 후 결제결과 페이지 이동
	@Transactional
	@ResponseBody
	@PostMapping(value = "/buySuccess/{check}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> buySuccess(@RequestBody OrderDetailVO odvo, @PathVariable("check") int check) {
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getMno());
		// mno 데이터가 잘 넘어왔다면, mno 저장
		int mno = odvo.getMno();
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getTotalPrice());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderName());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderPhone());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderAddress());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderStreetAddress());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderDetailAddress());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getPoint());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getBookTypeCount());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderMainBookName());
		if(odvo.getUserDeposit() == "") {
			log.warn("컨트롤러 구매성공시 넘어온 데이터.. ( 가공 전 )" + odvo.getUserDeposit());
			odvo.setUserDeposit("미입력");
		}
		log.warn("컨트롤러 구매성공시 넘어온 데이터.. ( 가공 후 )" + odvo.getUserDeposit());
		int result = service.insertOrderDetail(odvo, check);
		log.warn("컨트롤러 상세주문정보 입력 체크.." + result);
		// 저장이 잘 됬다면 odvo2 셀렉트 후 저장
		int odno = service.selectOrderDetail(mno);
		log.warn("컨트롤러 주문한 책 리스트 입력을 위한 odno.." + odno);
		int listResult = 0;
		for (OrderBookListVO oblvo : odvo.getList()) {
			oblvo.setOdno(odno);
			log.warn("oblvo 정보 .. " + oblvo.getBno());
			log.warn("oblvo 정보 .. " + oblvo.getOdno());
			log.warn("oblvo 정보 .. " + oblvo.getCount());
			listResult = service.insertOrderBookList(oblvo);
			log.warn("컨트롤러 책 리스트 입력 결과.." + listResult);
		}
		
		return result >= 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@Transactional
	@ResponseBody
	@PostMapping(value = "/buySuccessOne/{check}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> buySuccessOne(@RequestBody OrderDetailVO odvo, @PathVariable("check") int check) {
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getMno());
		// mno 데이터가 잘 넘어왔다면, mno 저장
		int mno = odvo.getMno();
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getTotalPrice());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderName());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderPhone());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderAddress());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderStreetAddress());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderDetailAddress());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getPoint());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getBookTypeCount());
		log.warn("컨트롤러 구매성공시 넘어온 데이터.." + odvo.getOrderMainBookName());
		if(odvo.getUserDeposit() == "") {
			log.warn("컨트롤러 구매성공시 넘어온 데이터.. ( 가공 전 )" + odvo.getUserDeposit());
			odvo.setUserDeposit("미입력");
		}
		log.warn("컨트롤러 구매성공시 넘어온 데이터.. ( 가공 후 )" + odvo.getUserDeposit());
		int result = service.insertOrderDetailOne(odvo, check);
		log.warn("컨트롤러 상세주문정보 입력 체크.." + result);
		// 저장이 잘 됬다면 odvo2 셀렉트 후 저장
		int odno = service.selectOrderDetail(mno);
		log.warn("컨트롤러 주문한 책 리스트 입력을 위한 odno.." + odno);
		int listResult = 0;
		for (OrderBookListVO oblvo : odvo.getList()) {
			oblvo.setOdno(odno);
			log.warn("oblvo 정보 .. " + oblvo.getBno());
			log.warn("oblvo 정보 .. " + oblvo.getOdno());
			log.warn("oblvo 정보 .. " + oblvo.getCount());
			listResult = service.insertOrderBookList(oblvo);
			log.warn("컨트롤러 책 리스트 입력 결과.." + listResult);
		}
		
		return result >= 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 단일 상품 결제 완료 후
//	@ResponseBody
//	@PostMapping(value = "/buyOneSuccess", produces = MediaType.TEXT_PLAIN_VALUE)
//	public ResponseEntity<String> buyOneSuccess(@RequestBody OrderDetailVO vo){
//		int result = 0;
//		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	// 찜하기 누르면 찜 목록에 추가
	@ResponseBody
	@GetMapping(value = "/cu/{bno}/{mno}" , produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> cuNext(@PathVariable("bno") int bno, @PathVariable("mno") int mno){
		log.warn("찜 bno : " + bno + ",mno : " + mno);
		BookBuyListVO vo = new BookBuyListVO();
		vo.setBno(bno);
		vo.setMno(mno);
		int cuCheck = service.selectCuNext(vo);
		
		if(cuCheck > 0) {
			return new ResponseEntity<String>("false",HttpStatus.OK);
		}
		
		log.warn("찜 추가 후 bno : " + vo.getBno() + ",mno : " + vo.getMno());
		int result = service.cuNext(vo);
		return result == 1 ? new ResponseEntity<String>("success",HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 상품 삭제
	@GetMapping("/delete")
	public String deleteBook(int bno) {
		log.warn("상품 삭제... : " + bno);
		
		int delete = service.getDeleteBook(bno);
		
		log.warn("상품 삭제 결과 : " + delete);
		return "redirect:/shop/list";
	}
}
