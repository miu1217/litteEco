package com.kh.littleEco.mypage.model.vo;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyPost {
	
	private int memberNo;
	private int ecoBoardNo;
	private String ecoTitle;
	private int rcyBoardNo;
	private String rcyTitle;
	private int moizaNo;
	private String moizaName;
	private String moizaGoal;
	private String moizaInfo;
    private int count;
	
	private SearchEco SearchEco;
    private recycleBoard recycleBoard;
    private Member member;
}
