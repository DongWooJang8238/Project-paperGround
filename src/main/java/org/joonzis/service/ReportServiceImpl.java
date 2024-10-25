package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.DrVO;
import org.joonzis.domain.QnaVO;
import org.joonzis.domain.ReportBoardVO;
import org.joonzis.mapper.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportMapper reportmapper;
	
	@Override
	public List<QnaVO> getCategoryData(int categoryId) {
		log.warn(categoryId);
		return reportmapper.getCategoryData(categoryId);
	}
	
	@Override
	public List<QnaVO> getAllQnaData() {
		log.warn("select all loading...");
		return reportmapper.getAllQnaData();
	}
	
	@Override
	public List<QnaVO> selectQnaByCategory(int qnaCategory) {
		log.warn("select one loading...");
		return reportmapper.selectQnaByCategory(qnaCategory);
	}
	@Override
	public int insertDR(DrVO drvo) {
		log.warn("select one loading...");
		return reportmapper.insertDR(drvo);
	}
	@Override
	public int getTotal() {
		log.warn("get total loading...");
		return reportmapper.getTotal();
	}
	@Override
	public List<ReportBoardVO> getList(Criteria cri) {
		log.warn("getList loading...");
		return reportmapper.getList(cri);
	}
	@Override
	public int insertReport(ReportBoardVO reportBoard) {
		log.warn("insertReport loading...");
		return reportmapper.insertReport(reportBoard);
	}

}
