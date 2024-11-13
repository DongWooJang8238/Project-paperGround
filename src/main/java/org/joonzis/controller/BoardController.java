package org.joonzis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.joonzis.domain.BoardAttachVO;
import org.joonzis.domain.BoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
	
@Log4j
@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Autowired
	public BoardService service;
		
//	 전체 게시글 조회 - 기존 방식
	@GetMapping("/list")
	public String list(Model model, Criteria cri, 
	                   @RequestParam(value = "category", defaultValue = "1") String category) {
	    log.info("게시판 카테고리: " + category);

	    if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
	        cri.setPageNum(1);
	        cri.setAmount(10);
	    }

	    int total = service.getTotalByCategory(category);
	    log.warn("보드서비스 리스트 토탈... " + total);
	    
	    List<BoardVO> filteredList = service.getListByCategory(cri, category);

	    model.addAttribute("pageMaker", new PageDTO(cri, total));
	    model.addAttribute("list", filteredList);
	    model.addAttribute("selectedCategory", category);

	    return "/board/list";
	}

		
		// 게시글 조회
		@GetMapping("/get")
		public String get(@RequestParam("boardno") int boardno, Model model) {
			// 조회수 증가
			service.boardReadCount(boardno);
			
			log.info("get..." + boardno);
			model.addAttribute("bvo", service.get(boardno));
			model.addAttribute("likecount", service.getLikeCount(boardno));
			model.addAttribute("attachList", service.getAttachList(boardno));
			return "/board/get";
		}
		// 게시글 수정, 수정이 완료되면 board/list로 이동
		@PostMapping("/modify")
		public String modify(BoardVO boardno) {
			log.info("modify..." + boardno);
			service.modify(boardno);
			return "redirect:/board/list";
		}
		// modify(수정) 게시글 이동
		@GetMapping("/modify")
		public String modify(@RequestParam("boardno") int boardno, Model model) {
			log.info("modify..." + boardno);
			model.addAttribute("bvo", service.get(boardno));
			return "/board/modify";
		}
		// 게시글 삭제
		@PostMapping("/remove")
		public String remove(@RequestParam("boardno") int boardno) {
			log.info("게시글 삭제..." + boardno);
			service.remove(boardno);
			return "redirect:/board/list";
		}
		
		
		// 게시글 등록
		@PostMapping("/register")
		public String register(BoardVO bvo, RedirectAttributes rttr) {
			log.warn("123412341234");
			log.info("register.... " + bvo);
			log.info("게시글 등록" + bvo.getAttachList());
			service.register(bvo);
			
			if(bvo.getAttachList() != null) {
				bvo.getAttachList().forEach(attach -> log.info("아타치이타치" + attach));
			}
			
			rttr.addFlashAttribute("result", "success");
			
			return "redirect:/board/list";
		}
		// 게시글 등록으로 이동
		@GetMapping("/register")
		public String register2() {
			log.info("register2 게시글 등록 이동...");
			return "/board/register";
		}
		
		// 첨부파일 리스트 조회
		@ResponseBody
		@GetMapping(value = "/getAttachList/{boardno}",
					produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<List<BoardAttachVO>> getAttachList(@PathVariable("boardno") int boardno){
			log.info("get 게시판 업로드 파일 리스트... " + boardno);
			
			service.getAttachList(boardno).forEach(action -> {
				log.info("업로드" + action);
			});
			log.warn("아타치 등록 결과 : " + boardno);
			return new ResponseEntity<List<BoardAttachVO>>(service.getAttachList(boardno), HttpStatus.OK);
		}
	    
		
}