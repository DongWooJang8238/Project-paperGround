package org.joonzis.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class BoardVO {
	private int boardno, mno, readCount, replyCount;
	private String attachFile, title, content, writer, category;
	private Date regDate, updateDate;
	
	private List<BoardAttachVO> attachList;
	private int likecount;
}
