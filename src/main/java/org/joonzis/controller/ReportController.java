package org.joonzis.controller;



import java.util.List;

import org.joonzis.domain.DrVO;
import org.joonzis.domain.PageDTO;
import org.joonzis.domain.QnaVO;
import org.joonzis.domain.ReportBoardVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.PageDTO;

import org.joonzis.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import lombok.extern.log4j.Log4j;



@Log4j
@Controller
@RequestMapping("/report/*")
public class ReportController {
	
	
	@Autowired
	private ReportService reportservice;
	
	
	//game entrance page open.
	@GetMapping("/selectReport")
	public String Category(int mno, Model model) {
		log.info("Category..................................");
		model.addAttribute("mno", mno);
		return "/report/selectReport";
	}
	
	//qnapage 이동
	@GetMapping("/qna")
	public String goqna(Model model) {
		log.info("qna..................................");
		//model.addAttribute("qnaList", reportservice.getCategory(qna));		
		return "/report/qna";
	}
	// 카테고리에 맞는 QnA 데이터 가져오기
	 @GetMapping(value = "/qna/category/{categoryId}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	    @ResponseBody
	    public ResponseEntity<List<QnaVO>> getQnaByCategory(@PathVariable("categoryId") String categoryId) {
	        log.info("Fetching QnA for category: " + categoryId);
	        
	        List<QnaVO> checkList = reportservice.getAllQnaData();
	        
	        int categoryIdInt = 0;
	        
	        switch (categoryId) {
	        case "reportUser":
	        	categoryIdInt=1 ; // reportUser
	        	break;
	        case "reportWriter":
	        	categoryIdInt= 2; 
	        	break;
	        case "reportSystem":
	        	categoryIdInt= 3; 
	        	break;
	        case "reportShop":
	        	categoryIdInt= 4; 
	        	break;
	        case "reportRefund":
	        	categoryIdInt= 5; 
	        	break;
	        case "reportProfile":
	        	categoryIdInt= 6; 
	        	break;
	        case "reportFesta":
	        	categoryIdInt= 7; 
	        	break;
	        case "reportHeadhunter":
	        	categoryIdInt= 8; 
	        	break;
	        default:
	        	categoryIdInt = 0;
	        	break;
	    }
	
	  if (categoryIdInt == 0) { 
		  log.info("kaaaaaaak"+checkList); 
		  return new ResponseEntity<List<QnaVO>>(checkList, HttpStatus.OK); 
		  }
	  checkList =reportservice.selectQnaByCategory(categoryIdInt);
	  return new ResponseEntity<List<QnaVO>>(checkList, HttpStatus.OK); 
	 }

	//1대1 맞다이
	@GetMapping("/directReport")
	public String oneonetwo(int mno, Model model) {
		log.warn("directReport...............................");
		log.warn("mno..............................."+mno);
		
		model.addAttribute("mno", mno);
		return "/report/directReport";  
	}
	
	@PostMapping("/DRsubmit")
	public String DRsubmit(DrVO drvo) {
		log.warn("DRsubmit...............................");
		log.warn("DRsubmit..............................."+drvo);
		log.warn("DRsubmit..............................."+drvo.getDRtitle());
		log.warn("DRsubmit..............................."+drvo.getDRtitle());
		log.warn("DRsubmit..............................."+drvo.getDRcategory());
		int count = reportservice.insertDR(drvo);
		log.warn("---------------------------" + count);
		return "/report/directReport";  
	}
	
	//문의 게시판
	@GetMapping("/reportBoard")
	public String reportBoard(int mno, Criteria cri ,Model model) {
		log.warn("reportBoard...............................");
		if(cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		
		int total = reportservice.getTotal();
		log.info("total...." + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", reportservice.getList(cri));
		model.addAttribute("mno", mno);
		return "/report/reportBoard";  
	}
	@GetMapping("/insertReport")
	public String insert() {
		log.info("insert..." );
		return "/report/reportBoardInsert";
	}
	
	@PostMapping("/insert")
    public String insertReport(@ModelAttribute("reportBoard") ReportBoardVO reportBoard) {
		log.info("insertReport..." );
		reportservice.insertReport(reportBoard);
        return "redirect:/report/reportBoard";
    }
	

}
