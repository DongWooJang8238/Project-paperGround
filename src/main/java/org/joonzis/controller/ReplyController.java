package org.joonzis.controller;

import java.util.List;

import org.joonzis.domain.ReplyVO;
import org.joonzis.service.BoardLikeService;
import org.joonzis.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	public ReplyService service;
	
	@Autowired
	public BoardLikeService likeservice;
	
	// 1. 등록
	
		@PostMapping(value = "/new",
					consumes = "application/json",
					produces = MediaType.TEXT_PLAIN_VALUE) // 응답하는 데이터에 대한 타입
		public ResponseEntity<String> insert(@RequestBody ReplyVO vo){
			log.info("ReplyVO : " + vo);
			
			int insertCount = service.insert(vo);
			
			log.info("댓글 insert Count : " + insertCount);
			
			return insertCount == 1 ?
				new ResponseEntity<String>("success", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 2. 댓글 목록
		@GetMapping(value = "/pages/{boardno}",
				produces = {
						MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE
				})
		public ResponseEntity<List<ReplyVO>> getList(
							@PathVariable("boardno") int boardno){

			log.info("댓글 getList...." + boardno);
			return new ResponseEntity<List<ReplyVO>>(
								service.getList(boardno), HttpStatus.OK);
		}
		
		// 3. 댓글 조회
		@GetMapping(value = "/{replyno}",
				produces = {
						MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE
				})
		public ResponseEntity<ReplyVO> read(@PathVariable int replyno){
			log.info("댓글 read..." + replyno);
			ReplyVO rvo = service.read(replyno);
			rvo.setComLikeCount(likeservice.comcountLikes(replyno));
			return new ResponseEntity<ReplyVO>(rvo, HttpStatus.OK);
		}
		
		// 4. 삭제
		@DeleteMapping(value = "/{replyno}", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> delete(@PathVariable("replyno") int replyno){
			log.info("댓글 remove..." + replyno);
			return service.delete(replyno) == 1 ?
					new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR); // 성공시 "success"텍스트, 실패시 서버 오류 반환
		}
		
		// 5. 수정
		@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value = "/{replyno}", produces = MediaType.TEXT_PLAIN_VALUE,
				consumes = "application/json")
		public ResponseEntity<String> update(
				@PathVariable("replyno") int replyno,
				@RequestBody ReplyVO vo){
			
			log.info("댓글replyno : " + replyno);
			log.info("댓글replyno : " + vo.getReply());
			log.info("댓글replyno : " + vo.getReplyer());
			log.info("댓글update... " + replyno);
			
			int updateCount = service.update(vo);
			
			log.warn("댓글update count : " + updateCount);
			
			return updateCount == 1 ?
					new ResponseEntity<String>("success", HttpStatus.OK) :
					new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// 댓글 좋아요 수 조회
		@GetMapping(value = "/commentlike/count/{replyno}", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> getComLikeCount(@PathVariable("replyno") int replyno) {
		    log.info("댓글 좋아요 수 조회... replyno: " + replyno);
		    int likeCount = likeservice.comcountLikes(replyno);
		    return new ResponseEntity<String>(String.valueOf(likeCount), HttpStatus.OK);
		}
}
