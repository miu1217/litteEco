package com.kh.littleEco.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.member.model.vo.Member;

public interface AdminService {

	//admin 페이지 회원 리스트 조회
	ArrayList<Member> MemberList();

	//회원 update 시 상세 조회
	Member MemberDetail(int mno);

	//회원 update 시 기존에 선택한 카테고리 조회
	ArrayList<Category> MemberCategory(int mno);

	//member 업데이트 하는 메소드
	int updateMember(Member m);

	//update 시 memberCategory 삭제
	int deleteMemberCategory(Member m);

	//update 시 member_category에 insert
	int insertMemberCategory(Member m);

	//member 삭제하는 메소드 (status n으로 변경)
	int deleteMember(int mno);

}
