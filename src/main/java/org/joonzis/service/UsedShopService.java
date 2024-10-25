package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;

public interface UsedShopService {
	public List<UsedBookVO> getuBookList(Criteria cri);

	public List<UsedBookVO> getuBookListGe(Criteria cri);

	public int getTotal();

	public int getTotalByGno(int gno);

	public int usedShopInsert(UsedBookVO vo);

	// 중고 상품 단일 보기 by.ubno
	public UsedBookVO getuBookOne(int ubno);
}
