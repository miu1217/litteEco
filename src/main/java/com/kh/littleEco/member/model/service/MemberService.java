package com.kh.littleEco.member.model.service;

import java.util.ArrayList;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

public interface MemberService {
	
	//회원정보 수정
	int updateMember(Member loginUser);

	//비밀번호 변경
	int updateMember2(Member loginUser);

	//회원가입 메소드
	int insertMember(Member m);

	//로그인 메소드
	Member loginMember(Member m);

	int deleteMember(Member loginUser);

	int updateCategory(ArrayList<MemberCategory> categoryList);
	
}
