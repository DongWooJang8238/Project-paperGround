package org.joonzis.service;

import org.joonzis.domain.GameVO;
import org.joonzis.mapper.GameMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class GameServiceImpl implements GameService{
	
	@Autowired
	private GameMapper gamemapper;
	
	@Override
	public String easyCheck(String gameAnswer) {
		log.info("easycheck......"+gameAnswer);
		return gamemapper.easyCheck(gameAnswer);
	}
	@Override
	public GameVO nomalQuest(int quest) {
		log.info("nomalQuest...........");
		return gamemapper.nomalQuest(quest);
	}
	@Override
	public GameVO easyQuest(int quest) {
		log.info("nomalQuest...........");
		return gamemapper.easyQuest(quest);
	}
	@Override
	public int gameDone(int mno) {
		log.info("gameDone......");
		return gamemapper.gameDone(mno);
	}
	@Override
	public String pointGetCheck(int mno) {
		log.info("pointGetCheck......");
		return gamemapper.pointGetCheck(mno);
	}
	@Override
	public int userCheck(int mno) {
		log.info("userCheck......");
		return gamemapper.userCheck(mno);
	}
	@Override
	public int insertUser(int mno) {
		log.info("insertUser......");
		return gamemapper.insertUser(mno);
	}
	@Override
	public int updatePGdate(int mno) {
		log.info("updatePGdate......");
		return gamemapper.updatePGdate(mno);
	}
	@Override
	public int pointHistory(int mno) {
		log.info("pointHistory......");
		return gamemapper.pointHistory(mno);
	}

}
