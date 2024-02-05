package com.kh.littleEco.member.model.service;

import com.kh.littleEco.member.model.vo.Member;

public interface MemberService {

	// 회원정보 수정
	int updateMember(Member loginUser);

	// 비밀번호 변경
	int updateMember2(Member loginUser);

	int deleteMember(Member loginUser);

	// 회원가입 메소드
	int insertMember(Member m);

	// 로그인 메소드
	Member loginMember(Member m);

	// id 찾기
	Member selectFindId(Member m);

	// pwd 찾기(확인)
	Member selectFindPwd(Member m);

	// resetPwd (새 비밀번호입력)
	int resetMemberPwd(Member m);

	// 아이디 중복확인
	int checkId(String memberId);

	// 닉네임 중복확인
	int checkNick(String nickName);

	// 이메일 중복확인
	int checkEmail(String email);

	// 폰번호 중복화인
	int checkPhone(String phone);

}
