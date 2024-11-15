package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WriteVO {
	private int wno, mno, views, reply, likeCount, epCount;
	private String writeType, genre, title, description, coverImage, status, writer;
	private Date startDate, updateDate;
	
	private String writeBookMark;
}
