package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReplyVO;
import org.joonzis.domain.ReportReplyVO;
import org.joonzis.mapper.BoardMapper;
import org.joonzis.mapper.ReplyMapper;
import org.joonzis.mapper.ReportMapper;
import org.joonzis.mapper.ReportReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReportReplyServiceImpl implements ReportReplyService{
	
	@Autowired
	private ReportMapper boardMapper;
	
	@Autowired
	private ReportReplyMapper reportMapper;
	
	@Transactional
	@Override
	public int reportinsert(ReportReplyVO rvo) {
		log.info("report insert..." + rvo);
		boardMapper.updateReplyCnt(rvo.getReportBoardno(), 1);
		return reportMapper.reportinsert(rvo);
	}
/////////////////////////////////////////////////////////////////////
	@Override
	public List<ReportReplyVO> reportgetList(int reportBoardno) {
		log.info("댓글getList..." + reportBoardno);
		// TODO Auto-generated method stub
		return reportMapper.reportgetList(reportBoardno);
	}
////////////////////////////////////////////////////////////
	@Override
	public ReportReplyVO reportread(int replyno) {
		log.info("read..." + replyno);
		// TODO Auto-generated method stub
		return reportMapper.reportread(replyno);
	}
////////////////////////////////////////////////////////////
	@Transactional
	@Override
	public int reportdelete(int replyno) {
		log.info("delete..." + replyno);
		ReportReplyVO rrvo = reportMapper.reportread(replyno);
		boardMapper.updateReplyCnt(rrvo.getReportBoardno(), -1);
		
		return reportMapper.reportdelete(replyno);
	}
////////////////////////////////////////////////////////////

	@Override
	public int reportupdate(ReportReplyVO rvo) {
		log.warn("update..." + rvo.getReply());
		return reportMapper.reportupdate(rvo);
	}
	
}
