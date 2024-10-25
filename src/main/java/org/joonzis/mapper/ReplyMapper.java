package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ReplyVO;

public interface ReplyMapper {
	// 댓글 삽입 - 전체 데이터 삽입
	public int insert(ReplyVO rvo);
	// 댓글 목록
	public List<ReplyVO> getList(int boardno);
	// 댓글 읽기
	public ReplyVO read(int replyno);
	// 댓글 삭제
	public int delete(int replyno);
	// 댓글 삭제
	public int boardDelete(int boardno);
	// 댓글 수정
	public int update(ReplyVO rvo);
}
