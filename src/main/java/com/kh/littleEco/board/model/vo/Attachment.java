package com.kh.littleEco.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Attachment {
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
