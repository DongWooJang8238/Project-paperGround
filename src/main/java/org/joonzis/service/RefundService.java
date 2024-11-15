package org.joonzis.service;

import org.joonzis.domain.RefundVO;

public interface RefundService {

	public int totalSpendMoney(int mno);

	public int deleteOrder(RefundVO refundVO);

	public int refundOrder(RefundVO refundVO);


}
