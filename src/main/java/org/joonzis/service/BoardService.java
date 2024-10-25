package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardAttachVO;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;

public interface BoardService {
	// 전체 리스트
//	public List<BoardVO> getList();
	public List<BoardVO> getList(Criteria cri);
	// 단일 데이터
	public BoardVO get(int boardno);
	// 데이터 삽입
	public int register(BoardVO bvo);
	// 데이터 수정
	public int modify(BoardVO bvo);
	// 데이터 삭제
	public int remove(int boardno);
	// 전체 게시글 수
	public int getTotal();
	// 게시글 조회수
	public void boardReadCount(int boardno);
	// 첨부 파일 리스트
	public List<BoardAttachVO> getAttachList(int boardno);
	
	// 좋아요 수 조회
	public int getLikeCount(int boardno);
	
}
