package org.joonzis.controller;

import java.util.List;

import org.joonzis.domain.AproveResponse;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.ReadyResponse;
import org.joonzis.domain.SessionUtils;
import org.joonzis.domain.UserOrderVO;
import org.joonzis.domain.UserVO;
import org.joonzis.service.KakaoPayService;
import org.joonzis.service.ShopService;
import org.joonzis.service.UserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Log4j
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

    private final KakaoPayService kakaoPayService;
    
    @Autowired
    ShopService service;
    
    @Autowired
    UserOrderService orderService;
    
    @GetMapping("/orderDetail")
    public String orderDetail(int mno, Model model) {
    	log.warn("오더컨트롤러 오더디테일.. " + mno);
    	int odno = service.selectOrderDetailOdno(mno);
    	
    	UserOrderVO vo = new UserOrderVO();
    	vo.setMno(mno);
    	vo.setOdno(odno);
    	List<UserOrderVO> list = orderService.myPageUserOrderDetail(vo);
    	
    	list.forEach(uvo -> {
    		log.warn("오더브이오 조회결과 : " + uvo.getBno());
    		log.warn("오더브이오 조회결과 : " + uvo.getOrderStatus());
    		log.warn("오더브이오 조회결과 : " + uvo.getBookPrice());
    		log.warn("오더브이오 조회결과 : " + uvo.getBookPrice() * uvo.getCount());
    		log.warn("오더브이오 조회결과 : " + uvo.getUsePoint());
    	});
    	log.error("---odno---------" + odno);
    	
    	
    	OrderDetailVO ovo = new OrderDetailVO();
    	ovo = service.selectOrderDetailByOdno(odno);
    	log.error("------------" + ovo);
    	
    	
    	
    	log.warn("컨트롤러..오더디테일..mno.." + ovo.getMno());
    	model.addAttribute("list", list);
    	return "/order/orderDetail";
    }
    
    @PostMapping("/pay/ready")
    public @ResponseBody ReadyResponse payReady(@RequestBody BookVO vo) {
        
        String name = vo.getTitle();
        int totalPrice = vo.getBookPrice();
        
        log.warn("주문 상품 이름: " + name);
        log.warn("주문 금액: " + totalPrice);

        // 카카오 결제 준비하기
        ReadyResponse readyResponse = kakaoPayService.payReady(name, totalPrice);
        
        log.warn("결제 준비 : " + readyResponse);
        
        // 세션에 결제 고유번호(tid) 저장
        SessionUtils.addAttribute("tid", readyResponse.getTid());
        log.info("결제 고유번호: " + readyResponse.getTid());

        return readyResponse;
    }

    @GetMapping("/pay/completed")
    public String payCompleted(@RequestParam("pg_token") String pgToken) {
    
        String tid = SessionUtils.getStringAttributeValue("tid");
        log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
        log.info("결제 고유번호: " + tid);

        // 카카오 결제 요청하기
        AproveResponse approveResponse = kakaoPayService.payApprove(tid, pgToken);

        return "redirect:/order/completed";
    }
    
//    @GetMapping("/orderDetail")
//    public String orderDetail(int mno, Model model) {
//    	log.warn("오더컨트롤러 오더디테일.. " + mno);
//    	model.addAttribute("vo", service.selectOrderDetail(mno));
//    	return "/order/orderDetail";
//    }
    
}
