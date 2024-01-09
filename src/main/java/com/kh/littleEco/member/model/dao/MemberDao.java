package com.kh.littleEco.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

@Repository //저장소 : DB와 관련된 작업 처리
public class MemberDao {
	
	//회원정보 수정 
	public int updateMember(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.updateMember",loginUser);
	}
	
	//비밀번호 변경 
	public int updateMember2(SqlSessionTemplate sqlSession, Member loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePwd",loginUser);
	}


	//회원가입 메소드
	public int insertMember(Member m,SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}

	//로그인 메소드
	public Member loginMember(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.loginMember",m);
	}

	//멤버카테고리 삽입 메소드
	public int insertMemberCategory(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("memberMapper.insertMemberCategory", m);
	}

	//회원탈퇴
	public int deleteMember(Member loginUser,SqlSessionTemplate sqlSession) {
		
		
		return sqlSession.update("memberMapper.deleteMember",loginUser);
	}
	//카테고리 수정
	public int updateCategory(ArrayList<MemberCategory> categoryList, SqlSessionTemplate sqlSession) {
		
		
		return sqlSession.update("memberMapper.updateCategory",categoryList);
	}

}