package org.joonzis.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UsedBookVO {
	private int ubno, mno, gno, ubookPrice;
	private String title, content, ubookImage, status;
	private Date ubookDate; 
	
	private List<usedBookImgVO> usedBookImgs;
}
