package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.WriteEpisodeVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.mapper.WriteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class WriteServiceImpl implements WriteService {
	
	@Autowired
	WriteMapper mapper;
	
	@Override
	public List<WriteVO> selectWriteAll() {
		return mapper.selectWriteAll();
	}
	
	@Override
	public String userNickName(int mno) {
		return mapper.userNickName(mno);
	}
	
	@Override
	public int selectCountWriting(WriteVO vo) {
		log.warn("서비스 작품 등록 조회 : " + vo);
		log.warn("서비스 작품 등록 조회 : " + vo.getMno());
		log.warn("서비스 작품 등록 조회 : " + vo.getTitle());
		return mapper.selectCountWriting(vo);
	}
	
	@Override
	public int writeInsert(WriteVO vo) {
		log.warn("서비스 작품 등록 : " + vo);
		log.warn("서비스 작품 등록 : " + vo.getMno());
		log.warn("서비스 작품 등록 : " + vo.getTitle());
		log.warn("서비스 작품 등록 : " + vo.getWriteType());
		log.warn("서비스 작품 등록 : " + vo.getGenre());
		log.warn("서비스 작품 등록 : " + vo.getDescription());
		log.warn("서비스 작품 등록 : " + vo.getCoverImage());
		return mapper.writeInsert(vo);
	}
	
	@Override
	public int writeWnoSelect(int mno) {
		log.warn("최근 wno 조회 서비스 .. : " + mno);
		return mapper.writeWnoSelect(mno);
	}
	
	@Override
	public int episodeCount(int wno) {
		log.warn("에피소드 회차 구하기 : " + wno);
		return mapper.episodeCount(wno);
	}
	
	@Override
	public int writeInsertEpisode(WriteEpisodeVO vo) {
		log.warn("에피소드 등록 서비스 .. : " + vo);
		log.warn("에피소드 등록 서비스 .. : " + vo.getContent());
		log.warn("에피소드 등록 서비스 .. : " + vo.getEpisodeComment());
		log.warn("에피소드 등록 서비스 .. : " + vo.getEpisodeCount());
		log.warn("에피소드 등록 서비스 .. : " + vo.getEpisodeTitle());
		log.warn("에피소드 등록 서비스 .. : " + vo.getWno());
		return mapper.writeInsertEpisode(vo);
	}
}
