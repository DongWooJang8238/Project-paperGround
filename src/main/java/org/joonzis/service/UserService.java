package org.joonzis.service;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.UserVO;
import org.joonzis.domain.UserpointVO;
import org.joonzis.domain.WriteVO;
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
	public Integer totalPoint(int mno);
	
	// 이번달 사용한 포인트 보유량
	public Integer totalUsePoint(int mno);
	
	// 중고책 조회
	public List<UsedBookVO> usedBook_select(int mno);
	
	// 책 목록 리스트
	public List<UsedBookVO> getuBookList(Criteria cri);
	
	// 책 목록 리스트 카운트
	public int countGetuBookList(Criteria cri);
	
	// 날짜 조회 판매중
	public List<UsedBookVO> selectGetuBookList(Criteria cri);
	
	// 중고 판매완료 조회
	public List<UsedBookVO> selectGetuBookEndSaleList(Criteria cri);
	
	// 해당 유저가 작성한 게시글 조회
	public List<BoardVO> selectBoard(Criteria cri);
	
	// 게시글 조회 페이징 카운트
	public int selectBoardCount(Criteria cri);
	
	// 해당 유저가 작성한 댓글 조회
	public List<BoardVO> selectComments(Criteria cri);
	
	// 댓글 조회 페이징 카운트
	public int selectCommentsCount(Criteria cri);
	
	// 게시글 좋아요 조회 페이징 
	public List<BoardVO> selectLikesBoard(Criteria cri);
	
	// 게시글 좋아요 조회 카운트
	public int selectLikesCount(Criteria cri);
	
	// 집필 좋아요 리스트
	public List<WriteVO> selectMyLikedWritingList(Criteria cri);
}
