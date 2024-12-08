package org.joonzis.controller;

import java.util.List;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.Criteria;
import org.joonzis.domain.UsedBookVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.service.CommonService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
	
	@Autowired
	UserService service;
	
	@Autowired
	CommonService coservice;
	
	@Autowired
	PasswordEncoder pwencoder;
	
	@GetMapping("/login")
	public String loginInput(String err, String logout, Model model) {
		log.info("error : " + err);
		log.info("logout : " + logout);
		
		if(err != null) {
			model.addAttribute("error", "Login Error Check your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!!");
		}

		return "/login";
	}
	
	@GetMapping("/customLogout")
	public String customLogout() {
		log.warn("로..그..아..웃.. ( 도 적 나 가 )");
		return "/";
	}
	
	@GetMapping("/Total")
	public String totalSelect(Criteria cri, Model model) {
		log.warn("cri : " + cri.getSelectOption());
		log.warn("cri : " + cri.getSelectValue());
		// 게시글 및 댓글
		List<BoardVO> boardList = coservice.getBoardList(cri);
		// 상품
		List<BookVO> bookList = coservice.getBookList(cri);
		// 중고상품
		List<UsedBookVO> ubookList = coservice.getUsedBookList(cri);
		// 집필
		List<WriteVO> writeList = coservice.getWriteList(cri);
		
		log.warn("검색 갯수 ----------------------- ");
		log.warn("게시글 : " + boardList.size());
		log.warn("상품 : " + bookList.size());
		log.warn("중고상품 : " + ubookList.size());
		log.warn("집필 : " + writeList.size());
		
		int listSize = boardList.size() + bookList.size() + ubookList.size() + writeList.size();
		
		log.warn("총 서치 수 : " + listSize);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("bookList", bookList);
		model.addAttribute("ubookList", ubookList);
		model.addAttribute("writeList", writeList);
		model.addAttribute("select", cri);
		model.addAttribute("listSize", listSize);
		
		return "/totalSelect";
	}
}
