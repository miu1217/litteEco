package com.kh.littleEco.moiza.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.moiza.model.dao.MoizaDao;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.moiza.model.vo.MoizaCategory;
import com.kh.littleEco.moiza.model.vo.MoizaMember;

@Service
public class MoizaServiceImpl implements MoizaService{

	
	@Autowired
	private MoizaDao moizaDao;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	//모집 게시판 리스트 메소드 
	@Override
	public ArrayList<Moiza> selectMoizaList() {
		
		return moizaDao.selectMoizaList(sqlSession);
	}
	@Override
	public int insertMoiza(Moiza moiza) {
		
		return moizaDao.insertMoiza(sqlSession, moiza);
	}

	//모집 게시판 insert 시 생성자를 moizaMemebr 테이블에 입력 
	@Override
	public int insertMoizaCreator(int memberNo) {
		
		return moizaDao.insertMoizaCreator(sqlSession,memberNo);
	}

	//모집 게시판 category 입력
	@Override
	public int insertMoizaCategory(Moiza moiza) {
		
		return moizaDao.insertMoizaCategory(sqlSession, moiza);
	}
	
	//모집 게시판 상세 페이지 조회
	@Override
	public Moiza selectMoizaDetail(int mno) {
		
		return moizaDao.selectMoizaDetail(sqlSession, mno);
	}
	
	//모집 게시판 상세 페이지 조회 시 카테고리 조회
	@Override
	public ArrayList<MoizaCategory> selectMoizaCategory(int mno) {
		
		return moizaDao.selectMoizaCategory(sqlSession, mno);
	}
	
	//모집 게시판 상세 페이지 생성자 조회
	@Override
	public MoizaMember selectMoizaCreator(int mno) {
		
		return moizaDao.selectMoizaCreator(sqlSession, mno);
	}
	
	//모집 게시판 업데이트 하는 메소드
	@Override
	public int updateMoiza(Moiza moiza) {
		
		return moizaDao.updateMoiza(sqlSession,moiza);
	}
	
	//모집 게시판 업데이트 시 카테고리 삭제
	@Override
	public int deleteMoizaCategory(Moiza moiza) {
		
		return moizaDao.deleteMoizaCategory(sqlSession, moiza);
	}
	
	//모집 게시판 업데이트 시 카테고리 새로 입력
	@Override
	public int insertNewMoizaCategory(Moiza moiza) {
		
		return moizaDao.insertNewMoizaCategory(sqlSession, moiza);
	}
	
	//모집게시판 삭제
	@Override
	public int deleteMoiza(int mno) {
		
		return	moizaDao.deleteMoiza(sqlSession, mno);
	}
	
	//-------------모집 게시판 신청 및 회원 관리 메소드-----------------------
	
	//신청하기 버튼 눌렀을 때 신청되는 메소드
	@Override
	public int insertMoizaMember(MoizaMember m) {
		
		return moizaDao.insertMoizaMember(sqlSession, m);
	}
	
	//모집 단체 회원 리스트
	@Override
	public ArrayList<Member> selectMoizaMember(int mno) {
		
		return moizaDao.selectMoizaMember(sqlSession, mno);
	}
	
	//모집 단체 요청 리스트
	@Override
	public ArrayList<Member> selectMoizaApplyMember(int mno) {
		
		return moizaDao.selectMoizaApplyMember(sqlSession, mno);
	}
	
	//모집 단체 보류 리스트
	@Override
	public ArrayList<Member> selectMoizaHoldMember(int mno) {
		
		return moizaDao.selectMoizaHoldMember(sqlSession, mno);
	}
	
	//신청자 보류하는 메소드
	@Override
	public int holdMember(MoizaMember m) {
		
		return moizaDao.holdMember(sqlSession, m);
	}
	
	//신청자 거절하는 메소드
	@Override
	public int deleteApplyMember(MoizaMember m) {
		
		return moizaDao.deleteApplyMember(sqlSession, m);
	}
	
	//신청자 수락 메소드
	@Override
	public int acceptApplyMember(MoizaMember m) {
		
		return moizaDao.acceptApplyMember(sqlSession, m);
	}
	
	//회원 삭제 메소드
	@Override
	public int deleteMember(MoizaMember m) {
		
		return moizaDao.deleteMember(sqlSession, m);
	}
	

	

}
