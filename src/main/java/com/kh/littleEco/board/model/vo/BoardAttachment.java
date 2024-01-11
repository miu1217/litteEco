package com.kh.littleEco.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardAttachment {
	
	
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
	private int boardNo;
	private int boardType;
	private int boFileType;
	private String boOriginName;
	private String boChangeName;
	private String filePath;
	private int fileLevel;
	private String createDate;
	private String status;
	

}
