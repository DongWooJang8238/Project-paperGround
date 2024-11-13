package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class WriteEpisodeVO {
	private int episodeno, wno, episodeCount;
	private String episodeTitle, content, episodeComment;
	private Date epdate;
}
