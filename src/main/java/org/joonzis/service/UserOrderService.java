package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.OrderDetailVO;
import org.joonzis.domain.UserOrderVO;

public interface UserOrderService {
	// 유저 주문내역 조회
	public List<UserOrderVO> userOrderSelect(int mno);

	// 총 주문내역 조회
	public int orderCount(int mno);
	public int orderCountWe(int mno);

	// 오늘/어제/3달전 조회
	public List<UserOrderVO> selectDays(UserOrderVO vo);

	// 캘린더로 조회
	public List<UserOrderVO> selectCalendar(UserOrderVO vo);

	// 주문 상세내역 조회
	public List<UserOrderVO> myPageUserOrderDetail(UserOrderVO vo);

	// 유저 주문내역 조회 (조인 X 버전)
	public List<OrderDetailVO> NewuserOrderSelect(int mno);
	public List<OrderDetailVO> NewuserOrderSelectWe(int mno);

	// 유저 주문내역 조회 ( by.odno )
	public List<UserOrderVO> selectOrderByOdno(int odno);
}
