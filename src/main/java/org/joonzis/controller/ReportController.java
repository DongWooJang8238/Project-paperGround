package org.joonzis.controller;



import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String oneonetwo(int mno, Model model, Criteria cri) {
		log.warn("directReport...............................");
		log.warn("mno..............................."+mno);
		
		if(mno == 1) {
			if(cri.getPageNum() == 0 || cri.getAmount() == 0) {
				cri.setPageNum(1);
				cri.setAmount(10);}
			int total = reportservice.getDrTotal();
			log.info("total...." + total);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
			model.addAttribute("list", reportservice.getDrList(cri));
			return "/report/directReportList";}
		
		model.addAttribute("mno", mno);
		return "/report/directReport";  
	}
	
	@PostMapping("/DRsubmit")
	public String DRsubmit(DrVO drvo, RedirectAttributes rttr) {
		log.warn("DRsubmit...............................");
		rttr.addFlashAttribute("result", "success");
		log.warn("DRsubmit..............................."+drvo);
		log.warn("DRsubmit..............................."+drvo.getDRtitle());
		log.warn("DRsubmit..............................."+drvo.getDRcategory());
		int count = reportservice.DRsubmit(drvo);
		log.warn("---------------------------" + count);
		return "redirect:/";  
	}
	@GetMapping("/getDR")
	public String getDR(@RequestParam("drno") int drno, Model model) {
		reportservice.getDR(drno);
		
		log.info("get..." + drno);
		model.addAttribute("drvo", reportservice.getDR(drno));
		return "/report/getDR";
	}
	
	@GetMapping("/entrance")
	public String entrance(@RequestParam("mno") int mno, Model model) {
		log.info("entrance...");
		
		
		model.addAttribute("mno", mno);
		return "/report/directReportEntrance";
	}
	
	@GetMapping("/directReportList")
	public String directReportList(int mno, Model model, Criteria cri) {
		log.warn("directReport...............................");
		log.warn("mno..............................." + mno);

		if (cri.getPageNum() == 0 || cri.getAmount() == 0) {
			cri.setPageNum(1);
			cri.setAmount(10);
		}
		int total = reportservice.getDrTotal();
		
		log.info("total...." + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", reportservice.getDrList(cri));

		model.addAttribute("mno", mno);
		return "/report/directReportList";
	}
	
	@ResponseBody
	@PostMapping(value = "/updateStatus", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> updateStatus(@RequestBody DrVO drVO) {
		log.warn("dr수정페이지컨트롤러");
		log.warn("dr수정페이지컨트롤러" + drVO.getStatus());
		log.warn("dr수정페이지컨트롤러" + drVO.getDrno());
	    // 서비스 레이어에서 상태 업데이트 수행
		try {
	    int isUpdated = reportservice.updateStatus(drVO);
	    log.warn(isUpdated);
	    if (isUpdated > 0) {
	        return ResponseEntity.ok("Success");
	    } else {
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed");
	    }
		
    } catch (Exception e) {
    	   e.printStackTrace(); // 스택 트레이스 출력
           return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
       }
	    
	}

	
	
	

}
