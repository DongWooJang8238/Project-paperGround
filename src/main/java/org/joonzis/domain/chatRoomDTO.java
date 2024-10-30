package org.joonzis.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoomDTO {
	private int chatno, ubno, sellmno, buymno;
	private Date roomdate;
	
	private String userName;
}
