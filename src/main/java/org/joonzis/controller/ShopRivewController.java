package org.joonzis.controller;

import java.util.List;

import org.joonzis.domain.ReviewVO;
import org.joonzis.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/review")
public class ShopRivewController {

	@Autowired
	ReviewService service;

	@PostMapping(value = "/new", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> create(@ModelAttribute ReviewVO rvo) {
		log.warn("컨트롤러 리뷰등록..");

		log.warn("컨트롤러 리뷰 등록.." + rvo);
		int reviewCheck = service.selectReviewMno(rvo);
		log.warn("컨트롤러 리뷰 중복 체크 : " + reviewCheck);
		if (reviewCheck > 0) {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
		int result = service.insertReview(rvo);

//		log.warn("컨트롤러 리뷰 이미지 등록.. " + rvo.getReviewImage());
//		if(rvo.getReviewImage() != null) {
//			service.insertReviewImg(ravo);
//		}

		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping(value = "/get/{bno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<ReviewVO>> getReview(@PathVariable("bno") int bno) {
		log.warn("컨트롤러 리뷰 조회..." + bno);

		List<ReviewVO> list = service.getReviewList(bno);
		// 리턴병신같이해놓고 왜 안되지 하면서 별걸 다 시도해본 나 반성해..
//		for (int i = 0; i < list.size(); i++) {
//			list.get(i).setUserName(service.getUserName(list.get(i).getMno()));
//		}

		for (ReviewVO reviewVO : list) {
			reviewVO.setUserName(service.getUserName(reviewVO.getMno()));
			log.warn("리스트 결과 : " + reviewVO.getBno());
			log.warn("리스트 결과 : " + reviewVO.getMno());
			log.warn("리스트 결과 : " + reviewVO.getRating());
			log.warn("리스트 결과 : " + reviewVO.getReviewContent());
			log.warn("리스트 결과 : " + reviewVO.getUserName());
		}
		return new ResponseEntity<List<ReviewVO>>(list, HttpStatus.OK);
	}

	@GetMapping(value = "/deleteReview/{bno}/{mno}", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> deleteReview(@PathVariable("bno") int bno, @PathVariable("mno") int mno) {
		log.warn("컨트롤러 리뷰 삭제..." + bno);
		log.warn("컨트롤러 리뷰 삭제..." + mno);
		ReviewVO rvo = new ReviewVO();
		rvo.setBno(bno);
		rvo.setMno(mno);

		int result = service.deleteReview(rvo);

		log.warn("컨트롤러 리뷰 삭제 결과..." + result);

		return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
