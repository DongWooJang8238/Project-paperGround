package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.DrVO;
import org.joonzis.domain.QnaVO;
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
	public int DRsubmit(DrVO drvo) {
		log.warn("DRsubmit one loading...");
		return reportmapper.DRsubmit(drvo);
	}
	@Override
	public int getDrTotal() {
		log.warn("getDrTotal one loading...");
		return reportmapper.getDrTotal();
	}
	@Override
	public int getUserTotal(int mno) {
		log.warn("getDrTotal one loading...");
		return reportmapper.getUserTotal(mno);
	}
	
	@Override
	public List<DrVO> getUserDrList(Criteria cri ) {
		log.warn("getUserDrList one loading...");
		// TODO Auto-generated method stub
		return reportmapper.getUserDrList(cri);
	}
	
	@Override
	public List<DrVO> getDrList(Criteria cri) {
		log.warn("getDrList one loading...");
		return reportmapper.getDrList(cri);
	}
	@Override
	public DrVO getDR(int DRNo) {
		log.warn("getDR one loading...");
		return reportmapper.getDR(DRNo);
	}
	@Override
	public int updateStatus(DrVO drVO) {
		log.warn("getDR one loading...");
		log.warn("업데이트 : " + drVO.getStatus());
		log.warn("업데이트 : " + drVO.getDrno());
		return reportmapper.updateStatus(drVO);
	}

}
