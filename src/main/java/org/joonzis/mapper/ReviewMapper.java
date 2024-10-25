package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ReviewAttachVO;
import org.joonzis.domain.ReviewVO;

public interface ReviewMapper {
	
	// 리뷰 중복 체크
	public int selectReviewMno(ReviewVO rvo);
	
	// 리뷰 입력 ( insert )
	public int insertReview(ReviewVO rvo);
	
	// 별점 입력 ( insertBlike )
	public int insertBookLike(ReviewVO rvo);
	
	// 리뷰 이미지 저장 ( insert )
	public int insertReviewImg(ReviewAttachVO ravo);
	
	// 리뷰 리스트 가져오기
	public List<ReviewVO> getReviewList(int bno);
	
	// 리뷰 삭제
	public int deleteReview(ReviewVO rvo);
	
	// 리뷰 삭제 시 좋아요 카운트 삭제
	public int deleteLikeCount(ReviewVO rvo);
}
