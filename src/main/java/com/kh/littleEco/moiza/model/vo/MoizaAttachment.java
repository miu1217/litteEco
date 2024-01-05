package com.kh.littleEco.clud.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubAttachment {
	private int fileNo;
	private int clubNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date createDate;
	private int fileLevel;
	private String status;
}
