package com.kh.littleEco.mypage.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
@AllArgsConstructor
public class Mypage {
	
	private int folderNo;
	private int memberNo;
	private String folderName;
	private int parentFolderNo;
	private String createDate;

}
