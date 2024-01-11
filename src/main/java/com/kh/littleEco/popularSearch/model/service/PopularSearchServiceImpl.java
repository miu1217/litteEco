package com.kh.littleEco.popularSearch.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.popularSearch.model.dao.PopularSearchDao;
import com.kh.littleEco.popularSearch.model.vo.PopularSearch;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class PopularSearchServiceImpl implements PopularSearchService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PopularSearchDao psDao;
	
	//검색어 조회수 상위10개 조회
	@Override
	public ArrayList<PopularSearch> selectKeyword() {
		
		return psDao.selectKeyword(sqlSession);
	}
	
	//조회수 증가 메소드
	@Override
	public int insertKeyword(String keyword) {

		return psDao.insertKeyword(sqlSession,keyword);
	}
	
	//조회수 초기화 메소드
	@Scheduled(cron = "0 0 */4 * * *")
	@Override
	public int resetCount() {
		
		log.info("실행");
		return psDao.resetCount(sqlSession);
	}
	
	//검색어 자동완성 메소드
	@Override
	public ArrayList<PopularSearch> autoComplate(String keyword) {

		return psDao.autoComplate(sqlSession,keyword);
	}
	
	
	@Override
	public ArrayList<SearchEco> searchEcoKeyword(String keyword) {
		// TODO Auto-generated method stub
		return psDao.searchEcoKeyword(sqlSession,keyword);
	}

	@Override
	public ArrayList<recycleBoard> searchRecycleBoardKeyword(String keyword) {
		// TODO Auto-generated method stub
		return psDao.searchRecycleBoardKeyword(sqlSession,keyword);
	}

	@Override
	public ArrayList<Moiza> searchMoiza(String keyword) {
		// TODO Auto-generated method stub
		return psDao.searchMoizaKeyword(sqlSession, keyword);
	}
	
}
