package com.kh.littleEco.searchEco.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.searchEco.model.dao.SearchEcoDao;
import com.kh.littleEco.searchEco.model.vo.EcoLike;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

@Service
public class SearchEcoServiceImpl implements SearchEcoService {
	
	@Autowired
	private SearchEcoDao searchEcoDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int searchEcoListCount() {
		return searchEcoDao.searchEcoListcount(sqlSession);
	}

	@Override
	public ArrayList<SearchEco> searchEcoList(PageInfo pi) {
		return searchEcoDao.searchEcoList(sqlSession, pi);
	}

	//좋아요 삽입
	@Override
	public int ecoLikeInsert(int bno, int memberNo) {
		return searchEcoDao.ecoLikeInsert(sqlSession, bno, memberNo);
	}
	
	//좋아요 카운트
	@Override
	public int ecoLikeCount(int bno) {
		return searchEcoDao.ecoLikeCount(sqlSession, bno);
	}

	//좋아요 체크
	@Override
	public int ecoLikeCheck(int bno, int memberNo) {
		// TODO Auto-generated method stub
		return searchEcoDao.ecoLikeCheck(sqlSession, bno, memberNo);
	}

	//좋아요 업데이트
	@Override
	public int ecoLikeUpdate(int bno, int memberNo) {
		// TODO Auto-generated method stub
		return searchEcoDao.ecoLikeUpdate(sqlSession, bno, memberNo);
	}

	//좋아요 삭제
	@Override
	public int ecoLikeDelete(int bno, int memberNo) {
		// TODO Auto-generated method stub
		return searchEcoDao.ecoLikeDelete(sqlSession, bno, memberNo);
	}

	//좋아요 멤버체크
	@Override
	public int likeMemCheck(int bno, int memberNo) {
		// TODO Auto-generated method stub
		return searchEcoDao.likeMemCheck(sqlSession, bno, memberNo);
	}


	@Override
	public int getNextBrandNo() {
		return searchEcoDao.getNextBrandNo(sqlSession);
	}

	@Override
	public int getNextEcoBoardNo() {
		return searchEcoDao.getNextEcoBoardNo(sqlSession);
	}

	@Override
	public int getNextFileNo() {
		return searchEcoDao.getNextFileNo(sqlSession);
	}

	@Override
	public int insertBrand(Brand b) {
		return searchEcoDao.insertBrand(sqlSession, b);
	}
	
	@Override
	public int insertSearchEco(SearchEco se) {
		return searchEcoDao.insertSearchEco(sqlSession,se);
	}

	@Override
	public int insertAttachment(Attachment a) {
		return searchEcoDao.insertAttachment(sqlSession, a);
	}

	@Override
	public int increaseCountSearchEco(int bno) {
		return searchEcoDao.increaseCountSearchEco(sqlSession, bno);
	}

	@Override
	public SearchEco detailSearchEco(int bno) {
		return searchEcoDao.detailSearchEco(sqlSession, bno);
	}

	@Override
	public Brand selectBrandNo(Brand b) {
		
		return searchEcoDao.selectBrandNo(sqlSession, b);
	}

	@Override
	public int searchEcoDelete(int bno) {
		return searchEcoDao.searchEcoDelete(sqlSession, bno);
	}

	@Override
	public int searchEcoUpdate(SearchEco se) {
		return searchEcoDao.searchEcoUpdate(sqlSession, se);
	}

	//좋아요 인서트
	@Override
	public int ecoLikeInsert(EcoLike like) {
		return searchEcoDao.ecoLikeInsert(sqlSession, like);
	}

	@Override
	public int ecoLikeRemove(EcoLike like) {
		return searchEcoDao.ecoLikeRemove(sqlSession, like);
	}

}
