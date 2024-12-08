package org.joonzis.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	// 유저 아이디 중복 검색 ( 회원가입 )
	@Override
	public int selectUsername(String userId) {
		log.warn("아이디 중복검색 : " + userId);
		return userMapper.selectUsername(userId);
	}
	
	// 로그인 ( ID & PW 검증 )
	@Override
	public int selectUserPw(UserVO vo) {
		log.warn("Service 아이디&비밀번호 : " + vo.getUserId());
		log.warn("Service 아이디&비밀번호 : " + vo.getUserPw());
		return userMapper.selectUserPw(vo);
	}
	
	// 회원가입 ( DATA INSERT )
	@Override
	public int signup_insert(UserVO vo) {
		log.warn("Service 회원가입 성공 : " + vo);
		log.warn("이름 : " + vo.getUserName());
		log.warn("아이디  :" +vo.getUserId());
		log.warn("비밀번호 :" + vo.getUserPw());
		log.warn("이메일  :" + vo.getUserEmail());
		return userMapper.signup_insert(vo);
	}

	// 유저 아이디 찾기
	@Override
	public int findUserId(UserVO vo) {
		log.warn("유저 이름 찾기 : " + vo.getUserName());
		log.warn("유저 이메일  : " + vo.getUserEmail());
		return userMapper.findUserId(vo);
	}
	
	// 유저 ID 검색
	@Override
	public UserVO selectUserIdByEmail(UserVO vo) {
		log.warn("유저 아이디 찾기 : " + vo.getUserEmail());
		return userMapper.selectUserIdByEmail(vo);
	}
	
	// 비밀번호 찾기 출력 ( 아이디/이메일 인증번호 보내기 전 )
	@Override
	public UserVO findUserIdEmail(UserVO vo) {
		log.warn("유저 아이디/이메일 찾기 " );
		return userMapper.findUserIdEmail(vo);
	}
	
	// 비밀번호 재확인(수정페이지 가기 전)
	@Override
	public UserVO checkPassword(UserVO vo) {
		return userMapper.checkPassword(vo);
	}
	
	@Override
	public int updatePw(UserVO vo) {
		return userMapper.updatePw(vo);
	}
	
	// 마이페이지 아이디 검색
	@Override
	public UserVO selectUserId(String userId) {
		return userMapper.selectUserId(userId);
	}
	
	// 아이콘 업데이트
	@Override
	public int updateIcon(UserVO vo) {
		return userMapper.updateIcon(vo);
	}
	
	// 유저 정보 업데이트
	@Override
	public int updateUserInfo(UserVO vo) {
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo);
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getUserDate());
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getUserEmail());
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getAddress());
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getStreetAddress());
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getDetailAddress());
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getUserPhonenumber());
		log.warn("유저정보 업데이트 서비스 @@@@@@@@@@@@@@@@" + vo.getUserId());
		
//		LocalDate localDate = LocalDate.of(1900,01,01);
//		Date dt = Date.valueOf(localDate);
//		log.warn("데이트 객체 결과 : " + dt);
		
		int result = userMapper.updateUserInfo(vo);
		log.warn("유저정보 업데이트 서비스 결과 @@@@@@@@@@@@@@@@" + result);
		return result;
	}
	
	// 유저 정보 조회 ( by.mno )
	@Override
	public UserVO userSelectOne(int mno) {
		log.warn("유저 정보 조회 by.mno..." + mno);
		return userMapper.userSelectOne(mno);
	}
	
	// 유저 탈퇴
	@Override
	public int deleteAccount(String userId) {
		return userMapper.deleteAccount(userId);
	}
	
	// 포인트 총 내역
	@Override
	public List<UserpointVO> selectPoint(int mno) {
		log.warn("mno 서비스 : " + mno);
		List<UserpointVO> list = null;
		log.warn("포인트조회서비스 : " + userMapper.selectPoint(mno).size());
		log.warn("포인트조회서비스 : " + list);
		if(userMapper.selectPoint(mno).size() > 0) {
			list = userMapper.selectPoint(mno);
		}
		
		return userMapper.selectPoint(mno);
	}
	
	@Override
	public Integer totalPoint(int mno) {
		log.warn("토탈포인트 : " + mno);
		
		return userMapper.totalPoint(mno);
	}
	
	@Override
	public Integer totalUsePoint(int mno) {
		log.warn("토탈사용포인트 : " + mno);
		return userMapper.totalUsePoint(mno);
	}
	
	@Override
	public List<UsedBookVO> usedBook_select(int mno) {
		log.warn("중고 주문내역 : " + mno);
		return userMapper.usedBook_select(mno);
	}
	
	@Override
	public List<UsedBookVO> getuBookList(Criteria cri) {
		log.warn("중고 판매 페이징 처리에용" + cri);
		return userMapper.getuBookList(cri);
	}
	
	@Override
	public int countGetuBookList(Criteria cri) {
		return userMapper.countGetuBookList(cri);
	}
	
	@Override
	public List<UsedBookVO> selectGetuBookList(Criteria cri) {
		log.warn("이이이이잉" + cri.getUserMno());
		List<UsedBookVO> list = userMapper.selectGetuBookList(cri);
		log.warn(list.size());
		if(list.size() > 0) {
			list.forEach(action -> {
				log.warn("list : " + action.getUbookPrice());
				log.warn("list : " + action.getTitle());
				log.warn("list : " + action.getStartDate());
				log.warn("list : " + action.getEndDate());
				log.warn("list : " + action.getMno());
			});
		}
		return list;
	}
	
	@Override
	public List<UsedBookVO> selectGetuBookEndSaleList(Criteria cri) {
		log.warn("주문완료 중고 서비스 " + cri.getUserMno());
		return userMapper.selectGetuBookEndSaleList(cri);
	}
	
	@Override
	public List<BoardVO> selectBoard(Criteria cri) {
		log.warn("서비스 해당유저가 작성한 게시글 ");
		log.warn("필터타입 : " + cri.getFilterType());
		log.warn("mno : " + cri.getUserMno());
		log.warn("page : " + cri.getPageNum());
		log.warn("amount : " + cri.getAmount());
		return userMapper.selectBoard(cri);
	}
	
	@Override
	public int selectBoardCount(Criteria cri) {
		return userMapper.selectBoardCount(cri);
	}
	
	@Override
	public List<BoardVO> selectComments(Criteria cri) {
		return userMapper.selectComments(cri);
	}
	@Override
	public int selectCommentsCount(Criteria cri) {
		return userMapper.selectCommentsCount(cri);
	}
	
	@Override
	public List<BoardVO> selectLikesBoard(Criteria cri) {
		return userMapper.selectLikesBoard(cri);
	}
	
	@Override
	public int selectLikesCount(Criteria cri) {
		return userMapper.selectLikesCount(cri);
	}
	
	@Override
	public List<WriteVO> selectMyLikedWritingList(Criteria cri) {
		log.warn("서비스 엠엔오 집필 : " + cri.getUserMno());
		return userMapper.selectMyLikedWritingList(cri);
	}
	
	@Override
	public int deleteUser(int mno) {
		log.warn("유저 삭제 서비스 : " + mno);
		return userMapper.deleteUser(mno);
	}
	
	@Override
	public int directReportCountByMno(int mno) {
		int result = userMapper.directReportCountByMno(mno);
		log.warn("내 미완료 1:1 문의 수 : " + result);
		return result;
	}
	
	@Override
	public int myBoardCount(int mno) {
		int result = userMapper.myBoardCount(mno);
		log.warn("내 게시글 수 : " + result);
		return result;
	}
	
	@Override
	public int myShoppingCount(int mno) {
		int result = userMapper.myShoppingCount(mno);
		log.warn("내 최근 일주일 주문 갯수 : " + result);
		return result;
	}
}
