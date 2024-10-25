package org.joonzis.mapper;

import java.util.List;

import org.joonzis.domain.BoardAttachVO;

public interface BoardAttachMapper {
	public int register(BoardAttachVO bvo);
	public int remove(String uuid);
	public int deleteBoard(int boardno);
	public List<BoardAttachVO> findByBoardno(int boardno);
}
