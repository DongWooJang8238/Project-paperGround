package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UserVO;

public interface AdminService {

	public int getUserTotal();

	public List<UserVO> getUserList(Criteria cri);

	public int changeRole(UserVO uservo);

	public int userCut(String userId);

	public int getAllListTotal();

	public List<BoardVO> getAllList(Criteria cri);

	public int scriptCut(int boardno);

	public int getCategoryListTotal(String category);

	public List<BoardVO> getCategoryList(Criteria cri);




}
