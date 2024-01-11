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



	//회원탈퇴
	public int deleteMember(Member loginUser,SqlSessionTemplate sqlSession) {
		
		
		return sqlSession.update("memberMapper.deleteMember",loginUser);
	}
	//카테고리 수정
	public int updateCategory(ArrayList<MemberCategory> categoryList, SqlSessionTemplate sqlSession) {
		
		
		return sqlSession.update("memberMapper.updateCategory",categoryList);
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

	//id 찾기
	public Member selectFindId(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectFindId", m);
	}

	//pwd 찾기(확인)
	public Member selectFindPwd(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectFindMember", m);
	}

	//pwd 새로입력
	public int resetMemberPwd(Member m, SqlSessionTemplate sqlSession) {
		return sqlSession.update("memberMapper.resetMemberPwd", m);
	}

	//아이디중복확인
	public int checkId(String memberId, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.checkId", memberId);
	}

	//닉네임중복확인
	public int checkNick(String nickName, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.checkNick", nickName);
	}

	//이메일중복확인
	public int checkEmail(String email, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	//폰번호 중복확인
	public int checkPhone(String phone, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.checkPhone",phone);
	}
	
}
