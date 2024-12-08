package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.mapper.MainMapper;
import org.joonzis.mapper.WriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainMapper mapper;
	
	@Override
	public List<BookVO> selectBestSellerList() {
		return mapper.selectBestSellerList();
	}
	
	@Override
	public List<BoardVO> selectBestLikesBoardList() {
		return mapper.selectBestLikesBoardList();
	}
	
	@Override
	public List<BookVO> selectUserRecommendBookLike() {
		return mapper.selectUserRecommendBookLike();
	}
	
	@Override
	public List<BoardVO> selectAnnouncementList() {
		return mapper.selectAnnouncementList();
	}
	
	@Override
	public List<WriteVO> selectBestLikesWriteList() {
		return mapper.selectBestLikesWriteList();
	}
	
	
}
