package com.kh.littleEco.moiza.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.moiza.model.vo.Moiza;

@Repository
public class MoizaDao {

	//모집 게시판 리스트 메소드 
	public ArrayList<Moiza> MoizaList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("moizaMapper.MoizaList");
	}
	
	//모집 게시판 리스트 메소드 
	public int MoizaInsert(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.insert("moizaMapper.MoizaInsert", moiza);
	}

	//모집 게시판 insert 시 생성자를 moizaMemebr 테이블에 입력 
	public int MoizaCreatorInsert(SqlSession sqlSession, int memberNo) {
		
		return sqlSession.insert("moizaMapper.MoizaCreatorInsert", memberNo);
	}

	//모집 게시판 category 입력
	public int MoizaCategory(SqlSession sqlSession, Moiza moiza) {
		
		return sqlSession.insert("moizaMapper.MoizaCategory", moiza);
	}


}
