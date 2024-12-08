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

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.UserOrderVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.service.UserOrderService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	PasswordEncoder pwencoder;


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
		log.warn("비밀번호 인코더 후 : " + vo.getUserPw());
		String resultPw = pwencoder.encode(vo.getUserPw());
		log.warn("비밀번호 인코더 후 : " + resultPw);
		vo.setUserPw(resultPw);
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

		model.addAttribute("vo", result);
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
	@GetMapping("/pwNew")
	public String pwNew(Model model,UserVO vo) {
		model.addAttribute("userId", vo.getUserId());
		log.info("새 비밀번호 설정 페이지 이동 : " + vo.getUserId());
		return "/find/pwNew";
	}

	// 새 비밀번호 설정 완료 - 메인페이지
	@GetMapping("/pwChange")
	public String pwChange(UserVO vo) {
	
		String resultPw = pwencoder.encode(vo.getUserPw());
		log.warn("비밀번호 인코더 후 : " + resultPw);
		vo.setUserPw(resultPw);
		int result = service.updatePw(vo);
		log.info("새 비밀번호 설정 완료 : " + result);

		return "/main";
	}
	
	@ResponseBody
	@PostMapping(value = "/pwChangeRest", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> pwChangeRest(@RequestBody UserVO vo) {
		
		log.warn("컨트롤러 비밀번호 변경 유저 아이디 : " + vo.getUserId());		
		log.warn("컨트롤러 비밀번호 변경 유저 비밀번호 : " + vo.getUserPw());		
		String resultPw = pwencoder.encode(vo.getUserPw());
		log.warn("비밀번호 인코더 후 : " + resultPw);
		vo.setUserPw(resultPw);
		int result = service.updatePw(vo);
		log.info("새 비밀번호 설정 완료 : " + result);
		
		return result != 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
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

		log.info("마이페이지 이동" + vo);
		model.addAttribute("myShoppingCount", service.myShoppingCount(vo.getMno()) );
		model.addAttribute("myBoardCount", service.myBoardCount(vo.getMno()) );
		model.addAttribute("directreportCount", service.directReportCountByMno(vo.getMno()) );
		model.addAttribute("vo", vo);


		return "/myPage/myPage";
	}

	// 유저 정보 수정 페이지 이동
	@GetMapping("/checkPassword")
	public String checkPassword(Model model,String userId) {
		log.warn("wjiofahjfiafesfgejsif" + userId);
		UserVO result = service.selectUserId(userId);
		//		service.checkPassword(result);

		// 이메일 가져오기 코드
		String email = result.getUserEmail();
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

		model.addAttribute("result", result);
		log.info("비밀번호 확인 : " + result.getUserId());
		log.info("비밀번호 확인 : " + result.getUserPw());

		return "/myPage/checkPassword";
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
	         if(arr.length > 1) {
	            saveDomain = arr[1];
	         }
	      }

	      if(saveDomain != null) {
	         log.info("이메일 : " + saveEmail);
	         log.info("도메인 : " + saveDomain);
	         model.addAttribute("saveEmail", saveEmail);
	         model.addAttribute("saveDomain", saveDomain);
	      }else {
	         log.info("이메일 : " + saveEmail);
	         model.addAttribute("saveEmail", saveEmail);
	      }


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
		log.warn("유저정보 업데이트 :" + vo.getUserId());
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
		model.addAttribute("vo", service.selectUserId(vo.getUserId()));
		return "/myPage/myPageUpdate";
	}

	// 유저 탈퇴
	@GetMapping("deleteAccount")
	public String deleteAccount() {
//		log.info("회원탈퇴 : " + userId);
//		service.deleteAccount(userId);
		return "/deleteAccount";
	}
	
	@ResponseBody
	@GetMapping(value = "deleteUser", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteUser(@RequestParam int mno, @RequestParam String reason) {
		log.warn("회원탈퇴 : " + mno);
		log.warn("탈퇴사유 : " + reason);
		
		int result = service.deleteUser(mno);
		log.warn(result);
		
		return result != 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@SuppressWarnings("deprecation")
	@GetMapping("OrderSelect")
	public String userOrderSelect(Model model, UserVO vo) {
		log.info("vo@" + vo);
		log.info("mno컨트룰러 : " + vo.getMno());

		int orderCount = orderService.orderCountWe(vo.getMno());
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
	
	@SuppressWarnings("deprecation")
	@GetMapping("OrderSelectWe")
	public String userOrderSelectWe(Model model, UserVO vo) {
		log.info("vo@We" + vo);
		log.info("mno컨트룰러We : " + vo.getMno());

		int orderCount = orderService.orderCountWe(vo.getMno());
		vo = service.userSelectOne(vo.getMno());
		log.info("@@@@@@@@@@We" + orderCount);
		// 미리보기할 데이터 리스트 
		List<OrderDetailVO> list = orderService.NewuserOrderSelectWe(vo.getMno());

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
		log.warn("cri : " + cri.getAmount());
		log.warn("cri : " + cri.getPageNum());
		log.warn("cri : " + cri.getFilterType());

		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(5);
		}
		log.warn("after cri : " + cri.getAmount());
		log.warn("after cri : " + cri.getPageNum());

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

	@GetMapping("myCommenPost")
	public String myCommenPost(Criteria cri, Model model) {
		log.info("게시글 보기");
		log.warn("cri : " + cri.getAmount());
		log.warn("cri : " + cri.getPageNum());
		log.warn("cri 필터타입 : " + cri.getFilterType());
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(5);
		}	

		if(cri.getFilterType().equals("posts")) {
			List<BoardVO> list = service.selectBoard(cri);
			int total = service.selectBoardCount(cri);
			log.warn("리스트 크기 : " + list.size());
			list.forEach(action -> {
				log.warn("list-포스트 " + action.getTitle());
				log.warn("list-포스트 " + action.getUpdateDate());
				log.warn("list-포스트 " + action.getReadCount());
				log.warn("list-포스트 보드넘버 " + action.getBoardno());
			}); 
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
		}else if(cri.getFilterType().equals("comments")) {
			List<BoardVO> list = service.selectComments(cri);
			int total = service.selectCommentsCount(cri);
			log.warn("리스트 크기 : " + list.size());
			list.forEach(action -> {
				log.warn("list-댓글" + action.getReply());
				log.warn("list-댓글" + action.getUpdateDate());
				log.warn("list-댓글" + action.getReadCount());
				log.warn("list-댓글" + action.getTitle());
				log.warn("list-댓글 " + action.getBoardno());
			}); 
			model.addAttribute("commentsList", list);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
		}else if(cri.getFilterType().equals("liked")) {
			List<BoardVO> list = service.selectLikesBoard(cri);
			int total = service.selectLikesCount(cri);
			log.warn("리스트 크기 : " + list.size());
			list.forEach(action -> {
				log.warn("list-좋아요" + action.getTitle());
				log.warn("list-좋아요" + action.getUpdateDate());
				log.warn("list-좋아요" + action.getReadCount());
				log.warn("list-좋아요 " + action.getBoardno());
			});
			model.addAttribute("likesList", list);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
		}

		log.warn("after cri : " + cri.getAmount());
		log.warn("after cri : " + cri.getPageNum());
		log.error("mno는?" + cri.getUserMno());
		log.error("mno는?" + cri.getUserMno());
		UserVO vo = service.userSelectOne(cri.getUserMno());
		model.addAttribute("vo", vo);

		return "myPage/myPageCommenPost";
	}


	@GetMapping("myComments")
	public String myComments(Criteria cri, Model model) {
		log.info("댓글 보기");
		log.warn("cri : " + cri.getAmount());
		log.warn("cri : " + cri.getPageNum());
		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(5);
		}	
		log.warn("after cri : " + cri.getAmount());
		log.warn("after cri : " + cri.getPageNum());
		log.error("mno는?" + cri.getUserMno());
		List<BoardVO> list = service.selectComments(cri);
		int total = service.selectLikesCount(cri);
		log.error("mno는?" + cri.getUserMno());
		log.error("list는 ? : " + list.size());
		log.error("total은 ? : " + total);

		list.forEach(action -> {
			log.warn("list-댓글" + action.getReply());
			log.warn("list-댓글" + action.getUpdateDate());
			log.warn("list-댓글" + action.getReadCount());
			log.warn("list-댓글" + action.getTitle());
		}); 

		model.addAttribute("commentsList", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "myPage/myPageCommenPost";
	}



	@GetMapping("myLikedWriterBookList")
	public String myLikedWriterBookList(Criteria cri, Model model) {
		log.warn("집필 북마크 페이지 이동" + cri.getUserMno());
		UserVO vo = service.userSelectOne(cri.getUserMno());
		
		List<WriteVO> list = service.selectMyLikedWritingList(cri);
		list.forEach(action -> {
			log.warn("집필 타이틀 " + action.getTitle());
			log.warn("집필 타이틀 " + action.getGenre());
			log.warn("집필 타이틀 " + action.getCoverImage());
		});
		
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		return "myPage/myLikedWriterBookList";
	}

	
}
