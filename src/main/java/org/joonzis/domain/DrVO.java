package org.joonzis.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DrVO {
	private int DRNo;
	private String DRtitle;
	private String DRcategory;
	private String DRcontent;
}
