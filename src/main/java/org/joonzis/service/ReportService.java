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

	public int getTotal();

	public List<ReportBoardVO> getList(Criteria cri);

	public int insertReport(ReportBoardVO reportBoard);
	

}
