package com.kh.littleEco.popularSearch.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.popularSearch.model.vo.PopularSearch;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

@Repository
public class PopularSearchDao {

	//검색어 상위10개 조회
	public ArrayList<PopularSearch> selectKeyword(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("searchMapper.selectKeyword");
	}

	public int insertKeyword(SqlSessionTemplate sqlSession,String keyword) {

		return sqlSession.insert("searchMapper.insertKeyword",keyword);
	}
	
	//조회수 초기화 메소드
	public int resetCount(SqlSessionTemplate sqlSession) {
		
		
		return sqlSession.update("searchMapper.resetCount");
	}

	public ArrayList<PopularSearch> autoComplate(SqlSessionTemplate sqlSession, String keyword) {

		return (ArrayList)sqlSession.selectList("searchMapper.autoComplate",keyword);
	}

	public ArrayList<SearchEco> searchEcoKeyword(SqlSessionTemplate sqlSession, String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("searchEcoMapper.searchKeyword",keyword);
	}

	public ArrayList<recycleBoard> searchRecycleBoardKeyword(SqlSessionTemplate sqlSession, String keyword) {

		return (ArrayList)sqlSession.selectList("recycleBoardMapper.searchRecycle",keyword);
	}

	public ArrayList<Moiza> searchMoizaKeyword(SqlSessionTemplate sqlSession, String keyword) {

		return (ArrayList)sqlSession.selectList("moizaMapper.searchMoiza",keyword);
	}
	
	
	
}
