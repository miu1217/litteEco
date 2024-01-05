package com.kh.littleEco.moiza.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.moiza.model.dao.MoizaDao;
import com.kh.littleEco.moiza.model.vo.Moiza;

@Service
public class MoizaServiceImpl implements MoizaService{

	
	@Autowired
	private MoizaDao moizaDao;
	
	
	@Autowired
	private SqlSession sqlSession;
	
	//모집 게시판 리스트 메소드 
	@Override
	public ArrayList<Moiza> MoizaList() {
		
		return moizaDao.MoizaList(sqlSession);
	}
	@Override
	public int MoizaInsert(Moiza moiza) {
		
		return moizaDao.MoizaInsert(sqlSession, moiza);
	}

	//모집 게시판 insert 시 생성자를 moizaMemebr 테이블에 입력 
	@Override
	public int MoizaCreatorInsert(int memberNo) {
		
		return moizaDao.MoizaCreatorInsert(sqlSession,memberNo);
	}

	//모집 게시판 category 입력
	@Override
	public int MoizaCategory(Moiza moiza) {
		
		return moizaDao.MoizaCategory(sqlSession, moiza);
	}


}
