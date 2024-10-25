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

    // 좋아요 추가/삭제 기능 
//    @PostMapping("/get") // POST 요청이 "/like/get"으로 들어오면 실행
//    public ResponseEntity<String> toggleLike(@RequestBody BoardLikeVO vo) {
//        log.info("getLike... " + vo);
//        log.info("getLike... " + vo.getBoardno());
//        log.info("getLike... " + vo.getMno());
//        
//        int isLiked = service.isLiked(vo);
//        log.warn("isLike : " + isLiked);
//        // 서비스 클래스의 isLiked 메서드를 호출해 사용자가 이미 게시글에 좋아요를 눌렀는지 확인
//        if (isLiked > 0) {
//        	service.deleteLike(vo); // 사용자가 이미 좋아요를 눌렀다면  좋아요를 삭제
//            return new ResponseEntity<String>("Like removed", HttpStatus.OK);
//        } else if(isLiked == 0){
//        	service.insertLike(vo); // 아닐시 좋아요 추가
//            return new ResponseEntity<String>("Like added", HttpStatus.OK);
//        } else {
//        	return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
//    }
    
    // 좋아요만
    @PostMapping("/get")
    public ResponseEntity<String> addLike(@RequestBody BoardLikeVO vo) {
        log.info("addLike... " + vo);
        log.info("getLike... " + vo);
      log.info("getLike... " + vo.getBoardno());
      log.info("getLike... " + vo.getMno());

        // 사용자가 이미 좋아요를 눌렀는지 확인
        int isLiked = service.isLiked(vo);
        log.warn("isLike : " + isLiked);

        // 이미 좋아요를 누른 경우 처리
        if (isLiked > 0) {
            return new ResponseEntity<String>("Already liked", HttpStatus.OK); // 이미 좋아요를 누른 상태
        } else {
            // 좋아요 추가
            service.insertLike(vo);
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












