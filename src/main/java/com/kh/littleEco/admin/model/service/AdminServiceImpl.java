package com.kh.littleEco.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.admin.model.dao.AdminDao;
import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.member.model.vo.Member;

import oracle.security.o3logon.a;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	//admin 페이지 회원 리스트 조회
	@Override
	public ArrayList<Member> MemberList() {
		
		return adminDao.MemberList(sqlSession);
	}

	//회원 update 시 상세 조회
	@Override
	public Member MemberDetail(int mno) {
		
		return adminDao.MemberDetail(sqlSession, mno);
	}

	//회원 update 시 기존에 선택한 카테고리 조회
	@Override
	public ArrayList<Category> MemberCategory(int mno) {
		
		return adminDao.MemberCategory(sqlSession, mno);
	}

	//member 업데이트 하는 메소드
	@Override
	public int updateMember(Member m) {
		
		return adminDao.updateMember(sqlSession, m);
	}

	//update 시 memberCategory 삭제
	@Override
	public int deleteMemberCategory(Member m) {
		
		return adminDao.deleteMemberCategory(sqlSession, m);
	}

	//update 시 member_category에 insert
	@Override
	public int insertMemberCategory(Member m) {
		
		return adminDao.insertMemberCategory(sqlSession, m);
	}

	//member 삭제하는 메소드 (status n으로 변경)
	@Override
	public int deleteMember(int mno) {
		
		return adminDao.deleteMember(sqlSession, mno);
	}

}
