package org.joonzis.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.print.attribute.standard.Severity;
import javax.servlet.http.HttpSession;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.UserOrderVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.joonzis.service.UserOrderService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/User/*")
public class UserController {
	
	@Autowired
	private UserService service;
	
	@Autowired
	private UserOrderService orderService;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/main";
	}
	
	@GetMapping("/login")
	public String login() {
		log.info("로그인 페이지 이동");
		return "/login";
	}
	
	@GetMapping("/signup")
	public String signup() {
		log.info("회원가입 페이지 이동");
		return "/signup";
	}
	
	@PostMapping("/signup")
	public String signup(UserVO vo) {
		int result = service.signup_insert(vo);
		log.warn("Controller 회원가입 성공 : " + result);
		return "/main";
		
	}
	
	@PostMapping("/goLogin")
	public String goLogin(UserVO vo, HttpSession session) {
		log.info("Controller 로그인 성공 : " + vo);
		session.setAttribute("vo", service.selectUserId(vo.getUserId()));
		return "/main";
	}
	
	@GetMapping("/findId")
	public String findId() {
		log.info("아이디 찾기 페이지 이동");
		return "/find/findId";
	}
	
	@GetMapping("/findPw")
	public String findPw() {
		log.info("비밀번호 찾기 페이지 이동");
		return "/find/findPw";
	}
	
	// 아이디 찾기 후 - 유저 아이디 출력 페이지 이동
	@PostMapping("/goFindId")
	public String goFindId(Model model, UserVO vo) {
		UserVO result = service.selectUserIdByEmail(vo);
		log.info("아이디 찾기 검색 페이지 이동 : " + result.getUserId());
		model.addAttribute("userId", result.getUserId());
		return "/find/goFindId";
	}
	
	// 인증번호 인증 완료 - 새 비밀번호 페이지 이동
	@PostMapping("/pw_auth_page")
		public String pw_auth(Model model, int num, UserVO vo){
		log.info("---------------------------" + num);
		log.info("---------------------------" + vo.getUserId());
		model.addAttribute("userId", vo.getUserId());
		model.addAttribute("model", num);
		return "/find/pwAuth";
	}
	
	// 새 비밀번호 설정 페이지 이동
	@PostMapping("/pwNew")
		public String pwNew(Model model,UserVO vo) {
		model.addAttribute("userId", vo.getUserId());
		log.info("새 비밀번호 설정 페이지 이동 : " + vo.getUserId());
		return "/find/pwNew";
	}
	
	// 새 비밀번호 설정 완료 - 메인페이지
	@PostMapping("/pwChange")
		public String pwChange(UserVO vo) {
		log.warn("인코더 전 비밀번호 : " + vo.getUserPw());
		String inCoderPw = pwencoder.encode(vo.getUserPw());
		log.warn("인코더 후 비밀번호 : " + inCoderPw);
		vo.setUserPw(inCoderPw);
		int result = service.updatePw(vo);
		log.info("새 비밀번호 설정 완료 : " + result);
		
		return "/main";
	}
	
	// 마이페이지 이동 
	@GetMapping("/myPage")
		public String myPage(Model model, UserVO vo) {
		
		vo = service.userSelectOne(vo.getMno());
		
		// 이름 암호화 처리
		String name = vo.getUserName();
		
		if(name.length() == 2) {
			name = name.charAt(0) + "*";
			vo.setUserName(name);
		}else if(name.length() == 3) {
			name = name.charAt(0) + "*" + name.charAt(2);
			vo.setUserName(name);
		}else if(name.length() == 4) {
			name = name.charAt(0) + "*" + name.charAt(2) + name.charAt(3);
			vo.setUserName(name);
		}else{
            name = name.charAt(0) + "*" + name.charAt(2);
            for (int i = 3; i < name.length(); i++) {
               name += name.charAt(i);
               log.warn("for *네임 : " + name);
            }
            log.warn("*네임 : " + name);
         }
		
		// 권한 예외처리
		String userRole = vo.getUserRole();
		switch (userRole) {
		case "USER_ROLE":
			vo.setUserRole("일반 유저");
			break;
		case "MANAGER_ROLE":
			
			break;
		case "ADMIN_ROLE":
			
			break;
		default:
			
			break;
		}
		
         
		log.info("마이페이지 이동" + vo);
		model.addAttribute("vo", vo);
		
		
		return "/myPage/myPage";
	}
	
	// 유저 정보 수정 페이지 이동
	@GetMapping("/myPageUpdate")
		public String myPageUpdate(Model model,String userId) {
		log.warn("유저 정보 수정 페이지 이동" + userId);
		UserVO vo = service.selectUserId(userId);
		log.warn("우편번호 : " + vo.getAddress());
		log.warn("지번주소 : " + vo.getStreetAddress());
		log.warn("상세주소 : " + vo.getDetailAddress());
		
		// 이메일 가져오기 코드
		String email = vo.getUserEmail();
		String saveEmail = null;
		String saveDomain = null;	
		String[] arr = email.split("@");
		for (int i = 0; i < arr.length; i++) {
			log.info("문자열 자르기잉이이인ㅋ : " + arr[i]);
			saveEmail = arr[0];
			saveDomain = arr[1];
		}
		log.info("이메일 : " + saveEmail);
		log.info("도메인 : " + saveDomain);
		
		model.addAttribute("saveEmail", saveEmail);
		model.addAttribute("saveDomain", saveDomain);
		
		model.addAttribute("vo", vo);
		log.info("마이페이지 수정 : " + vo.getUserId());
		
		return "/myPage/myPageUpdate";
	}
	
	// 유저 아이콘 페이지 이동
	@GetMapping("/changeIcon")
		public String changeIcon(Model model,String userId) {
		UserVO result = service.selectUserId(userId);
		model.addAttribute("result", result);
		log.info("유저 아이콘 변경 페이지 이동");
		return "/myPage/changeIcon";
	}
	
	@PostMapping("/goChangeIcon")
		public String goChangeIcon(Model model, String userId) {
		UserVO result = service.selectUserId(userId);
		model.addAttribute("result", result);
		return "/myPage/myPage";
	}
	
	// 유저 정보 업데이트
	@PostMapping("/updateUserInfo")
		public String updateUserInfo(UserVO vo, Model model) {
		
		log.warn("유저 정보 업데" + vo.getUserDate());
		log.warn("유저정보 업데이트 :" + vo.getUserGender());
		log.warn("유저정보 업데이트 :" + vo.getUserPhonenumber());
		int result = service.updateUserInfo(vo);
		log.warn("dsadasdsadasdadwadwad" + result);
		
		
		
		// 이메일 가져오기 코드
		String email = vo.getUserEmail();
		String saveEmail = null;
		String saveDomain = null;	
		String[] arr = email.split("@");
		for (int i = 0; i < arr.length; i++) {
			log.info("문자열 자르기잉이이인ㅋ : " + arr[i]);
			saveEmail = arr[0];
			saveDomain = arr[1];
		}
		log.info("이메일 : " + saveEmail);
		log.info("도메인 : " + saveDomain);
		
		model.addAttribute("saveEmail", saveEmail);
		model.addAttribute("saveDomain", saveDomain);
		model.addAttribute("vo", vo);
		return "/myPage/myPageUpdate";
	}
	
	// 유저 탈퇴
	@GetMapping("deleteAccount")
		public String deleteAccount(String userId) {
		log.info("회원탈퇴 : " + userId);
		service.deleteAccount(userId);
		return "/main";
	}
	
	@SuppressWarnings("deprecation")
	@GetMapping("OrderSelect")
	public String userOrderSelect(Model model, UserVO vo) {
		log.info("vo@" + vo);
		log.info("mno컨트룰러 : " + vo.getMno());
		
		int orderCount = orderService.orderCount(vo.getMno());
		vo = service.userSelectOne(vo.getMno());
		log.info("@@@@@@@@@@" + orderCount);
		// 미리보기할 데이터 리스트 
		List<OrderDetailVO> list = orderService.NewuserOrderSelect(vo.getMno());
		
		list.forEach(action -> {
			log.warn("조인 X버전 리스트 : " + action.getOrderMainBookName());
			log.warn("조인 X버전 리스트 : " + action.getOrderMainImage());
			log.warn("조인 X버전 리스트 : " + action.getTotalPrice());
			log.warn("조인 X버전 리스트 : " + action.getOrderName());
			log.warn("조인 X버전 리스트 : " + action.getOrderDate() );
			
			
			LocalDate localDate = LocalDate.now();
			Date dt = Date.valueOf(localDate);
//			log.warn("데이트 객체 결과 : " + dt);
//			dt.getDay() + 1;
//			log.warn("결과 " + dt.setDate(dt.getDate() + 1));
			
			DateTimeFormatter df = DateTimeFormatter.ofPattern("yy-MM-dd");
			String fdate = localDate.format(df);
			
//			log.warn("ddasdsadsadsadasdsa" +  action.getOrderDate().compareTo(dt));
			
			log.warn("어제 : " + localDate.minusDays(1));
			log.warn("현재 날짜 : " + fdate);
			log.warn("다음날 : " + localDate.plusDays(1));
			log.warn("다다음날 : " + localDate.plusDays(2));
			
//			if(action.getOrderDate().after(dt)) {
//				10-25가 10-26보다 뒤면??
//			}else if(action.getOrderDate().equals(dt)){
//				
//			}else if(action.getOrderDate().before(dt)) {
//				
//			}
			// 가져온 날짜 vs 오늘 날짜 비교
			// 비교 후 당일이면 ~ 하루뒤면 ~ 이틀뒤면 ~
			
		});
		
		model.addAttribute("orderCount",orderCount);
		model.addAttribute("list", list);
		model.addAttribute("vo",vo);
		return "/myPage/myOrder";
	}
//		@GetMapping("OrderSelect")
//		public String userOrderSelect(Model model, UserVO vo) {
//			log.info("vo@" + vo);
//			log.info("mno컨트룰러 : " + vo.getMno());
//			
//			List<UserOrderVO> list = orderService.userOrderSelect(vo.getMno());
//			int orderCount = orderService.orderCount(vo.getMno());
//			vo = service.userSelectOne(vo.getMno());
//			
//			list.forEach(uvo -> {
//				log.warn("1 : " + uvo.getBno());
//				log.warn("2 : " + uvo.getCount());
//				log.warn("3 : " + uvo.getOrderAddr());
//				log.warn("4 : " + uvo.getOrderStatus());
//				log.warn("5 : " + uvo.getOrderPhone());
//				log.warn("6 : " + uvo.getOrderDate());
//				log.warn("7 : " + uvo.getTotalPrice());
//				log.warn("8 : " + uvo.getOdno());
//			});
//			
//			log.info("@@@@@@@@@@" + orderCount);
//			model.addAttribute("orderCount",orderCount);
//			// 미리보기할 데이터 리스트 
//			List<OrderDetailVO> newList = orderService.NewuserOrderSelect(vo.getMno());
//			
//			newList.forEach(action -> {
//				log.warn("조인 X버전 리스트 : " + action.getOrderMainBookName());
//				log.warn("조인 X버전 리스트 : " + action.getOrderMainImage());
//				log.warn("조인 X버전 리스트 : " + action.getTotalPrice());
//				log.warn("조인 X버전 리스트 : " + action.getOrderName());
//				
//			});
//			
//			model.addAttribute("newList", newList);
//			model.addAttribute("list",list);
//			model.addAttribute("vo",vo);
//			return "/myPage/myOrder";
//		}
		
	@GetMapping("myPageUserOrderDetail")
	public String myPageUserOrderDetail(Model model, UserOrderVO vo) {
		log.info("MNO는 ? : " + vo.getMno());
		log.info("ODNO는 ? : " + vo.getOdno());
		
		UserVO uvo = service.userSelectOne(vo.getMno());
		List<UserOrderVO> list = orderService.myPageUserOrderDetail(vo);
		
		log.warn("USERNAME은 ? : " + uvo.getUserName());
		log.warn("USERNAME은 ? : " + uvo.getUserEmail());
		log.warn("USERNAME은 ? : " + uvo.getStreetAddress());
		
		
		
		list.forEach(action -> {
			log.warn("결과에용 : " + action.getBno());
			log.warn("결과에용 : " + action.getOrderStatus());
			log.warn("단일가격 : " + action.getBookPrice());
			log.warn("합가격: " + action.getBookPrice() * action.getCount());
			log.warn("포인트 " + action.getUsePoint());
			
		});
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("vo", uvo);
		return "/myPage/myPageOrderDetail";
	}
	
	@GetMapping("selectMyPoint")
	public String selectMyPoint(Model model, int mno) {
		log.warn("포인트 : " + mno);
		UserVO vo = service.userSelectOne(mno);
		log.warn("vo" + vo.getUserName());
		List<UserpointVO> list = null;
		int totalPoint = 0;
		int totalUsePoint = 0;
		if(service.selectPoint(mno).size() > 0) {
			list = service.selectPoint(mno);
			totalPoint = service.totalPoint(mno);
			totalUsePoint = service.totalUsePoint(mno);
		}
		log.warn("dddddddddddddddddddd1" + list);
		log.warn("dddddddddddddddddddd2" + totalPoint);
		log.warn("dddddddddddddddddddd3" + totalUsePoint);

		if(list == null) {
			model.addAttribute("vo",vo);
			model.addAttribute("mno", mno);
		}else {
			list.forEach(action -> {
//			String timeCheck = action.getPointGetDate().toString();
				log.warn("전체 포인트 내역 MNO : " + action.getMno());
				log.warn("전체 포인트 내역 POINT : " + action.getPoint());
				log.warn("전체 포인트 내역 AREA : " + action.getPointArea());
				log.warn("전체 포인트 내역 STATUS : " + action.getStatus());
				log.warn("전체 포인트 내역 DATE : " + action.getPointGetDate());
//			Timestamp currentDate = new Timestamp(System.currentTimeMillis());
//			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//			try {
//				java.util.Date parsedDate = dateFormat.parse(timeCheck);
//				log.warn("-----------------" + parsedDate);
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
				
			});
			model.addAttribute("totalUsePoint", totalUsePoint);
			model.addAttribute("totalPoint", totalPoint);
			model.addAttribute("list", list);
			model.addAttribute("vo",vo);
			model.addAttribute("mno", mno);
		}
		
		
		return "myPage/myPoint";
	}
	
	// 중고 주문조회 페이지
	@GetMapping("myUsedProductsSelect")
	public String myUsedProductsSelect(Criteria cri, Model model) {
		log.warn("중고 주문조회 페이지 이동");
//		Criteria cri = new Criteria();
		
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(5);
		}
		
		log.warn("mno 중고 확인 : " + cri.getUserMno());
		log.warn("1 : " + cri.getAmount() );
		log.warn("1 : " + cri.getPageNum() );
		List<UsedBookVO> list = service.getuBookList(cri);
		UserVO vo = service.userSelectOne(cri.getUserMno());
		int total = service.countGetuBookList(cri);
		log.warn("mno 중고 : " + cri.getUserMno() );
		list.forEach(book -> {
			log.error(book.getTitle());
			log.error(book.getStatus());
			log.error(book.getUbookDate());
			log.error(book.getUbookPrice());
			log.error(book.getUsedBookImgs());
			log.error("--------------------------");
		});
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "myPage/myUsedProductsSelect";
	}
	
	// 중고 날짜별 조회
	@GetMapping("selectUsedProductDate")
	public String selectUsedProductDate(Criteria cri, Model model) {
		
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(5);
		}
		
		log.warn("mno 중고 확인 날짜별 조회 : " + cri.getUserMno());
		log.warn("1 날짜별 조회 : " + cri.getAmount() );
		log.warn("1 날짜별 조회 : " + cri.getPageNum() );
		log.warn("1 날짜별 조회 : " + cri.getStartDate() );
		log.warn("1 날짜별 조회 : " + cri.getEndDate() );
		
		List<UsedBookVO> list = service.selectGetuBookList(cri);
		UserVO vo = service.userSelectOne(cri.getUserMno());
		int total = service.countGetuBookList(cri);
		log.warn("mno 중고  날짜별 조회: " + cri.getUserMno() );
		log.warn("토탈 : " + total );
		log.warn("토탈 list : " + list.size() );
		
		list.forEach(book -> {
			log.error(book.getTitle());
			log.error(book.getStatus());
			log.error(book.getUbookDate());
			log.error(book.getUbookPrice());
			log.error(book.getUsedBookImgs());
		});
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "myPage/myUsedProductsSelect";
	}
	
	@GetMapping("saleEnd")
	public String usedBookSaleEnd(Criteria cri, Model model) {
		log.error("판매완료 중고 조회 이동");
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(5);
		}
		
		log.warn("mno 중고 확인 날짜별 조회 : " + cri.getUserMno());
		log.warn("판매완료 날짜별 조회 : " + cri.getAmount() );
		log.warn("판매완료 날짜별 조회 : " + cri.getPageNum() );
		log.warn("판매완료 날짜별 조회 : " + cri.getStartDate() );
		log.warn("판매완료 날짜별 조회 : " + cri.getEndDate() );
		log.warn("판매완료필터타입 : " + cri.getFilterType());
		
		// 날짜조회 + 주문완료 쿼리
		List<UsedBookVO> list = service.selectGetuBookEndSaleList(cri);
		UserVO vo = service.userSelectOne(cri.getUserMno());
		// 토탈 카운트 쿼리
		int total = service.countGetuBookList(cri);
		log.warn("mno 중고  날짜별 조회: " + cri.getUserMno() );
		log.warn("토탈 : " + total );
		log.warn("토탈 list : " + list.size() );
		
		list.forEach(book -> {
			log.error(book.getTitle());
			log.error("상태값 : " + book.getStatus());
			log.error(book.getUbookDate());
			log.error(book.getUbookPrice());
			log.error(book.getUsedBookImgs());
			
		});
		
		log.warn("ddd" + cri.getFilterType());
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "myPage/myUsedProductsSelect";
	}
}
