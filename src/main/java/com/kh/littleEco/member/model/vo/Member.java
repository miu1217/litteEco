package com.kh.littleEco.member.model.vo;

import java.util.ArrayList;

import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

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
	private String withdrawalReason;  // WITHDRAWAL_REASON 탈퇴사유 담을 컬럼
	
	
    private SearchEco SearchEco;
    private recycleBoard recycleBoard;
	

}
