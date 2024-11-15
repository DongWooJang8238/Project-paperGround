package org.joonzis.mapper;

import java.sql.Date;
import java.util.List;

import org.joonzis.domain.WriteEpisodeVO;
import org.joonzis.domain.WriteVO;

public interface WriteMapper {
	// 작품 전체 조회
	public List<WriteVO> selectWriteAll();
	// 내 작품 조회
	public List<WriteVO> selectWriteByMno(int mno);
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
	// wno로 에피소드 목록 가져오기
	public List<WriteEpisodeVO> selectEpisodeByWno(int wno);
	// wno로 작품정보(단일) 조회
	public WriteVO selectWriteByWno(int wno);
	// 수정할 에피소드 회차 정보 가져오기
	public WriteEpisodeVO selectEpisodeByEpno(int episodeno);
	// 에피소드 수정 하기
	public int writeUpdateEpisode(WriteEpisodeVO vo);
	// 에피소드 수정 및 연재 시 작품 업데이트 날짜 업데이트
	public int updateWriteDate(int wno);
	// 에피소드 마지막으로 본 회차 날짜 구하기
	public Date getLastDateByEpnoMno(WriteEpisodeVO vo);
	// 조회수 업데이트
	public int updateWriteView(int wno);
	// 좋아요 업데이트 위한것들
	// 1. 좋아요 눌렀는지 체크
	public int checkLike(WriteVO vo);
	// 2. 안눌렀을 때 - 인서트
	public int insertLike(WriteVO vo);
	// 3. 이미 눌렀을 때 - 딜리트
	public int deleteLike(WriteVO vo);
}
