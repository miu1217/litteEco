package com.kh.littleEco.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.member.model.dao.MemberDao;
import com.kh.littleEco.member.model.vo.Member;

@Service
public class MemberServiceImp implements MemberService {

	//스프링이 관리할 수 있도록 어노테이션 등록
	@Autowired
	private MemberDao memberDao;
			
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원가입 메소드
	@Override
	public int insertMember(Member m) {
		
		int result1 = memberDao.insertMember(m, sqlSession);

	    //카테고리를 선택하면
	    if (m.getCategoryNo() != null) {
	        try {
	        	
	            int result2 = memberDao.insertMemberCategory(m, sqlSession);
	            
	        } catch (Exception e) {
	        	
	            return 0;
	        }
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
