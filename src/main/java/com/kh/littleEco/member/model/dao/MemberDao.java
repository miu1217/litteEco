package com.kh.littleEco.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.member.model.vo.Member;

@Repository
public class MemberDao {

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

}
