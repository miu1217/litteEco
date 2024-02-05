package com.kh.littleEco.moiza.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.moiza.model.vo.MoizaCategory;
import com.kh.littleEco.moiza.model.vo.MoizaMember;


@Repository
public class MoizaDao {

	//모집 게시판 리스트 메소드 
	public ArrayList<Moiza> selectMoizaList(SqlSession sqlSession, int page, int moizaPage, int startIndex) {
		
		int limit = moizaPage;
		
		int offset = (page -1)* limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("moizaMapper.selectMoizaList", null , rowBounds);
	}
	
	//모집 게시판 리스트 메소드 
	public int insertMoiza(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.insert("moizaMapper.insertMoiza", moiza);
	}

	//모집 게시판 insert 시 생성자를 moizaMemebr 테이블에 입력 
	public int insertMoizaCreator(SqlSession sqlSession, int memberNo) {
		
		return sqlSession.insert("moizaMapper.insertMoizaCreator", memberNo);
	}

	//모집 게시판 category 입력
	public int insertMoizaCategory(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.insert("moizaMapper.insertMoizaCategory", moiza);
	}

	//모집 게시판 상세 페이지 조회
	public Moiza selectMoizaDetail(SqlSession sqlSession, int mno) {
	
		return sqlSession.selectOne("moizaMapper.selectMoizaDetail", mno);
	}

	//모집 게시판 상세 페이지 조회 시 카테고리 조회
	public ArrayList<MoizaCategory> selectMoizaCategory(SqlSession sqlSession,int mno) {
		
		return (ArrayList)sqlSession.selectList("moizaMapper.selectMoizaCategory", mno);
	}

	//모집 게시판 상세 페이지 생성자 조회
	public MoizaMember selectMoizaCreator(SqlSession sqlSession,int mno) {
		
		return sqlSession.selectOne("moizaMapper.selectMoizaCreator", mno);
	}

	//모집 게시판 업데이트 하는 메소드
	public int updateMoiza(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.update("moizaMapper.updateMoiza", moiza);
	}

	//모집 게시판 업데이트 시 카테고리 삭제
	public int deleteMoizaCategory(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.delete("moizaMapper.deleteMoizaCategory", moiza);
	}

	//모집 게시판 업데이트 시 카테고리 새로 입력
	public int insertNewMoizaCategory(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.insert("moizaMapper.insertNewMoizaCategory", moiza);
	}

	//모집게시판 삭제
	public int deleteMoiza(SqlSession sqlSession, int mno) {
		
		return sqlSession.delete("moizaMapper.deleteMoiza", mno);
	}

	
	//-------------모집 게시판 신청 및 회원 관리 메소드-----------------------
	//신청하기 버튼 눌렀을 때 신청되는 메소드
	public int insertMoizaMember(SqlSession sqlSession, MoizaMember m) {
		
		return sqlSession.insert("moizaMapper.insertMoizaMember", m);
	}

	//모집 단체 회원 리스트
	public ArrayList<Member> selectMoizaMember(SqlSession sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("moizaMapper.selectMoizaMember", mno);
	}

	//모집 단체 요청 리스트
	public ArrayList<Member> selectMoizaApplyMember(SqlSession sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("moizaMapper.selectMoizaApplyMember", mno);
	}

	//모집 단체 보류 리스트
	public ArrayList<Member> selectMoizaHoldMember(SqlSession sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("moizaMapper.selectMoizaHoldMember", mno);
	}

	//신청자 보류하는 메소드
	public int holdMember(SqlSession sqlSession, MoizaMember m) {
	
		return sqlSession.update("moizaMapper.holdMember", m);
	}

	//신청자 거절하는 메소드
	public int deleteApplyMember(SqlSession sqlSession, MoizaMember m) {
		
		return sqlSession.delete("moizaMapper.deleteApplyMember", m);
	}

	public int acceptApplyMember(SqlSession sqlSession, MoizaMember m) {
		
		return sqlSession.update("moizaMapper.acceptApplyMember", m);
	}

	public int deleteMember(SqlSession sqlSession, MoizaMember m) {
		
		return sqlSession.delete("moizaMapper.deleteMember", m);
	}

	//모집게시판 개수 조회
	public int moizaListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("moizaMapper.moizaListCount");
	}

	public ArrayList<Moiza> selectMoiza(SqlSession sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("moizaMapper.selectMoiza", memberNo);
	}


}
