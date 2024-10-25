package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.springframework.web.multipart.MultipartFile;

public interface UserService {
	// 아이디 중복체크
	public int selectUsername(String userId);
	
	// 아이디&비밀번호 체크
	public int selectUserPw(UserVO vo);
	
	// 회원가입 INSERT
	public int signup_insert(UserVO vo);
	
	// 유저 아이디 찾기
	public int findUserId(UserVO vo);
	
	// 유저 ID 검색
	public UserVO selectUserIdByEmail(UserVO vo);
	
	// 비밀번호 찾기 출력 ( 아이디/이메일 인증번호 보내기 전 )
	public UserVO findUserIdEmail(UserVO vo);

	// 새 비밀번호 설정
	public int updatePw(UserVO vo);
	
	// 비밀번호 재확인(수정페이지 가기 전)
	public UserVO checkPassword(UserVO vo);
	
	// 마이페이지 아이디 검색
	public UserVO selectUserId(String userId);
	
	// 아이콘 업데이트
	public int updateIcon(UserVO vo);
	
	// 유저 정보 업데이트
	public int updateUserInfo(UserVO vo);
	
	// 유저 정보 조회 ( by.mno )
	public UserVO userSelectOne(int mno);
	
	// 유저 탈퇴
	public int deleteAccount(String userId);
	
	// 포인트 총 내역
	public List<UserpointVO> selectPoint(int mno);
	
	// 이번달 적립된 포인트 보유량
	public int totalPoint(int mno);
	
	// 이번달 사용한 포인트 보유량
	public int totalUsePoint(int mno);
	
}
