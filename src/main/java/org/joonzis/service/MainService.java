package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.WriteVO;

public interface MainService {
	
	public List<BookVO> selectBestSellerList();
	
	// 인기 게시글 
		public List<BoardVO> selectBestLikesBoardList();
		
		// 공지사항
		public List<BoardVO> selectAnnouncementList();
		
		// 집필 베스트 좋아요
		public List<WriteVO> selectBestLikesWriteList();
		
		// 유저 추천 도서
		public List<BookVO> selectUserRecommendBookLike();
}
