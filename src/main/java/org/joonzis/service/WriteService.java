package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.WriteEpisodeVO;
import org.joonzis.domain.WriteVO;

public interface WriteService {
	// 작품 전체 조회
	public List<WriteVO> selectWriteAll();
	// userNickName 조회
	public String userNickName(int mno);
	// 작품 등록이 이미 되었는지 확인 ( 새로고침 등 )
	public int selectCountWriting(WriteVO vo);
	// 작품 등록 관련
	public int writeInsert(WriteVO vo);
	// 가장 최근 wno 가져오기
	public int writeWnoSelect(int mno);
	// wno로 에피소드회차 구하기
	public int episodeCount(int wno);
	// 에피소드 등록
	public int writeInsertEpisode(WriteEpisodeVO vo);
}
