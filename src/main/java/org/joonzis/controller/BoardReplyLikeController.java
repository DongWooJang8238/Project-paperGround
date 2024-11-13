package org.joonzis.controller;

import org.joonzis.domain.BoardCommentLikeVO;
import org.joonzis.domain.BoardLikeVO;
import org.joonzis.service.BoardLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/commentLike")
public class BoardReplyLikeController {
		@Autowired
	    private BoardLikeService service;

	    // 좋아요 추가/삭제 기능 
	    @PostMapping("/get") // POST 요청이 "/like/get"으로 들어오면 실행
	    public ResponseEntity<String> toggleLike(@RequestBody BoardCommentLikeVO vo) {
	        log.warn("댓글 좋아용getLike... " + vo);
	        log.warn("댓글 좋아용getLike... " + vo.getBoardno());
	        log.warn("댓글 좋아용getLike... " + vo.getMno());
	        log.warn("댓글 좋아용getLike... " + vo.getReplyno());
	        
	        int isLiked = service.comisLiked(vo);
	        log.warn("isLike : " + isLiked);
	        // 서비스 클래스의 isLiked 메서드를 호출해 사용자가 이미 게시글에 좋아요를 눌렀는지 확인
	        if (isLiked > 0) {
	        	int result = service.comdeleteLike(vo); // 사용자가 이미 좋아요를 눌렀다면  좋아요를 삭제
	            return result != 0 ? new ResponseEntity<String>("Like removed", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	        } else if(isLiked == 0){
	        	int result = service.cominsertLike(vo); // 아닐시 좋아요 추가
	            return result != 0 ? new ResponseEntity<String>("Like added", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	        } else {
	        	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }

	    // 좋아요 개수 가져오기
	    @GetMapping("/count/{replyno}")
	    public ResponseEntity<Integer> countLikes(@PathVariable int replyno) {
	        log.info("좋아요 개수 가져오기... " + replyno);
	        int count = service.countLikes(replyno);
	        return new ResponseEntity<>(count, HttpStatus.OK);
	    }
		
}
