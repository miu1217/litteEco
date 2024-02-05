package com.kh.littleEco.mypage.model.vo;

import java.util.Date;

import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InterestBoard {
//	MEMBER_NO	NUMBER	No		1	회원 번호
//	FOLDER_NO	NUMBER	Yes		2	폴더 번호
//	BOARD_NO	NUMBER	Yes		3	리사이클 게시판 번호
//	ECO_BOARD_NO	NUMBER	Yes		4	브랜드 게시판 번호
//	CLUB_NO	NUMBER	Yes		5	모집 게시판 번호
	
	private int memberNo;
	private int folderNo;
	private int boardNo;
	
	private int ecoBoardNo;
	
	private int moizaNo;
	
	private Date scrapDate;
	private String moizaName;
	private String folderName;
	private String recycleBoardTitle;
	private String ecoBoardTitle;
	
	
//	private recycleBoard recycleBoard;
//	private SearchEco SearchEco;
	
}
