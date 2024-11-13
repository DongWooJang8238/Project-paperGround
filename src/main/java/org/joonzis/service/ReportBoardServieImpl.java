package org.joonzis.service;

import java.util.List;
import java.util.Map;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.ReportBoardVO;
import org.joonzis.mapper.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class ReportBoardServieImpl implements ReportBoardService{
	
	@Autowired
	private ReportMapper reportMapper;
	
	
	@Override
	public List<ReportBoardVO> getList(Criteria cri) {
		log.info("ReportBoardgetList...");
		return reportMapper.getList(cri);
	}
	
	@Override
	public ReportBoardVO get(int reportBoardno) {
		log.info("ReportBoardget...");
		return reportMapper.get(reportBoardno);
	}	
	
	@Override
	public int register(ReportBoardVO rbvo) {
		log.info("ReportBoardregister...");
		return reportMapper.register(rbvo);
	}
	
	@Override
	public int modify(ReportBoardVO rbvo) {
		log.info("ReportBoard remove...");
		return reportMapper.modify(rbvo);
	}
	@Override
	public int remove(int reportBoardno) {
		log.info("ReportBoard remove...");
		return reportMapper.remove(reportBoardno);
	}
	@Override
	public int getTotal() {
		log.info("ReportBoard getTotal...");
		return reportMapper.getTotal();
	}
	@Override
	public int boardReadCount(int reportBoardno) {
		log.info("ReportBoard boardReadCount...");
		return reportMapper.boardReadCount(reportBoardno);
	}
	@Override
	public int updateReplyCnt(int reportBoardno, int amount) {
		log.info("ReportBoard boardReadCount...");
		return reportMapper.updateReplyCnt(reportBoardno,amount);
	}
	@Override
	public int getTotalByCategory(String category) {
		log.info("ReportBoard boardReadCount...");
		return reportMapper.getTotalByCategory(category);
	}
	@Override
	public List<ReportBoardVO> getPostsByCategory(Map<String, Object> params) {
		log.info("getPostsByCategory boardReadCount...");
		return reportMapper.getPostsByCategory(params);
	}
	

}
