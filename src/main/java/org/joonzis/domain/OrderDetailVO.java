package org.joonzis.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO {
	private int odno, mno, bno, totalPrice, point, bookTypeCount;
	private String orderName, orderPhone, orderAddress, orderStreetAddress, orderDetailAddress, userDeposit, orderStatus, orderMainBookName, orderMainImage;
	private Date orderDate;
	
	private List<OrderBookListVO> list;
}
