package org.joonzis.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RefundVO {
	private int mno; 
	private int odno;
	
	private String refundOrCancel;
	
	private String reason;
	private String detail;
	private String bankName;
	private String accountNumber;
	

}
