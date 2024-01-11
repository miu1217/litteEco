package com.kh.littleEco.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.member.model.dao.MemberDao;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

@Service
public class MemberServiceImpl implements MemberService{
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	//회원정보 수정
	@Override
	public int updateMember(Member loginUser) {
		
		return memberDao.updateMember(sqlSession,loginUser);
	}
	//비밀번호 변경
	@Override
	public int updateMember2(Member loginUser) {
		// TODO Auto-generated method stub
		return memberDao.updateMember2(sqlSession,loginUser);
	}
	
	//회원가입
	@Override
	public int insertMember(Member m) {
		
		int result1 = memberDao.insertMember(m, sqlSession);

	    //카테고리
	    if (m.getCategoryNo() != null) {
	        try {
	        	
	            int result2 = memberDao.insertMemberCategory(m, sqlSession);
	            
	        } catch (Exception e) {
	        	
	            return 0;
	        }
	    } else {
	        //카테고리 정보 없음
	    }

	    //결과 리턴
	    if (result1 > 0) {
	        return 1;
	    } else {
	        return 0;
	    }
	}

	//로그인 메소드
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(m,sqlSession);
	}
	
	//회원탈퇴 메소드
	@Override
	public int deleteMember(Member loginUser) {
		// TODO Auto-generated method stub
		return memberDao.deleteMember(loginUser,sqlSession);
	}
	@Override
	public int updateCategory(ArrayList<MemberCategory> categoryList) {
		
		
		return memberDao.updateCategory(categoryList,sqlSession);
	}
	
	//id 찾기
	@Override
	public Member selectFindId(Member m) {
		return memberDao.selectFindId(m,sqlSession);
	}

	//pwd 찾기(확인)
	@Override
	public Member selectFindPwd(Member m) {
		return memberDao.selectFindPwd(m,sqlSession);
	}

	//resetPwd
	@Override
	public int resetMemberPwd(Member m) {
		return memberDao.resetMemberPwd(m,sqlSession);
	}

	//아이디 중복확인
	@Override
	public int checkId(String memberId) {
		return memberDao.checkId(memberId,sqlSession);
	}

	//닉네임 중복확인
	@Override
	public int checkNick(String nickName) {
		return memberDao.checkNick(nickName,sqlSession);
	}

	//이메일 중복확인
	@Override
	public int checkEmail(String email) {
		return memberDao.checkEmail(email,sqlSession);
	}

	//폰번호 중복확인
	@Override
	public int checkPhone(String phone) {
		return memberDao.checkPhone(phone,sqlSession);
	}




}
