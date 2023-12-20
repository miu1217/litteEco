package com.kh.littleEco.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

@Repository
public class AdminDao {

	//admin 페이지 회원 리스트 조회
	public ArrayList<Member> MemberList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.MemberList");
	}

	//회원 update 시 상세 조회
	public Member MemberDetail(SqlSession sqlSession, int mno) {
		
		return sqlSession.selectOne("adminMapper.MemberDetail", mno);
	}

	//회원 update 시 기존에 선택한 카테고리 조회
	public ArrayList<Category> MemberCategory(SqlSession sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.MemberCategory", mno);
	}

	//member 업데이트 하는 메소드
	public int updateMember(SqlSession sqlSession, Member m) {
	
		return sqlSession.update("adminMapper.updateMember", m);
	}

	//update 시 memberCategory 삭제
	public int deleteMemberCategory(SqlSession sqlSession, Member m) {
		
		return sqlSession.delete("adminMapper.deleteMemberCategory", m);
	}

	
	//update 시 member_category에 insert
	public int insertMemberCategory(SqlSession sqlSession, Member m) {
		
		return sqlSession.insert("adminMapper.insertMemberCategory", m);
	}

	//member 삭제하는 메소드 (status n으로 변경)
	public int deleteMember(SqlSession sqlSession, int mno) {
		
		return sqlSession.update("adminMapper.deleteMember", mno);
	}

}
