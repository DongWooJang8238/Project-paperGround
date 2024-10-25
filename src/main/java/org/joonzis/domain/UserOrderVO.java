package org.joonzis.domain;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserOrderVO {
	private int mno, odno, bno, totalPrice, count,bookPrice, usePoint;
	private String orderAddr, orderPhone, orderStatus,bookCover,title;
	
	private Date orderDate;
	
	private String selectDay;
	private String startDate;
	private String endDate;
}
