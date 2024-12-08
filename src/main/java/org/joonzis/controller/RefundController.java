package org.joonzis.controller;



import java.util.List;

import org.joonzis.domain.RefundVO;
import org.joonzis.domain.UserOrderVO;
import org.joonzis.domain.UserVO;
import org.joonzis.service.RefundService;
import org.joonzis.service.ShopService;
import org.joonzis.service.UserOrderService;
import org.joonzis.service.UserService;
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
@RequestMapping("/refund/*")
public class RefundController {
	
	 @Autowired
    private ShopService shopservice;
	
	@Autowired
	private RefundService refundservice;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private UserOrderService orderService;
	
	
	
	//game entrance page open.
	@GetMapping("/refund")
	public String entrance(@RequestParam("mno") int mno, @RequestParam("odno") int odno , String status, Model model) {
		log.info("refund.......");
		log.warn("status : " + status);
		
		int totalSpendMoney = refundservice.totalSpendMoney(mno);
//		UserVO uvo = userservice.userSelectOne(mno);
		UserOrderVO vo = new UserOrderVO();
		vo.setOdno(odno);
		vo.setMno(mno);
		List<UserOrderVO> list = orderService.myPageUserOrderDetail(vo);
		 
		model.addAttribute("uvo", vo);
		model.addAttribute("list", list);
		model.addAttribute("mno", mno);
		model.addAttribute("status", status);
		model.addAttribute("totalSpendMoney", totalSpendMoney);
		return "/refund/refund";
	}

	
	@PostMapping("/refundProcess")
	@ResponseBody
	public ResponseEntity<String> refundProcess(@RequestBody RefundVO refundVO , Model model) {
		log.info("refundProcess.......");
		int result = 0;
		UserOrderVO vo = new UserOrderVO();
		vo.setOdno(refundVO.getOdno());
		vo.setMno(refundVO.getMno());
		if(refundVO.getRefundOrCancel().equals("cancel")) {
			//주문 취소시 주문 정보 삭제
			 result = refundservice.deleteOrder(refundVO);
		}else {//환불시 환불 내역 추가.
			result = refundservice.refundOrder(refundVO);
		}		
	    return result > 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); 
	}
	
	
	
	
	
	
	

}
