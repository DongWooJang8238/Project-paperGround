package org.joonzis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.DrVO;
import org.joonzis.domain.QnaVO;
import org.joonzis.domain.ReportBoardVO;

public interface ReportMapper {
	public List<QnaVO> getCategoryData(int qnaCategory);
	public List<QnaVO> getAllQnaData();
	public List<QnaVO> selectQnaByCategory(int qnaCategory);

	public int insertDR(DrVO drvo);
	
	public int getTotal();
	public List<ReportBoardVO> getList(Criteria cri);
	public ReportBoardVO get(int reportBoardno);
	
	public int register(ReportBoardVO rbvo);
	public int modify(ReportBoardVO rbvo);
	public int remove(int reportBoardno);
	public int boardReadCount(int reportBoardno);
	public int updateReplyCnt(@Param("reportBoardno") int reportBoardno, @Param("amount") int amount);
	public int DRsubmit(DrVO drvo);
	public int getDrTotal();
	public List<DrVO> getDrList(Criteria cri);
	public DrVO getDR(int DRNo);
	
	public int updateStatus(DrVO drVO);
	public int getTotalByCategory(String category);
	// ReportBoardService.java
	public List<ReportBoardVO> getPostsByCategory(Map<String, Object> params);



	
	
}
