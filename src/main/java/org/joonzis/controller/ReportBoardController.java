package org.joonzis.controller;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.ReportBoardVO;
import org.joonzis.service.ReportBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reportBoard/*")
public class ReportBoardController {
	
	@Autowired
	public ReportBoardService reportBoardService;
		
//	 전체 게시글 조회 - 기존 방식
	@GetMapping("/list")
	public String list(Model model, Criteria cri) {
		log.info("list...");
		
		if(cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		
		int total = reportBoardService.getTotal();
		log.info("total...." + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", reportBoardService.getList(cri));
		return "/reportBoard/list";
	}
	@GetMapping("/listCategory")
	public String listByCategory(@RequestParam("reportCategory") String reportCategory, Model model, Criteria cri) {
	    if (reportCategory == null) {
	        reportCategory = "";  // 기본값 설정
	    }
	    log.info("list by category...");
	    Map<String, Object> params = new HashMap<>();
	    params.put("reportCategory", reportCategory);
	    params.put("pageNum", cri.getPageNum());
	    params.put("amount", cri.getAmount());
	    
	    List<ReportBoardVO> posts = reportBoardService.getPostsByCategory(params);

	    model.addAttribute("selectedCategory", reportCategory);

	    // 페이지 번호 및 항목 수 초기화
	    if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
	        cri.setPageNum(1);
	        cri.setAmount(10);
	    }

	    // 카테고리별 총 게시글 수
	    int total = reportBoardService.getTotalByCategory(reportCategory);
	    log.info("total...." + total);

	    // 카테고리별 게시글 목록

	    model.addAttribute("list", posts);
	    model.addAttribute("pageMaker", new PageDTO(cri, total));

	    return "/reportBoard/list";  // 결과적으로 list 페이지로 포워딩
	}


		
		// 게시글 조회
		@GetMapping("/get")
		public String get(@RequestParam("reportBoardno") int reportBoardno, Model model) {
			// 조회수 증가
			reportBoardService.boardReadCount(reportBoardno);
			
			log.info("get..." + reportBoardno);
			model.addAttribute("rbvo", reportBoardService.get(reportBoardno));
			return "/reportBoard/get";
		}
		
		// 게시글 수정, 수정이 완료되면 board/list로 이동
		@PostMapping("/modify")
		public String modify(ReportBoardVO rbvo) {
			log.info("modify 수정..." + rbvo);
			reportBoardService.modify(rbvo);
			return "redirect:/reportBoard/list";
		}
		
		// modify(수정) 게시글 이동
		@GetMapping("/modify")
		public String modify(@RequestParam("reportBoardno") int reportBoardno, Model model) {
			log.info("modify 이동..." + reportBoardno);
			model.addAttribute("rbvo", reportBoardService.get(reportBoardno));
			return "/reportBoard/modify";
		}
		
		// 게시글 삭제
		@PostMapping("/remove")
		public String remove(@RequestParam("reportBoardno") int reportBoardno) {
			log.info("게시글 삭제..." + reportBoardno);
			reportBoardService.remove(reportBoardno);
			return "redirect:/reportBoard/list";
		}
		
		
		// 게시글 등록
		@PostMapping("/register")
		public String register(ReportBoardVO rbvo, RedirectAttributes rttr) {
			log.info("register.... " + rbvo);
			reportBoardService.register(rbvo);
			
			rttr.addFlashAttribute("result", "success");
			
			return "redirect:/reportBoard/list";
		}
		
		// 게시글 등록으로 이동
		@GetMapping("/register")
		public String register2() {
			log.info("register2 게시글 등록 이동...");
			return "/reportBoard/register";
		}
		
}
