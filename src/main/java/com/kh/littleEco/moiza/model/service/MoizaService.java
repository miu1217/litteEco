package com.kh.littleEco.moiza.model.service;

import java.util.ArrayList;

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



}
