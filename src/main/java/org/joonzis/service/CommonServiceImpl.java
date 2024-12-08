package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.mapper.CommonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	CommonMapper mapper;
	
	@Override
	public List<BoardVO> getBoardList(Criteria cri) {
		log.warn("게시글 조회 : " + cri.getSelectValue());
		log.warn("게시글 조회 : " + cri.getSelectOption());
		return mapper.getBoardList(cri);
	}

	@Override
	public List<BookVO> getBookList(Criteria cri) {
		log.warn("상품 조회 : " + cri.getSelectValue());
		log.warn("상품 조회 : " + cri.getSelectOption());
		return mapper.getBookList(cri);
	}

	@Override
	public List<UsedBookVO> getUsedBookList(Criteria cri) {
		log.warn("중고 조회 : " + cri.getSelectValue());
		log.warn("중고 조회 : " + cri.getSelectOption());
		return mapper.getUsedBookList(cri);
	}

	@Override
	public List<WriteVO> getWriteList(Criteria cri) {
		log.warn("집필 조회 : " + cri.getSelectValue());
		log.warn("집필 조회 : " + cri.getSelectOption());
		return mapper.getWriteList(cri);
	}

}
