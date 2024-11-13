package org.joonzis.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.ReportBoardVO;

public interface ReportBoardService {
	
	public List<ReportBoardVO> getList(Criteria cri);
	
	// 단일 데이터
	public ReportBoardVO get(int reportBoardno);
	
	// 데이터 삽입
	public int register(ReportBoardVO rbvo);
	
	// 데이터 수정
	public int modify(ReportBoardVO rbvo);
	
	// 데이터 삭제
	public int remove(int reportBoardno);
	
	
	public int getTotal();
	
	// 게시글 조회수
	public int boardReadCount(int reportBoardno);
	
	public int updateReplyCnt(@Param("reportBoardno") int reportBoardno, @Param("amount") int amount);

	public int getTotalByCategory(String category);

	// ReportBoardService.java
	public List<ReportBoardVO> getPostsByCategory(Map<String, Object> params);

	
	

}
