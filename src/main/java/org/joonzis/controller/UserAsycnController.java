package org.joonzis.controller;

import java.io.File;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.UserOrderVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.joonzis.service.UserOrderService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/asycn")
public class UserAsycnController {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private UserOrderService uoservice;
	
	@GetMapping(value="/validateId/{userid}")
	public ResponseEntity<String> selectUsername(@PathVariable("userid") String userid){
		log.info("중복검색 : " + userid );

		int selectCount = service.selectUsername(userid);

		log.info("----------------" + selectCount);

		return selectCount == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);


	}

	@PostMapping(value = "/goLogin", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> goLogin(@RequestBody UserVO vo){

		log.warn("Asycn 아이디 확인 : " + vo.getUserId());

		int selectIdCount = service.selectUsername(vo.getUserId());

		log.warn("컨트롤러 아이디 카운트" + selectIdCount);

		// 아이디가 만약에 있다면 ( = 1 )
		// 패스워드 찾는 함수 실행 
		// 패스워드가 있다면 ( = 1 ) = find the ID&PW 전송
		// 패스워드가 틀리다면 ( = 0 ) = password is wrong 전송
		if(selectIdCount == 1) {
			int selectPwCount = service.selectUserPw(vo);
			return selectPwCount == 1 ?
					new ResponseEntity<String>("find the ID&PW", HttpStatus.OK) :
						new ResponseEntity<String>("password is wrong",HttpStatus.INTERNAL_SERVER_ERROR);

		}else if(selectIdCount == 0){
			return new ResponseEntity<String>("ID is wrong", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("id count 2",HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping(value = "/findId", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> findUserId(@RequestBody UserVO vo){

		log.warn("Asycn 이름" + vo.getUserName());
		log.warn("Asycn 이메일 " + vo.getUserEmail());

		int findIdCount = service.findUserId(vo);


		return findIdCount == 1 ?
				new ResponseEntity<String>("find ID&EMAIL", HttpStatus.OK) :
					new ResponseEntity<String>("none ID&EMAIL", HttpStatus.INTERNAL_SERVER_ERROR);


	}



	@PostMapping(value = "/pw_auth", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> pw_auth(
			@RequestBody UserVO vo, Model model){
		log.info("아이디/이메일 인증 : " + vo.getUserEmail());
		log.info("아이디/이메일 인증  : " + vo.getUserId());

		UserVO result = service.findUserIdEmail(vo);

		if(result != null) {
			log.info("아이디/이메일 : " + result.getUserEmail());
			log.info("아이디/이메일 : " + result.getUserId());
			SimpleMailMessage message = new SimpleMailMessage();
			Random ran = new Random();
			int num = ran.nextInt(999999);

			message.setFrom("soldesk1012@naver.com"); // 보내는 이
			message.setTo(result.getUserEmail());  // 받는 이
			message.setSubject("[페이퍼 그라운드] 비밀번호 인증 이메일 입니다.");
			message.setText("안녕하세요.\n" +
					result.getUserId() + "회원님\n" + 
					"페이퍼 그라운드 비밀번호 찾기 인증번호는 " + num + "입니다.\n" +
					"・본 메일은 중요한 정보를 포함하고 있으므로, 메일 알림 수신에 동의하지 않으신 분에게도 발송하고 있습니다.\n" +
					"・본 메일은 발신 전용 메일로 회신되지 않습니다.");

			model.addAttribute("num", num);
			model.addAttribute("userId", result.getUserId());
			mailSender.send(message);

			return new ResponseEntity<String>("" + num, HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@ResponseBody
	@PostMapping(value = "/updateIcon", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> newIcon(
			@RequestParam("userId") String userId,
			@RequestParam("userIcon") MultipartFile userIcon) {

		log.warn("아이콘 업데이트 for userId: " + userId);
		log.warn("아이콘 업데이트 for userIcon: " + userIcon);
		
		String uploadFolder = "C:\\dev\\workspace\\workSpace_spring\\project_paperGround\\src\\main\\webapp\\resources\\images";
		
		
		log.warn("-----------" + userIcon.getName());

		// make folder ------------------
		File uploadPath = new File(uploadFolder);
		log.info("uploadPath : " + uploadPath);


		// mkdirs 경로 폴더 생성 - make directory  directory :파일을 분류하기 위해 사용되는 이름공간 
		// 파일이 존재한다면 실행되는 부분 exists
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}		
		String uploadFileName = userIcon.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
		log.info("변경 후 : " + uploadFileName);
			
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				userIcon.transferTo(saveFile);
				
				
				UserVO vo = new UserVO();
				vo.setUserId(userId);
//				vo.setUserIcon("../resources/images/" + userIcon.getOriginalFilename());
//				vo.setUserIcon("../resources/images/" + uuid + "_" + userIcon.getOriginalFilename());
				vo.setUserIcon("../resources/images/" + uploadFileName);
				log.warn("업데이트 전" + vo.getUserIcon());
				int cunt = service.updateIcon(vo);
				log.info("업데이트 성공 : " + cunt);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping(value = "/resetIcon", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> resetIcon(
			@RequestParam("userId") String userId, 
			@RequestParam("userIcon") String userIcon){
		
		UserVO vo = new UserVO();
		vo.setUserId(userId);
		vo.setUserIcon(userIcon);
		
		log.warn("--------------" + userIcon);
//		vo.setUserIcon("../resources/images/" + vo.getUserIcon());
		int cunt = service.updateIcon(vo);
		log.info("업데이트 성공 : " + cunt);
		
		
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	@ResponseBody
	@GetMapping(value="/selectDay/{mno}/{selectDay}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<UserOrderVO>> selectDate(
			@PathVariable("mno") int mno,
			@PathVariable("selectDay") String selectDay){
		log.warn("파람" + mno);
		log.warn("파람" + selectDay);
		UserOrderVO vo = new UserOrderVO();
		vo.setMno(mno);
		vo.setSelectDay(selectDay);
		List<UserOrderVO> list = uoservice.selectDays(vo);
		
		list.forEach(uvo -> {
			log.warn("결과 : " + uvo.getBookCover());
			log.warn("결과 : " + uvo.getOrderDate());
		});
		
		return list != null ?
				new ResponseEntity<List<UserOrderVO>>(list , HttpStatus.OK) :
					new ResponseEntity<List<UserOrderVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ResponseBody
	@GetMapping(value="/selectCalendar/{mno}/{startDate}/{endDate}", produces = MediaType.APPLICATION_PROBLEM_JSON_UTF8_VALUE)
	public ResponseEntity<List<OrderDetailVO>> selectCalendar(
			@PathVariable("mno") int mno,
			@PathVariable("startDate") String startDate,
			@PathVariable("endDate") String endDate){
			log.warn("startDate : " + startDate );
			log.warn("endDate : " + endDate );
			
			UserOrderVO vo = new UserOrderVO();
			vo.setMno(mno);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
			List<OrderDetailVO> list = uoservice.NewuserOrderSelect(vo.getMno());
			
			
		return list != null ?
				new ResponseEntity<List<OrderDetailVO>>(list , HttpStatus.OK) :
					new ResponseEntity<List<OrderDetailVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	@ResponseBody
	@GetMapping(value = "selectOrderDetail", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<UserOrderVO>> selectList(@RequestParam("odno") int odno){
		
		List<UserOrderVO> list = uoservice.selectOrderByOdno(odno);
		
		return list != null ? new ResponseEntity<List<UserOrderVO>>(list, HttpStatus.OK) : new ResponseEntity<List<UserOrderVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
	
//	@ResponseBody
//	@GetMapping(value = "selectPointList/{mno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	public ResponseEntity<List<UserpointVO>> selectPointList(@PathVariable("mno") int mno){
//		
//		log.warn("mno : " + mno);
//		List<UserpointVO> allList = service.selectPoint(mno);
//		
//		log.warn(allList);
//		
//		allList.forEach(action -> {
//			log.warn("전체 포인트 내역 MNO : " + action.getMno());
//			log.warn("전체 포인트 내역 POINT : " + action.getPoint());
//			log.warn("전체 포인트 내역 AREA : " + action.getPointArea());
//			log.warn("전체 포인트 내역 STATUS : " + action.getStatus());
//			log.warn("전체 포인트 내역 DATE : " + action.getPointGetDate());
//		});
//		
//	
//		
//		return new ResponseEntity<List<UserpointVO>>(allList,HttpStatus.OK);
//	}ㄴ
//}



