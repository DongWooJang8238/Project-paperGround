package org.joonzis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.joonzis.domain.WriteVO;
import org.springframework.web.multipart.MultipartFile;

public interface MainMapper {
	// 베스트 셀러
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
