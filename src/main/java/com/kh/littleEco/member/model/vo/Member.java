package com.kh.littleEco.member.model.vo;

import java.util.ArrayList;

//import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {

	private int memberNo;
	private ArrayList<Integer> categoryNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickName;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	private String createDate;
	private String status;
	
	//private ArrayList<Category> cList;
	
	
}
