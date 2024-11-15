package org.joonzis.service;

import org.joonzis.domain.RefundVO;
import org.joonzis.mapper.RefundMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class RefundServiceImpl implements RefundService{
	
	@Autowired
	private RefundMapper refundmapper;
	
	@Override
	public int totalSpendMoney(int mno) {
		
		log.info("totalSpendMoney");
		return refundmapper.totalSpendMoney(mno);
	}
	@Transactional
	@Override
	public int deleteOrder(RefundVO refundVO) {
		log.info("deleteOrder");
		int result = refundmapper.deleteOrderChild(refundVO);
		return refundmapper.deleteOrder(refundVO);
	}
	@Transactional
	@Override
	public int refundOrder(RefundVO refundVO) {
		log.info("refundOrder");
		int result = refundmapper.updateStatus(refundVO);
		return refundmapper.refundOrder(refundVO);
	}
	
	

}
