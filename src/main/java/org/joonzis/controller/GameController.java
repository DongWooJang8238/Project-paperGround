package org.joonzis.controller;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.joonzis.domain.GameVO;
import org.joonzis.service.GameService;
import org.joonzis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;



@Log4j
@Controller
@RequestMapping("/game/*")
public class GameController {
	
	@Autowired
	private GameService gameservice;
	
	
	//game entrance page open.
	@GetMapping("/entrance")
	public String entrance(@RequestParam("mno") int mno, Model model) {
		log.info("entrance...");
		
		model.addAttribute("mno", mno);
		return "/game/gameEntrance";
	}
	
	@GetMapping("/JenreCheck")
    public String jenreCheck(int gameMode,int mno, Model model) {
		log.warn(gameMode);
        model.addAttribute("gameMode", gameMode);
        model.addAttribute("mno", mno);
        return "/game/JenreCheck";  
    }
	@Transactional
	@GetMapping("/gameDone")
	public String gameDone(@RequestParam("mno") int mno, Model model) {
		log.info("gameDone.....");
		log.info(mno);
		log.warn("mno.................................................."+mno);
		int result;
		String timeCheck;
		int history;
		model.addAttribute("mno", mno);
		int userCheck = gameservice.userCheck(mno);
		timeCheck = gameservice.pointGetCheck(mno);
		log.warn("어으  셔  ......................."+timeCheck);
		Timestamp currentDate = new Timestamp(System.currentTimeMillis());


        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        long differenceInHours = 0;
        try {
            // 문자열을 java.util.Date로 변환
            java.util.Date parsedDate = dateFormat.parse(timeCheck);
            Timestamp oracleTimestamp = new Timestamp(parsedDate.getTime());

            // 날짜 차이 계산 (밀리초 단위로 계산)
            long differenceInMillis = currentDate.getTime() - oracleTimestamp.getTime();

            // 결과 출력 (예: 초, 분, 시간 단위로 차이 계산)
            long differenceInSeconds = differenceInMillis / 1000;
            long differenceInMinutes = differenceInSeconds / 60;
            differenceInHours = differenceInMinutes / 60;

            System.out.println("현재 날짜와 오라클 날짜의 차이: " + differenceInHours + "시간");

        } catch (Exception e) {
            e.printStackTrace();
        }
        
		if(userCheck ==0) {
			gameservice.insertUser(mno);
			result = gameservice.gameDone(mno);
			history = gameservice.pointHistory(mno);
		} else {
			log.warn("gameDonepagetest" + timeCheck);
			if (differenceInHours > 12.0) {
				result = gameservice.gameDone(mno);
				history = gameservice.pointHistory(mno);
				System.out.println("포인트 부여 성공" + result);
				result = gameservice.updatePGdate(mno);
			} else {
				 System.out.println("다음 포인트 획득 가능 시간은 "+(12-differenceInHours)+" 시간 입니다.");
				 System.out.println(differenceInHours);
				 model.addAttribute("alertMessage", "다음 포인트 획득 가능 시간은 "+(12-differenceInHours)+" 시간 입니다." );
				return "/game/gameEntrance";
			}
		}
		return "/game/gameEntrance";
	}
	
	@GetMapping("/nomalplay")
	public String nomalgame(int gameMode, String gameJenre, int mno, Model model) {
		log.info("nomalplay...");
		log.info(gameMode);
		log.info(gameJenre);
		
		GameVO vo = new GameVO();
		vo.setGameJenre(gameJenre);
		vo.setGameMode(gameMode);
		
		List<GameVO> list = new ArrayList<GameVO>();
		
		int[] quest = new int[3];
		Random ran = new Random();
		
		if (gameMode == 1) {
			log.info(1);
			if (gameJenre.equals("소설")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+1;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("고전시가")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+11;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("현대시가")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+21;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("시조")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+31;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("희곡")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+41;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("역사소설")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+51;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("한국시")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+61;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("산문")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+71;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}else if (gameJenre.equals("현대소설")) {
				for (int i = 0; i < quest.length; i++) {
					quest[i] =ran.nextInt(10)+81;
					for (int j = 0; j < i; j++) {
						if(quest[j]==quest[i]) {
							i--;}}}
			}																		
		}		
		for (int i = 0; i < quest.length; i++) {
			GameVO gvo = gameservice.nomalQuest(quest[i]);
			list.add(gvo);
		}
		model.addAttribute("gameMode", gameMode);
		model.addAttribute("gameJenre", gameJenre);
		model.addAttribute("quest", quest);
		model.addAttribute("mno", mno);
		model.addAttribute("questList", list);
		model.addAttribute("questNo", 1);
		
		return "/game/nomalplay";
	}
	
	@GetMapping("/easyplay")
	public String easygame(int gameMode, String gameJenre, Model model) {
		log.info("easyplay...");
		List<GameVO> list = new ArrayList<GameVO>();
		int[] quest = new int[5];
		Random ran = new Random();
			if(gameJenre.equals("소설")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+101;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("고전시가")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+111;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("현대시가")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+121;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("시조")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+131;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("희곡")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+141;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("역사소설")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+151;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("한국시")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+161;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("산문")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+171;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}else if(gameJenre.equals("현대소설")){
				for(int i = 0; i < quest.length; i++){
					quest[i] =ran.nextInt(10)+181;
					for(int j = 0; j < i; j++){
						if(quest[j]==quest[i]){
							i--;}}}
			}																		
		for (int i = 0; i < quest.length; i++) {
			GameVO gvo = gameservice.easyQuest(quest[i]);
			list.add(gvo);
		}
		model.addAttribute("gameMode", gameMode);
		model.addAttribute("gameJenre", gameJenre);
		model.addAttribute("questList", list);
		
		return "/game/easyplay";
	}

}
