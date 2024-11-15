package org.joonzis.controller;

import java.sql.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String goWrite(int mno, Model model) {
		log.warn("집필페이지 이동");
		List<WriteVO> list = service.selectWriteAll();
		list.forEach(li -> {
			WriteVO vo = new WriteVO();
			vo.setMno(mno);
			vo.setWno(li.getWno());
			int check = service.checkLike(vo);
			if(check > 0) {
				li.setWriteBookMark("yes");
			}else {
				li.setWriteBookMark("no");
			}
		});
		
		model.addAttribute("list", list);
		return "/write/writeHome";
	}
	
	@GetMapping("/goMyEpiosde")
	public String goMyEpiosde(int mno, Model model) {
		log.warn("내 에피소드 목록 이동..");
		log.warn("내 에피소드 목록 이동.." + mno);
		List<WriteVO> list = service.selectWriteByMno(mno);
		int yun = 0;
		int wan = 0;
		int sub = 0;
		for (WriteVO wvo : list) {
			if(wvo.getStatus().equals("연재중")) {
				yun += 1;
			}else if(wvo.getStatus().equals("완결")) {
				wan += 1;
			}else if(wvo.getStatus().equals("습작")) {
				sub += 1;
			}
		}
		
		log.warn("연재중 : " + yun);
		log.warn("완결 : " + wan);
		log.warn("습작 : " + sub);
		
		model.addAttribute("list", list);
		model.addAttribute("series", yun);
		model.addAttribute("complete", wan);
		model.addAttribute("etude", sub);
		
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
	
	@GetMapping("/goEpisodeList")
	public String goEpisodeList(int wno, int mno, Model model) {
		log.warn("컨트롤러 작품 에피소드 목록으로 이동 : " + wno);
		List<WriteEpisodeVO> list = service.selectEpisodeByWno(wno);
		list.forEach(li -> {
			WriteEpisodeVO vo = new WriteEpisodeVO();
			vo.setEpisodeno(li.getEpisodeno());
			vo.setMno(mno);
			Date lastDate = service.getLastDateByEpnoMno(vo);
			li.setLastDate(lastDate);
			log.warn("에피소드 마지막 읽은 날짜 : " + li.getLastDate());
		});
		WriteVO wvo = service.selectWriteByWno(wno);
		wvo.setEpCount(list.size());
		model.addAttribute("wno", wno);
		model.addAttribute("wvo", wvo);
		model.addAttribute("list", list);
		return "/write/writeEpisodeList";
	}
	
	@ResponseBody
	@GetMapping(value = "/episodeContent", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<WriteEpisodeVO> episodeContent(@RequestParam int episodeno){
		
		log.warn("비동기 에피소드 내용 모달 창 : " + episodeno);
		
		WriteEpisodeVO wevo = service.selectEpisodeByEpno(episodeno);
		log.warn("wno : " + wevo.getWno());
		int viewUpdate = service.updateWriteView(wevo.getWno());
		log.warn("뷰어 업데이트 결과 : " + viewUpdate);
		
		return new ResponseEntity<WriteEpisodeVO>(wevo, HttpStatus.OK);
	}

	@ResponseBody
	@GetMapping(value = "/likeUpdate", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> likeUpdate(@RequestParam int wno, @RequestParam int mno){
		log.warn("전달받은 좋아요 업데이트 데이터 컨트롤러 : " + wno + ", mno : " + mno);
		WriteVO vo = new WriteVO();
		vo.setWno(wno);
		vo.setMno(mno);
		int checkLike = service.checkLike(vo);
		log.warn("좋아요를 이미 눌렀는가 아닌가.. 0이면 안누름 1이면 누름" + checkLike);
		int insertLike = 0;
		if(checkLike == 0) {
			insertLike = service.insertLike(vo);
			log.warn("인서트 결과 : " + insertLike);
		}else {
			insertLike = service.deleteLike(vo);
			log.warn("딜리트 결과 : " + insertLike);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@GetMapping("/AllList")
	public String writeAllList(Model model) {
		model.addAttribute("list", service.selectWriteAll());
		return "/write/writeAllSelectList";
	}
//	@GetMapping("/list")
//	public String writeList(Criteria cri, Model model) {
//		log.warn("컨트롤러 리스트 cir 체크 : " + cri.getFilterType());
//		List<WriteVO> list = service.selectList();
//		
//		return "";
//	}
}
