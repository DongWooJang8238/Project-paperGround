package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BookBuyListVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.OrderBookListVO;
import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.SelectDTO;

public interface ShopService {
	public List<BookVO> getBookList(Criteria cri);

	public List<BookVO> getBookListGe(Criteria cri);

	public int getTotal();

	public int getTotalByGno(int[] gno);

	public int insertShopBook(BookVO vo);

	public BookVO getBookOne(int bno);

	public int buyList(BookBuyListVO vo);

	public List<BookBuyListVO> buyListSelect(int mno);

	public int deleteCart(int bno);

	public int selectOrderDetail(int mno);

	public int insertOrderDetail(OrderDetailVO vo, int check);
	
	public int insertOrderDetailOne(OrderDetailVO vo, int check);

	public int insertOrderBookList(OrderBookListVO vo);
	
	public OrderDetailVO selectOrderDetailByMno(int mno);

	public OrderDetailVO selectOrderDetailByOdno(int odno);

	public int selectOrderDetailOdno(int mno);

	public int cuNext(BookBuyListVO bblvo);

	public int selectCuNext(BookBuyListVO bblvo);

	public List<BookVO> getBookListSelect(SelectDTO sel);

	// 상품 삭제
	public int getDeleteBook(int bno);
}
