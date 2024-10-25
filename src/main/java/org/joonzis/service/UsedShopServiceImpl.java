package org.joonzis.service;

import java.util.ArrayList;
import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.usedBookImgVO;
import org.joonzis.mapper.UsedShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UsedShopServiceImpl implements UsedShopService{
	
	@Autowired
	private UsedShopMapper mapper;
	
	@Override
	public List<UsedBookVO> getuBookList(Criteria cri) {
	    log.info("서비스 책리스트.." + cri);
	    List<UsedBookVO> list = mapper.getuBookList(cri);
	    list.forEach(vo -> {
	    	log.warn("서비스 중고책 제목 조회.." + vo.getTitle());
	    	log.warn("서비스 중고책 이미지 조회.." + vo.getUbookImage());
	    });
	    return list;
	}



	
	@Override
	public List<UsedBookVO> getuBookListGe(Criteria cri) {
		log.info("서비스 책 카테고리 조회... " + cri);
		return mapper.getuBookListGe(cri);
	}
	
	@Override
	public int getTotal() {
		log.info("토탈스..");
		return mapper.getTotal();
	}
	
	@Override
	public int getTotalByGno(int gno) {
		log.info("토탈스..장르.. " + gno);
		return mapper.getTotalByGno(gno);
	}
	
	@Transactional
	@Override
	public int usedShopInsert(UsedBookVO vo) {
		log.warn("중고상품 입력 서비스..." + vo);
		// 중고 상품 db에 저장
		int result = mapper.usedShopInsert(vo);
		log.warn("중고상품 입력 결과.. : " + result);
		int ubno = mapper.selectUbno();
		log.warn("ubno 조회.. : " + ubno);
		if(vo.getUsedBookImgs() != null) {
			// 저장이 완료됬다면, 이미지 파일들 저장
			for (usedBookImgVO ubivo : vo.getUsedBookImgs()) {
				ubivo.setUbno(ubno);
				log.warn("중고 이미지 이름 : " + ubivo.getUbookimage());
				log.warn("중고 이미지 번호 : " + ubivo.getUbno());
				int imgResult = mapper.usedShopImgInsert(ubivo);
				log.warn("중고 이미지 입력 결과.. : " + imgResult);
			}
		}
		
		return result;
	}
	
	@Override
	public UsedBookVO getuBookOne(int ubno) {
		log.warn("서비스 단일 책 조회 : " + ubno);
		
		// vo 데이터 조회
		UsedBookVO vo = mapper.getuBookOne(ubno);
		
		// 조회 결과 확인
		log.warn("서비스 단일 책 조회 결과 : " + vo.getContent());
		log.warn("서비스 단일 책 조회 결과 : " + vo.getTitle());
		log.warn("서비스 단일 책 조회 결과 : " + vo.getUbookImage());
		log.warn("서비스 단일 책 조회 결과 : " + vo.getUbookPrice());
		log.warn("서비스 단일 책 조회 결과 : " + vo.getUbookDate());
		log.warn("서비스 단일 책 조회 결과 : " + vo.getMno());
		log.warn("서비스 단일 책 조회 결과 : " + vo.getStatus());
		
		// vo의 책 이미지에 데이터 저장
		List<usedBookImgVO> list = mapper.getuBookImgByUbno(ubno);
		vo.setUsedBookImgs(list);
		
		// vo의 책 이미지 저장 결과 확인
		vo.getUsedBookImgs().forEach(i -> {
			log.warn("vo 이미지 저장 결과 : " + i.getUbookimage());
		});
		
		return vo;
	}
}
