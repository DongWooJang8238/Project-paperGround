package org.joonzis.controller;

import org.joonzis.domain.BoardLikeVO;
import org.joonzis.service.BoardLikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/like")
public class BoardLikeController {

    @Autowired
    private BoardLikeService service;
    
    // 좋아요만
    @PostMapping("/get")
    public ResponseEntity<String> addLike(@RequestBody BoardLikeVO vo) {
      log.warn("getLike... " + vo);
      log.warn("getLike... " + vo.getBoardno());
      log.warn("getLike... " + vo.getMno());

        // 사용자가 이미 좋아요를 눌렀는지 확인
        int isLiked = service.isLiked(vo);
        log.warn("isLike : " + isLiked);

        // 이미 좋아요를 누른 경우 처리
        if (isLiked > 0) {
            return new ResponseEntity<String>("Already liked", HttpStatus.OK); // 이미 좋아요를 누른 상태
        } else {
            // 좋아요 추가
            int result = service.insertLike(vo);
            log.warn("좋아요 추가 결과 : " + result);
            return new ResponseEntity<String>("Like added", HttpStatus.OK); 
        }
    }
    
    // 좋아요 개수 가져오기
    @GetMapping("/count/{boardno}")
    public ResponseEntity<Integer> countLikes(@PathVariable int boardno) {
        log.info("좋아요 개수 가져오기... " + boardno);
        int count = service.countLikes(boardno);
        return new ResponseEntity<>(count, HttpStatus.OK);
    }
    
    
    
}












