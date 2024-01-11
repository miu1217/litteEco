package com.kh.littleEco.moiza.model.service;

import java.util.ArrayList;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.moiza.model.vo.MoizaCategory;
import com.kh.littleEco.moiza.model.vo.MoizaMember;

public interface MoizaService {
	
	//모집 게시판 리스트 메소드
	ArrayList<Moiza> selectMoizaList();
	
	//모집 게시판 insert 시 moiza 입력
	int insertMoiza(Moiza moiza);

	//모집 게시판 insert 시 생성자를 moizaMemebr 테이블에 입력 
	int insertMoizaCreator(int memberNo);

	//모집 게시판 category 입력
	int insertMoizaCategory(Moiza moiza);

	//모집 게시판 상세 페이지 조회
	Moiza selectMoizaDetail(int mno);

	//모집 게시판 상세 페이지 조회 시 카테고리 조회
	ArrayList<MoizaCategory> selectMoizaCategory(int mno);

	//모집 게시판 상세 페이지 생성자 조회
	MoizaMember selectMoizaCreator(int mno);

	//모집 게시판 업데이트 하는 메소드
	int updateMoiza(Moiza moiza);

	//모집 게시판 업데이트 시 카테고리 삭제
	int deleteMoizaCategory(Moiza moiza);

	//모집 게시판 업데이트 시 카테고리 새로 입력
	int insertNewMoizaCategory(Moiza moiza);

	//모집게시판 삭제
	int deleteMoiza(int mno);

	//-------------모집 게시판 신청 및 회원 관리 메소드-----------------------
	
	//신청하기 버튼 눌렀을 때 신청되는 메소드
	int insertMoizaMember(MoizaMember m);

	//모집 단체 회원 리스트
	ArrayList<Member> selectMoizaMember(int mno);

	//모집 단체 요청 리스트
	ArrayList<Member> selectMoizaApplyMember(int mno);

	
	//모집 단체 보류 리스트
	ArrayList<Member> selectMoizaHoldMember(int mno);

	//신청자 보류하는 메소드
	int holdMember(MoizaMember memberNo);

	//신청자 거절하는 메소드
	int deleteApplyMember(MoizaMember m);

	//신청자 수락 메소드
	int acceptApplyMember(MoizaMember m);

	//회원 삭제 메소드
	int deleteMember(MoizaMember m);



}
