package org.joonzis.domain;

import java.sql.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserpointVO {
	private int mno, point;
	private String pointArea,status;
	private Date pointGetDate;
	
	

}
