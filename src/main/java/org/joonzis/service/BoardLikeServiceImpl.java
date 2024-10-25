package org.joonzis.service;

import org.joonzis.domain.BoardCommentLikeVO;
import org.joonzis.domain.BoardLikeVO;
import org.joonzis.mapper.BoardLikeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardLikeServiceImpl implements BoardLikeService {
	
	@Autowired
	private BoardLikeMapper mapper;


	// 게시판
	@Override
	public int insertLike(BoardLikeVO bvo) {
		// 좋아요가 이미 눌렸는지 확인 후 처리
				log.info("insertLike... " + bvo);
		        
		        return mapper.insertLike(bvo);
			}

	@Override
	public int deleteLike(BoardLikeVO bvo) {
		log.info("deleteLike... " + bvo);
		return mapper.deleteLike(bvo);
	}

	@Override
	public int countLikes(int boardno) {
		log.info("countLikes... " + boardno);
		return mapper.countLikes(boardno);
	}

	@Override
	public int isLiked(BoardLikeVO bvo) {
		// 좋아요 여부 확인: 반환값이 0보다 크면 이미 좋아요가 눌린 상태
		return mapper.isLiked(bvo);
	}
	
	
	// 댓글
	@Override
	public int cominsertLike(BoardCommentLikeVO bvo) {
		log.info("댓글insertLike... " + bvo);
        return mapper.cominsertLike(bvo);
	}

	@Override
	public int comdeleteLike(BoardCommentLikeVO bvo) {
		log.info("댓글deleteLike... " + bvo);
		return mapper.comdeleteLike(bvo);
	}

	@Override
	public int comcountLikes(int replyno) {
	    log.info("댓글countLikes... " + replyno);
	    return mapper.comcountLikes(replyno);
	}

	@Override
	public int comisLiked(BoardCommentLikeVO bvo) {
		// 좋아요 여부 확인: 반환값이 0보다 크면 이미 좋아요가 눌린 상태
		return mapper.comisLiked(bvo);
	}
	
	
	
	
}
