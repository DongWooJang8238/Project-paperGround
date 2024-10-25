package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class ReplyVO {
	private int replyno, boardno, mno, comLikeCount; 
	private String reply, replyer;
	private Date replyDate, updateDate;
}
