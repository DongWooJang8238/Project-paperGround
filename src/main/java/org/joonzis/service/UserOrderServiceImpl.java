package org.joonzis.service;


import java.util.List;

import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.UserOrderVO;
import org.joonzis.mapper.UserOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserOrderServiceImpl implements UserOrderService {
	
	@Autowired
	private UserOrderMapper mapper;
	
	// 유저 주문내역 조회
	@Override
	public List<UserOrderVO> userOrderSelect(int mno) {
		log.warn("서비스 : " + mno);
		return mapper.userOrderSelect(mno);
	}
	
	// 총 주문내역 조회
	@Override
	public int orderCount(int mno) {
		return mapper.orderCount(mno);
	}
	
	// 오늘/어제/3달전 조회
	@Override
	public List<UserOrderVO> selectDays(UserOrderVO vo) {
		return mapper.selectDays(vo);
	}
	
	// 캘린더로 조회
	@Override
	public List<UserOrderVO> selectCalendar(UserOrderVO vo) {
		return mapper.selectCalendar(vo);
	}
	
	// 주문 상세내역 조회
	@Override
	public List<UserOrderVO> myPageUserOrderDetail(UserOrderVO vo) {
		return mapper.myPageUserOrderDetail(vo);
	}
	// 유저 주문내역 조회 (조인 X 버전)
	@Override
	public List<OrderDetailVO> NewuserOrderSelect(int mno) {
		return mapper.NewuserOrderSelect(mno);
	}
	
	@Override
	public List<UserOrderVO> selectOrderByOdno(int odno) {
		log.warn("서비스 유저 주문내역 조회 by odno : " + odno);
		return mapper.selectOrderByOdno(odno);
	}
}
