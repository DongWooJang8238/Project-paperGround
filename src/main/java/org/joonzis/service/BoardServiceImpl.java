package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardAttachVO;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.mapper.BoardAttachMapper;
import org.joonzis.mapper.BoardLikeMapper;
import org.joonzis.mapper.BoardMapper;
import org.joonzis.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private ReplyMapper replymapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	@Autowired
	private BoardLikeMapper likeMapper;
	
//	@Override
//	public List<BoardVO> getList() {
//		log.info("getList..." );
//		return mapper.getList();
//	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		return mapper.getList(cri);
	}
	
	@Transactional
	@Override
	public int register(BoardVO bvo) {
		log.info("register..." + bvo);
		
		// 1. table_board 게시글 등록
		int result = mapper.register(bvo);
		
		log.warn("게시글 등록 결과" + result);
		
		log.warn("게시글 번호" + bvo.getBoardno());
		
		// 2. table_attach 등록
		if (bvo.getAttachList() != null && bvo.getAttachList().size() > 0) {
			bvo.getAttachList().forEach(attach -> {
		        attach.setBoardno(bvo.getBoardno());  // 게시글 번호 설정
		        log.warn("아타치 등록 데이터 : " + attach.getBoardno());
		        int atResult = attachMapper.register(attach);       // 첨부 파일 등록
		        log.warn("아타치 등록 결과 : " + atResult);
		    });
		}
	
		return result;
	}

	@Override
	public int modify(BoardVO bvo) {
		log.info("modify..." + bvo);
		return mapper.modify(bvo);
	}

	@Transactional
	@Override
	public int remove(int boardno) {
		log.info("remove..." + boardno);
		
		replymapper.boardDelete(boardno);
		attachMapper.deleteBoard(boardno);
		likeMapper.deleteBoard(boardno);
		
		return mapper.remove(boardno);
	}

	@Override
	public BoardVO get(int boardno) {
		log.info("get..." + boardno);
		return mapper.get(boardno);
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}
	
	
	@Override
	public void boardReadCount(int boardno) {
        log.info("게시글 조회수..." + boardno);
        mapper.boardReadCount(boardno);
    }

	@Override
	public List<BoardAttachVO> getAttachList(int boardno) {
		 log.info("getAttachList... " + boardno);
		return attachMapper.findByBoardno(boardno);
	}

	@Override
	public int getLikeCount(int boardno) {
		log.warn("서비스 게시글 좋아요 수" + boardno);
		return mapper.getLikeCount(boardno);
	}
	
	
}
