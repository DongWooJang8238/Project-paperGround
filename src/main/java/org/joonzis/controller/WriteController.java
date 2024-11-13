package org.joonzis.controller;

import java.util.List;

import org.joonzis.domain.Criteria;
import org.joonzis.domain.WriteEpisodeVO;
import org.joonzis.domain.WriteVO;
import org.joonzis.service.UserService;
import org.joonzis.service.WriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/write/*")
public class WriteController {
	
	@Autowired
	UserService userservice;
	
	@Autowired
	WriteService service;
	
	@GetMapping("/home")
	public String goWrite(Model model) {
		log.warn("집필페이지 이동");
		List<WriteVO> list = service.selectWriteAll();
		
		model.addAttribute("list", list);
		return "/write/writeHome";
	}
	
	@GetMapping("/goMyEpiosde")
	public String goMyEpiosde(int mno, Model model) {
		log.warn("내 에피소드 목록 이동..");
		log.warn("내 에피소드 목록 이동.." + mno);
		List<WriteVO> list = service.selectWriteByMno(mno);
		
		model.addAttribute("list", list);
		
		return "/write/writeMyEpisode";
	}
	
	@GetMapping("/goWriteInsert")
	public String goInsert(int mno) {
		log.warn("입력 페이지 이동");
		return "/write/writeInsert";
	}
	
	@PostMapping("/writeInsert")
	public String writeInsert(WriteVO vo, Model model) {
		log.warn("집필 기본 정보 등록" + vo);
		log.warn("집필 기본 정보 등록" + vo.getMno());
		log.warn("집필 기본 정보 등록" + vo.getTitle());
		log.warn("집필 기본 정보 등록" + vo.getDescription());
		log.warn("집필 기본 정보 등록" + vo.getWriteType());
		log.warn("집필 기본 정보 등록" + vo.getGenre());
		log.warn("집필 기본 정보 등록" + vo.getCoverImage());
		String writer = service.userNickName(vo.getMno());
		vo.setWriter(writer);
		log.warn("집필 기본 정보 등록" + vo.getWriter());
		if(vo.getCoverImage() == null) {
			vo.setCoverImage("not img");
		}
		int checkCount = service.selectCountWriting(vo);
		if(checkCount == 0) {
			int insertResult = service.writeInsert(vo);
			
			log.warn("집필 기본 정보 등록 결과 : " + insertResult);
		}else {
			log.warn("집필 기본 정보가 이미 등록되어 있습니다 ( 새로고침 이슈  ) ");
		}
		
		model.addAttribute("wno", service.writeWnoSelect(vo.getMno()));
		
		return "/write/writeInsertEpisode";
	}
	
	@GetMapping("/goMyEp")
	public String goMyEp(int wno, Model model) {
		
		model.addAttribute("wno", wno);
		
		return "/write/writeInsertEpisode";
	}
	
	@GetMapping("/goMyEpList")
	public String goMyEpList(int wno, Model model) {
		log.warn("가자 나의 에피소드 리스트 보러 컨트롤러 : " + wno);
		
		List<WriteEpisodeVO> list = service.selectEpisodeByWno(wno);
		WriteVO wvo = service.selectWriteByWno(wno);
		wvo.setEpCount(list.size());
		model.addAttribute("wno", wno);
		model.addAttribute("wvo", wvo);
		model.addAttribute("list", list);
		
		return "/write/myEpisodeList";
	}
	
	@GetMapping("/updateMyEp")
	public String updateMyEp(int episodeno, Model model) {
		log.warn("나의 에피소드를 업데이트 할것이오 컨트롤러... : " + episodeno);
		
		WriteEpisodeVO wevo = service.selectEpisodeByEpno(episodeno);
		
		model.addAttribute("wevo", wevo);
		model.addAttribute("wno", wevo.getWno());
		
		return "/write/updateMyEp";
	}
	
	@Transactional
	@ResponseBody
	@PostMapping(value = "/updateEpisode", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> updateEpisode(@RequestBody WriteEpisodeVO vo, Model model) {
		log.warn("컨트롤러 에피소드 업데이트 전달받은 데이터 : " + vo);
		log.warn("컨트롤러 에피소드 업데이트 전달받은 데이터 : " + vo.getContent());
		log.warn("컨트롤러 에피소드 업데이트 전달받은 데이터 : " + vo.getEpisodeComment());
		log.warn("컨트롤러 에피소드 업데이트 전달받은 데이터 : " + vo.getWno());
		log.warn("컨트롤러 에피소드 업데이트 전달받은 데이터 : " + vo.getEpisodeTitle());
		log.warn("컨트롤러 에피소드 업데이트 전달받은 데이터 : " + vo.getEpisodeno());
		log.warn("컨트롤러 에피소드 업데이트 에피소드 회차 : " + vo.getEpisodeCount());
		
		int result = service.writeUpdateEpisode(vo);
		log.warn("컨트롤러 에피소드 업데이트 결과 : " + result);
		if(result > 0) {
			int updateDate = service.updateWriteDate(vo.getWno());
			log.warn("updateDate : " + updateDate);
		}
		
		return result != 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@ResponseBody
	@PostMapping(value = "/writeInsertEpisode", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> writeInsertEpisode(@RequestBody WriteEpisodeVO vo, Model model) {
		log.warn("컨트롤러 에피소드 인서트 전달받은 데이터 : " + vo);
		log.warn("컨트롤러 에피소드 인서트 전달받은 데이터 : " + vo.getContent());
		log.warn("컨트롤러 에피소드 인서트 전달받은 데이터 : " + vo.getEpisodeComment());
		log.warn("컨트롤러 에피소드 인서트 전달받은 데이터 : " + vo.getWno());
		log.warn("컨트롤러 에피소드 인서트 전달받은 데이터 : " + vo.getEpisodeTitle());
		
		int wnoCount = service.episodeCount(vo.getWno());
		
		vo.setEpisodeCount(wnoCount + 1);
		log.warn("컨트롤러 에피소드 인서트 에피소드 회차 : " + vo.getEpisodeCount());
		
		int result = service.writeInsertEpisode(vo);
		log.warn("컨트롤러 에피소드 인서트 결과 : " + result);
		
		return result != 0 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
//	@GetMapping("/list")
//	public String writeList(Criteria cri, Model model) {
//		log.warn("컨트롤러 리스트 cir 체크 : " + cri.getFilterType());
//		List<WriteVO> list = service.selectList();
//		
//		return "";
//	}
}
