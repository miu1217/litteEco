package com.kh.littleEco.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Notice {
	
//	BOARD_NO	NUMBER
//	MEMBER_NO	NUMBER
//	BOARD_CATEGORY	NUMBER
//	BOARD_TITLE	VARCHAR2(300 BYTE)
//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
//	COUNT	NUMBER
//	CREATE_DATE	DATE
//	MODIFY_DATE	DATE
//	STATUS	CHAR(1 BYTE)
	
	private int boardNo;
	private int memberNo;
	private int boardCategory;
	private String boardTitle;
	private String boardContent;
	private int count;
	private String createDate;
	private String modifyDate;
	private String status;
	
	//임시
	private int NBNO;
	
	
	//Attachment 관련
	
//	BO_FILE_NO	NUMBER
//	BOARD_NO	NUMBER
//	BOARD_TYPE	NUMBER
//	BO_FILE_TYPE	NUMBER
//	BO_ORIGIN_NAME	VARCHAR2(255 BYTE)
//	BO_CHANGE_NAME	VARCHAR2(255 BYTE)
//	FILE_PATH	VARCHAR2(1000 BYTE)
//	FILE_LEVEL	NUMBER
//	CREATE_DATE	DATE
//	STATUS	CHAR(1 BYTE)
	
	private int boFileNo;
	private int boardType;
	private int boFileType;
	private String boOriginName;
	private String boChangeName;
	private String filePath;
	private int fileLevel;
	
	
	
}
