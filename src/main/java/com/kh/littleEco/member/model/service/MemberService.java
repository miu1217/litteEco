package com.kh.littleEco.member.model.service;

import com.kh.littleEco.member.model.vo.Member;

public interface MemberService {

	//회원가입 메소드
	int insertMember(Member m);

	//로그인 메소드
	Member loginMember(Member m);
	
}
