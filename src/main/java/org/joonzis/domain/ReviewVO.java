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
public class ReviewVO {
	private int reno, bno, mno, rating;
	private String reviewContent, reviewImage;
	private Date reviewDate;
	
	private String userName;
}
