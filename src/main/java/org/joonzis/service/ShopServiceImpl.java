package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BookBuyListVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.OrderBookListVO;
import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.SelectDTO;
import org.joonzis.domain.UserVO;
import org.joonzis.mapper.ShopMapper;
import org.joonzis.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	ShopMapper mapper;
	
	@Override
	public List<BookVO> getBookList(Criteria cri) {
	    log.info("서비스 책리스트..");
	    List<BookVO> list = mapper.getBookList(cri);
	    list.forEach(vo -> {
	    	log.warn("서비스 책 평점 조회.." + vo.getBno());
	    	vo.setLikeCount(mapper.getTotalLikeByBno(vo.getBno()));
	    	log.warn("서비스 책 평점 조회 결과.." + vo.getLikeCount());
	    	vo.setAvgRating(mapper.selectAvgRating(vo.getBno()));
	    });
	    return list;
	}
	
	@Override
	public List<BookVO> getBookListSelect(SelectDTO sel) {
		log.warn("서비스 책 리스트 검색..." + sel.getSelectOption() + sel.getSelectValue());
		return mapper.getBookListSelect(sel);
	}

	
	@Override
	public List<BookVO> getBookListGe(Criteria cri) {
		log.info("서비스 책 카테고리 조회... " + cri);
		return mapper.getBookListCe(cri);
	}
	
	@Override
	public int getTotal() {
		log.info("토탈스..");
		return mapper.getTotal();
	}
	
	@Override
	public int getTotalByGno(int[] gno) {
		log.info("토탈스..장르.. " + gno);
		return mapper.getTotalByGno(gno);
	}
	
	@Override
	public BookVO getBookOne(int bno) {
		log.info("서비스 책 단일 데이터 조회.." + bno);
		return mapper.getBookOne(bno);
	}
	
	@Override
	public int buyList(BookBuyListVO vo) {
		log.warn("장바구니 담기 서비스.." + vo);
		BookBuyListVO bblvo= mapper.buyListCount(vo.getBno());
		log.warn("서비스 장바구니 카운트 결과.. " + bblvo);
		int result;
		if(bblvo == null) {
			result = mapper.buyList(vo);
		}else {
			result = mapper.buyListCountUp(vo);
		}
		
		return result;
	}
	
	@Override
	public List<BookBuyListVO> buyListSelect(int mno) {
		log.warn("서비스 장바구니 조회 by.mno : " + mno);
		
		return mapper.buyListSelect(mno);
	}
	
	@Override
	public int deleteCart(int bno) {
		log.warn("서비스 장바구니 삭제 by.bno : " + bno);
		return mapper.deleteCart(bno);
	}
	
	@Transactional
	@Override
	public int insertOrderDetail(OrderDetailVO vo, int check) {
		log.warn("서비스 인서트 상세주문" + vo);
		// 상세 주문 테이블에 데이터 저장
		int result = mapper.insertOrderDetail(vo);
		log.warn("서비스 인서트 상세주문 결과 .. " + result);
		
		// 유저가 데이터 저장 눌렀으면 유저 데이터 저장
		log.warn("체크체크체크체크" + check);
		if(check == 1) {
			// 유저 vo에 담아서 update
			UserVO uservo = new UserVO();
			uservo.setMno(vo.getMno());
			uservo.setAddress(vo.getOrderAddress());
			uservo.setStreetAddress(vo.getOrderStreetAddress());
			uservo.setDetailAddress(vo.getOrderDetailAddress());
			uservo.setUserPhonenumber(vo.getOrderPhone());
			
			int updateResult = mapper.checkUserUpdate(uservo);
			log.warn("유저정보 업데이트 결과 : " + updateResult);
		}
		log.warn("서비스 장바구니 삭제 mno .. " + vo.getMno());
		
		// 장바구니에 담긴 데이터 삭제
		int deleteCart = mapper.deleteCartAll(vo.getMno());
		log.warn("서비스 장바구니 삭제 결과.." + deleteCart);
		return result;
	}
	
	@Transactional
	@Override
	public int insertOrderDetailOne(OrderDetailVO vo, int check) {
		log.warn("서비스 인서트 상세주문" + vo);
		// 상세 주문 테이블에 데이터 저장
		int result = mapper.insertOrderDetail(vo);
		log.warn("서비스 인서트 상세주문 결과 .. " + result);
		
		// 유저가 데이터 저장 눌렀으면 유저 데이터 저장
		log.warn("체크체크체크체크" + check);
		if(check == 1) {
			// 유저 vo에 담아서 update
			UserVO uservo = new UserVO();
			uservo.setMno(vo.getMno());
			uservo.setAddress(vo.getOrderAddress());
			uservo.setStreetAddress(vo.getOrderStreetAddress());
			uservo.setDetailAddress(vo.getOrderDetailAddress());
			uservo.setUserPhonenumber(vo.getOrderPhone());
			
			int updateResult = mapper.checkUserUpdate(uservo);
			log.warn("유저정보 업데이트 결과 : " + updateResult);
		}
		return result;
	}
	
	@Override
	public int selectOrderDetailOdno(int mno) {
		return mapper.selectOrderDetailOdno(mno);
	}
	
	@Override
	public OrderDetailVO selectOrderDetailByMno(int mno) {
		log.warn("서비스 상세 주문 셀렉트.. " + mno);
		return mapper.selectOrderDetailByMno(mno);
	}

	@Override
	public OrderDetailVO selectOrderDetailByOdno(int odno) {
		log.warn("서비스 상세 주문 셀렉트.. " + odno);
		return mapper.selectOrderDetailByOdno(odno);
	}
	
	@Override
	public int selectOrderDetail(int mno) {
		log.warn("서비스 상세 주문 셀렉트.. " + mno);
		return mapper.selectOrderDetailOdno(mno);
	}
	
	@Override
	public int insertOrderBookList(OrderBookListVO vo) {
		log.warn("서비스 인서트 주문리스트");
		return mapper.insertOrderBookList(vo);
	}
	
	@Override
	public int cuNext(BookBuyListVO bblvo) {
		log.warn("서비스 찜 리스트 추가.." + bblvo);
		return mapper.cuNext(bblvo);
	}
	
	@Override
	public int selectCuNext(BookBuyListVO bblvo) {
		log.warn("서비스 찜 리스트 조회.." + bblvo);
		return mapper.selectCuNext(bblvo);
	}
	
	@Override
	public int getDeleteBook(int bno) {
		log.warn("서비스 상품 삭제.. : " + bno);
		return mapper.getDeleteBook(bno);
	}

	@Override
	public int insertShopBook(BookVO vo) {
		log.warn("책 데이터 인서트.." + vo);
		return mapper.insertShopBook(vo);
	}
}
