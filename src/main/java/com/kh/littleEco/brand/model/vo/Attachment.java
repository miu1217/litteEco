package com.kh.littleEco.brand.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Attachment {
	private int fileNo;
	private int brandNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date createDate;
	private int fileLevel;
	private String status;
}
