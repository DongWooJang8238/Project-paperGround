package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ReplyVO;
import org.joonzis.mapper.BoardMapper;
import org.joonzis.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyMapper mapper;
	
	@Autowired
	private BoardMapper boardMapper;

	
	@Transactional
	@Override
	public int insert(ReplyVO rvo) {
		log.info("insert..." + rvo);
		
		//replycnt 값 증가 - 댓글 등록시 증가
		boardMapper.updateReplyCnt(rvo.getBoardno(), 1);
		
		return mapper.insert(rvo);
	}

	@Override
	public List<ReplyVO> getList(int boardno) {
		log.info("댓글getList..." + boardno);
		return mapper.getList(boardno);
	}

	@Override
	public ReplyVO read(int replyno) {
		log.info("read..." + replyno);
		return mapper.read(replyno);
	}

	@Transactional
	@Override
	public int delete(int replyno) {
		log.info("delete..." + replyno);
				
		//replycnt 값 증가 - 댓글 등록시 증가
		ReplyVO rvo = mapper.read(replyno);
		boardMapper.updateReplyCnt(rvo.getBoardno(), -1);
		
		return mapper.delete(replyno);
	}

	@Override
	public int update(ReplyVO rvo) {
		log.warn("update..." + rvo.getReply());
		return mapper.update(rvo);
	}
	
	
}
