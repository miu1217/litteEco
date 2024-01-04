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


	
}
