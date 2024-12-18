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
public class ReportBoardVO {
	private int reportBoardno, mno, readCount, replyCount;
	private String title, content, writer, attachFile, reportCategory;
	private Date regDate, updatedate;
	
}
