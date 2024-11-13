package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.DrVO;
import org.joonzis.domain.QnaVO;
import org.joonzis.domain.ReportBoardVO;

public interface ReportService {

	public List<QnaVO> getCategoryData(int categoryId);

	public List<QnaVO> getAllQnaData();
	public List<QnaVO> selectQnaByCategory(int qnaCategory);

	public int insertDR(DrVO drvo);

	public int DRsubmit(DrVO drvo);

	public int getDrTotal();
	public List<DrVO> getDrList(Criteria cri);

	public DrVO getDR(int DRNo);

	public int updateStatus(DrVO drVO);




}
