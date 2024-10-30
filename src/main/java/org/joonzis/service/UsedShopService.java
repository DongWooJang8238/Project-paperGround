package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.ChatRoomDTO;
import org.joonzis.domain.ChattingDTO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;

public interface UsedShopService {

	// ==================상품 리스트 보기 영역===================
	// 책 목록 리스트
	public List<UsedBookVO> getuBookList(Criteria cri);
	// 책 목록 카테고리 리스트
	public List<UsedBookVO> getuBookListGe(Criteria cri);
	// 전체 게시글 수
	public int getTotal();
	// 전체 게시글 수
	public int getTotalByGno(int gno);
	// ===========================================================
	
	// ==================상품 insert 영역==========================
	// 중고상품 insert
	public int usedShopInsert(UsedBookVO vo);
	// ===========================================================

	// ==================상품 단일 보기 영역==========================
	// 중고 상품 단일 보기 by.ubno
	public UsedBookVO getuBookOne(int ubno);
	// ===========================================================

	// ==================실시간 채팅 영역=============================
	// 실시간 채팅방 존재 유무 check
	public int chatingRoomCheck(ChatRoomDTO chat);
	// 채팅 방 insert
	public int chatingRoomInsert(ChatRoomDTO chat);
	// 채팅 방 번호 조회
	public int getChattingNumber(ChatRoomDTO chat);
	// 채팅 방 내용 insert
	public int insertChattingContent(ChattingDTO chat);
	// 채팅 내용 조회
	public List<ChattingDTO> getChattingContent(int chatno);
	// 채팅 방 조회 ( 판매자용 )
	public List<ChatRoomDTO> selectSellChatRoomList(ChatRoomDTO chat);
	// ===========================================================

}
