package org.joonzis.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GameVO {
	private int gameNo;
	private int gameMode;
	private String gameQuest;
	private String gameAnswer;
	private String gameJenre;
	
	
	
}
