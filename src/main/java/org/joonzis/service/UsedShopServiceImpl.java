package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ChatRoomDTO;
import org.joonzis.domain.ChattingDTO;
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
	
	@Override
	public int chatingRoomCheck(ChatRoomDTO chat) {
		log.warn("채팅방 도착 확인");
		log.warn("채팅방 유무 확인 : " + chat);
		return mapper.chatingRoomCheck(chat);
	}
	
	@Override
	public int chatingRoomInsert(ChatRoomDTO chat) {
		log.warn("채팅방 insert : " + chat);
		return mapper.chatingRoomInsert(chat);
	}
	
	@Override
	public int getChattingNumber(ChatRoomDTO chat) {
		log.warn("채팅방 번호 조회 : " + chat);
		return mapper.getChattingNumber(chat);
	}
	
	@Override
	public int insertChattingContent(ChattingDTO chat) {
		log.warn("채팅 방 내용 insert : " + chat);
		log.warn("채팅 방 내용 insert : " + chat.getChatno());
		log.warn("채팅 방 내용 insert : " + chat.getMno());
		log.warn("채팅 방 내용 insert : " + chat.getContent());
		return mapper.insertChattingContent(chat);
	}
	
	@Override
	public List<ChattingDTO> getChattingContent(int chatno) {
		log.warn("채팅 내용 조회 : " + chatno);
		return mapper.getChattingContent(chatno);
	}
	
	@Override
	public List<ChatRoomDTO> selectSellChatRoomList(ChatRoomDTO chat) {
		log.warn("채팅 방 조회 : " + chat);
		log.warn("채팅 방 조회 구매자 : " + chat.getBuymno());
		log.warn("채팅 방 조회 판매자 : " + chat.getSellmno());
		return mapper.selectSellChatRoomList(chat);
	}
	
	@Override
	public int selectWishList(UsedBookVO vo) {
		return mapper.selectWishList(vo);
	}
	
	@Override
	public int insertWishList(UsedBookVO vo) {
		log.warn("찜 서비스 넘어온 데이터 : " + vo);
		log.warn("찜 서비스 넘어온 데이터 : " + vo.getMno());
		log.warn("찜 서비스 넘어온 데이터 : " + vo.getUbno());
		return mapper.insertWishList(vo);
	}
	
	@Override
	public int deleteWishList(UsedBookVO vo) {
		log.warn("찜 삭제 서비스 넘어온 데이터 : " + vo);
		log.warn("찜 삭제 서비스 넘어온 데이터 : " + vo.getMno());
		log.warn("찜 삭제 서비스 넘어온 데이터 : " + vo.getUbno());
		return mapper.deleteWishList(vo);
	}
	
	@Override
	public int successSell(int ubno) {
		log.warn("서비스 판매완료" + ubno);
		return mapper.successSell(ubno);
	}
	
	@Override
	public int deleteUbook(int ubno) {
		log.warn("서비스 상품 삭제 : " + ubno);
		return mapper.deleteUbook(ubno);
	}
	
	@Override
	public int updateUbook(UsedBookVO ubvo) {
		log.warn("서비스 업데이트 : " + ubvo);
		log.warn("서비스 업데이트 : " + ubvo.getUbno());
		log.warn("서비스 업데이트 : " + ubvo.getMno());
		log.warn("서비스 업데이트 : " + ubvo.getContent());
		log.warn("서비스 업데이트 : " + ubvo.getStatus());
		log.warn("서비스 업데이트 : " + ubvo.getTitle());
		log.warn("서비스 업데이트 : " + ubvo.getUbookImage());
		log.warn("서비스 업데이트 : " + ubvo.getUbookPrice());
		return mapper.updateUbook(ubvo);
	}
	
}
