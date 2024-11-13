package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.ReplyVO;
import org.joonzis.domain.ReportReplyVO;

public interface ReportReplyMapper {
	// 댓글 삽입 - 전체 데이터 삽입
	public int reportinsert(ReportReplyVO rvo);
	// 댓글 목록
	public List<ReportReplyVO> reportgetList(int reportBoardno);
	// 댓글 읽기
	public ReportReplyVO reportread(int replyno);
	// 댓글 삭제
	public int reportdelete(int replyno);
	// 댓글 삭제
	public int reportboardDelete(int reportBoardno);
	// 댓글 수정
	public int reportupdate(ReportReplyVO rvo);
}
