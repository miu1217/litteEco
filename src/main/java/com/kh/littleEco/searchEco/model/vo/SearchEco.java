package com.kh.littleEco.searchEco.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchEco {
	
	
//	ECO_BOARD_NO	NUMBER
//	MEMBER_NO	NUMBER
//	BRAND_NO	NUMBER
//	THUM_IMG	NUMBER
//	ECO_BOARD_TITLE	VARCHAR2(300 BYTE)
//	ECO_BOARD_CONTENT	VARCHAR2(4000 BYTE)
//	COUNT	NUMBER
//	LIKE_COUNT	NUMBER
//	CREATE_DATE	DATE
//	MODIFY_DATE	DATE
//	STATUS	CHAR(1 BYTE)0
	private int ecoBoardNo;
	private int memberNo;
	private int brandNo;
	private String thumImg;
	private String ecoBoardTitle;
	private String ecoBoardContent;
	private String changeName; 
	private int count;
	private int likeCount;    
	private String createDate;
	private String modifyDate;
	private String status;
	private String brandInfo;
	private String brandUrl;
	
	private String hawonnimbabo;
	

}
