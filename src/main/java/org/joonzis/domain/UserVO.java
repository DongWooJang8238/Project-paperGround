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
public class UserVO {
	private int mno, userPoint;
	private String userName, userId, 
	userPw, userPhonenumber,userAddress, 
	userEmail, userGender, 
	userRole, nickName, userIcon;
	
	private Date userDate, registerDate;
	 
	 // 우편 번호
	 private String address;				
	 // 지번 주소	
	 private String streetAddress;		
	 // 상세 주소	
	 private String detailAddress;		
	
	

}
