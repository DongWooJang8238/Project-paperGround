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
	        log.warn("get댓글 좋아요... " + vo);
	      log.warn("get댓글 좋아요... " + vo.getBoardno());
	      log.warn("get댓글 좋아요... " + vo.getMno());

	        // 사용자가 이미 좋아요를 눌렀는지 확인
	        int comisLiked = service.comisLiked(vo);
	        log.warn("isLike : " + comisLiked);
	        
	        // 이미 좋아요를 누른 경우 처리
	        if (comisLiked > 0) {
	            return new ResponseEntity<String>("Already liked", HttpStatus.OK); // 이미 좋아요를 누른 상태
	        } else {
	            // 좋아요 추가
	            service.cominsertLike(vo);
	            return new ResponseEntity<String>("comLike added", HttpStatus.OK); 
	        }
	    }

	    // 좋아요 개수 가져오기
	    @GetMapping("/count/{replyno}")
	    public ResponseEntity<String> commentcountLikes(@PathVariable int replyno) {
	        log.warn("댓글 좋아요 개수 가져오기... " + replyno);
	        int count = service.comcountLikes(replyno);
	        log.warn("댓글 좋아요 카운트 " + count);
	        return new ResponseEntity<>("" + count, HttpStatus.OK);
	    }
	    
	    
		
}
