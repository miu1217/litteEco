package com.kh.littleEco.searchEco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EcoLike {

//	MEMBER_NO
//	ECO_BRAND_NO
//	STATUS
	
	private int memberNo;
	private int ecoBoardNo; //에코브랜드 게시글 넘버
	private String status;
	
	
}
