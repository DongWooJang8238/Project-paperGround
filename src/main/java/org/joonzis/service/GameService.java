package org.joonzis.service;

import org.joonzis.domain.GameVO;

public interface GameService {

	public String easyCheck(String gameAnswer);
	public GameVO nomalQuest(int quest);
	public GameVO easyQuest(int quest);
	public int gameDone(int mno);
	public String pointGetCheck(int mno);
	public int userCheck(int mno);
	public int insertUser(int mno);
	public int updatePGdate(int mno);
	public int pointHistory(int mno);
	

}
