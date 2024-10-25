package org.joonzis.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class QnaVO {
	private int qnaNo; 
	private int qnaCategory;
	private String qnaQuestion;
	private String qnaAnswer;
	

}
