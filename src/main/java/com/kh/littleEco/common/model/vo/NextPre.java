package com.kh.littleEco.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

/*
 * 공지사항 이전글 다음글 메소드를 위한 VO
 * 
 * */
public class NextPre {

	private int nextBoard;
	private int preBoard;
	private String nextTitle;
	private String preTitle;
	

}
