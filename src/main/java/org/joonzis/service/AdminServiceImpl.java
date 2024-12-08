package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UserVO;
import org.joonzis.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminmapper;
	
	@Override
	public List<UserVO> getUserList(Criteria cri) {
		log.info("getUserList...");
		return adminmapper.getUserList(cri);
	}
	@Override
	public int getUserTotal() {
		log.info("getUserTotal...");
		return adminmapper.getUserTotal();
	}
	@Override
	public int changeRole(UserVO uservo) {
		log.info("changeRole...");
		return adminmapper.changeRole(uservo);
	}
	@Override
	public int userCut(String userId) {
		log.info("userCut...");
		return adminmapper.userCut(userId);
	}
	@Override
	public int getAllListTotal() {
		log.info("getAllListTotal...");
		return adminmapper.getAllListTotal();
	}
	@Override
	public List<BoardVO> getAllList(Criteria cri) {
		log.info("getAllList...");
		return adminmapper.getAllList(cri);
	}
	@Override
	public int scriptCut(int boardno) {
		log.info("scriptCut...");
		return adminmapper.scriptCut(boardno);
	}
	@Override
	public int getCategoryListTotal(String category) {
		log.info("getCategoryListTotal...");
		return adminmapper.getCategoryListTotal(category);
	}
	@Override
	public List<BoardVO> getCategoryList(Criteria cri) {
		log.info("getCategoryList...");
		return adminmapper.getCategoryList(cri);
	}
	


}
