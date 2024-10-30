package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReviewAttachVO;
import org.joonzis.domain.ReviewVO;

public interface ReviewService {
	
		// ===============================> 리뷰 입력 <=======================================
		// 리뷰 중복 체크
		public int selectReviewMno(ReviewVO rvo);
		
		// 댓글 입력 ( insert )
		public int insertReview(ReviewVO rvo);
		
		// 리뷰 이미지 저장 ( insert )
		public int insertReviewImg(ReviewAttachVO ravo);
		// ===============================> 리뷰 입력 <=======================================
		
		// ===============================> 리뷰 조회 <=======================================
		// 댓글 리스트 가져오기
		public List<ReviewVO> getReviewList(int bno);
		
		// 댓글 단 유저 이름 가져오기
		public String getUserName(int mno);
		// ===============================> 리뷰 조회 <=======================================
		
		// ===============================> 리뷰 삭제 <=======================================
		// 리뷰 삭제
		public int deleteReview(ReviewVO rvo);
		// ===============================> 리뷰 삭제 <=======================================
}
