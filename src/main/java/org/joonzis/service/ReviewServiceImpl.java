package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReviewAttachVO;
import org.joonzis.domain.ReviewVO;
import org.joonzis.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewMapper mapper;
	
	@Override
	public int selectReviewMno(ReviewVO rvo) {
		log.warn("서비스 인서트 전 중복체크.. " + rvo);
		return mapper.selectReviewMno(rvo);
	}
	
	@Override
	public int insertReview(ReviewVO rvo) {
		log.warn("서비스 인서트.." + rvo);
		int result = mapper.insertReview(rvo);
		if(result > 0) {
			mapper.insertBookLike(rvo);
		}
		return result;
	}
	
	@Override
	public int insertReviewImg(ReviewAttachVO ravo) {
		log.warn("서비스 이미지 인서트.. " + ravo);
		return mapper.insertReviewImg(ravo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(int bno) {
		log.warn("서비스 리뷰목록.." + bno);
		return mapper.getReviewList(bno);
	}
	
	@Override
	public String getUserName(int mno) {
		log.warn("서비스 리뷰 이름 조회.." + mno);
		return mapper.getUserName(mno);
	}
	
	@Transactional
	@Override
	public int deleteReview(ReviewVO rvo) {
		log.warn("서비스 리뷰삭제..." + rvo);
		
		int result = mapper.deleteLikeCount(rvo);
		
		log.warn("좋아요 삭제 결과 : " + result);
		
		return mapper.deleteReview(rvo);
	}
}
