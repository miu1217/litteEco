package com.kh.littleEco.recycleboard.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class recycleBoard {
	private int boardNo;
	private int memberNo;
	private String recycleBoardTitle;
	private String recycleBoardContent;
	//썸네일용 경로와 변겨된 파일이름(서버에 업로드된 이름)을 합쳐 담을 필드변수
	private String thumImg;
	private int count;
	private String createDate;
	private String modifyDate;
	private String status;
	private List<MultipartFile> files;
	private int rbno;
	
	
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
private String boOriginName;
private String boChangeName;
private String filePath;
	
}
