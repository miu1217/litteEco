package com.kh.littleEco.moiza.model.service;

import java.util.ArrayList;

import com.kh.littleEco.moiza.model.vo.Moiza;

public interface MoizaService {
	
	//모집 게시판 리스트 메소드
	ArrayList<Moiza> MoizaList();
	
	//모집 게시판 insert 시 moiza 입력
	int MoizaInsert(Moiza moiza);

	//모집 게시판 insert 시 생성자를 moizaMemebr 테이블에 입력 
	int MoizaCreatorInsert(int memberNo);

	//모집 게시판 category 입력
	int MoizaCategory(Moiza moiza);


}
