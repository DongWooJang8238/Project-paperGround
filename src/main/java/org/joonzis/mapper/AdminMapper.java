package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.UserVO;

public interface AdminMapper {

	public int getUserTotal();

	public List<UserVO> getUserList(Criteria cri);

	public int changeRole(UserVO uservo);



}
