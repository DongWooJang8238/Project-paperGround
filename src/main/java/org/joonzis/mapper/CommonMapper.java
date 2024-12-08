package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.WriteVO;

public interface CommonMapper {
	// 게시글 데이터 조회
	public List<BoardVO> getBoardList(Criteria cri);
	// 상품 데이터 조회
	public List<BookVO> getBookList(Criteria cri);
	// 중고 데이터 조회
	public List<UsedBookVO> getUsedBookList(Criteria cri);
	// 집필 데이터 조회
	public List<WriteVO> getWriteList(Criteria cri);
}
