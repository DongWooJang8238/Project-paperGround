package org.joonzis.mapper;

import org.joonzis.domain.RefundVO;

public interface RefundMapper {

	public int totalSpendMoney(int mno);
	public int deleteOrder(RefundVO refundVO);
	public int refundOrder(RefundVO refundVO);
	public int deleteOrderChild(RefundVO refundVO);
	public int updateStatus(RefundVO refundVO);
	


	


}
