package org.joonzis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;

public interface BoardMapper {
	// 전체 데이터 조회
//	public List<BoardVO> getList();

	public List<BoardVO> getList(Criteria cri);
	// 데이터 삽입
	public int register(BoardVO bvo);

	// 단일 데이터 - boardno 값으로 데이터 조회
	public BoardVO get(int boardno);

	// 데이터 삭제 = boardno 값으로 삭제
	public int remove(int boardno);

	// 데이터 수정 - 특정 boardno의 title, content, writer 수정
	public int modify(BoardVO bvo);

	// 전체 게시글 수
	public int getTotal();

	// 게시글 조회수
	public int boardReadCount(int boardno);

	// 댓글 수 수정
	public int updateReplyCnt(@Param("boardno") int boardno, @Param("amount") int amount);
	
	// 좋아요 수 조회
	public int getLikeCount(int boardno);
	public List<BoardVO> getListByCategory(Criteria cri);
	
	public int getTotalByCategory(String category);
	
	public List<BoardVO> bestList1(Criteria cri);
	
}
