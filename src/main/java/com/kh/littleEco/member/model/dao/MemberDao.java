package com.kh.littleEco.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.member.model.vo.Member;

@Repository //저장소 : DB와 관련된 작업 처리
public class MemberDao {
	
	//회원정보 수정 
	public int updateMember(SqlSessionTemplate sqlSession, Member loginUser) {
		return sqlSession.update("memberMapper.updateMember",loginUser);
	}
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int updateMember2(SqlSessionTemplate sqlSession, Member loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updatePwd",loginUser);
	}

	


}
