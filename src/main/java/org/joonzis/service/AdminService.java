package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.UserVO;

public interface AdminService {

	public int getUserTotal();

	public List<UserVO> getUserList(Criteria cri);

	public int changeRole(UserVO uservo);




}
