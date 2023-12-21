package com.kh.littleEco.member.model.service;

import com.kh.littleEco.member.model.vo.Member;

public interface MemberService {

	int updateMember(Member loginUser);

	int insertMember();

	Member loginMember(Member m);

	int updateMember2(Member loginUser);

	

}
