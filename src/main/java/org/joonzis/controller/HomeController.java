package org.joonzis.controller;

import java.util.List;
import java.util.Locale;

import org.joonzis.domain.BoardVO;
import org.joonzis.domain.BookVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {
	
	@Autowired
	private MainService service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		// 베스트셀러
		List<BookVO> BestSellerList = service.selectBestSellerList();
		// 유저 추천 도서
		List<BookVO>  userLikesList = service.selectUserRecommendBookLike();
		// 인기 게시글
		List<BoardVO> boardLikesList = service.selectBestLikesBoardList();
		// 공지사항
		List<BoardVO> boardAnnouncementList = service.selectAnnouncementList();
		// 인기 집필 게시판
		List<WriteVO> BestLikesWriteList = service.selectBestLikesWriteList();
		
		
		BestSellerList.forEach(action -> {
			log.warn("베스트셀러 " + action.getTitle());
			log.warn("베스트셀러 " +action.getWriter());
			log.warn("베스트셀러  책 커버" +action.getBookcover());
			log.warn("베스트셀러 " +action.getLikeCount());
		});
		
		userLikesList.forEach(action -> {
			log.warn("유저 추천 도서 " + action.getTitle());
			log.warn("유저 추천 도서 " +action.getWriter());
			log.warn("유저 추천 도서 책 커버 " +action.getBookcover());
			log.warn("유저 추천 도서 " +action.getLikeCount());
		});
		
		boardLikesList.forEach(action -> {
			log.warn("인기 게시글 " + action.getTitle());
			log.warn("인기 게시글 " +action.getWriter());
			log.warn("인기 게시글 " +action.getReply());
			log.warn("인기 게시글 " +action.getReplyCount());
		});
		
		boardAnnouncementList.forEach(action -> {
			log.warn("공지사항 " + action.getTitle());
			log.warn("공지사항 " +action.getWriter());
		});
		
		BestLikesWriteList.forEach(action -> {
			log.warn("인기 집필 게시판 " + action.getTitle());
			log.warn("인기 집필 게시판 " +action.getWriter());
			log.warn("인기 집필 게시판 " +action.getCoverImage());
			log.warn("인기 집필 게시판 " +action.getViews());
		});
		
		model.addAttribute("BestSellerList",BestSellerList);
		model.addAttribute("userLikesList", userLikesList);
		model.addAttribute("boardLikesList", boardLikesList);
		model.addAttribute("boardAnnouncementList", boardAnnouncementList);
		model.addAttribute("BestLikesWriteList", BestLikesWriteList);
		return "/main";
	}
	
}
