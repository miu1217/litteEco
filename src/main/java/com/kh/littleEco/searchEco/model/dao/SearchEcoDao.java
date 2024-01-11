package com.kh.littleEco.searchEco.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.searchEco.model.vo.EcoLike;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

@Repository
public class SearchEcoDao {
	
	private EcoLike l = new EcoLike();
	

	//서치에코 게시글 수 카운트 
	public int searchEcoListcount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("searchEcoMapper.searchEcoListCount");
	}

	//서치에코 리스트 뷰
	public ArrayList<SearchEco> searchEcoList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		//System.out.println(sqlSession.selectList("searchEcoMapper.searchEcoList"));
		
		return (ArrayList)sqlSession.selectList("searchEcoMapper.searchEcoList", null, rowBounds);
	}

	//좋아요 인서트
	public int ecoLikeInsert(SqlSessionTemplate sqlSession, int bno, int memberNo) {
		
		l.setEcoBoardNo(bno);
		l.setMemberNo(memberNo);
		
		System.out.println("ecoLikeInsert DAO" + bno + ", " + memberNo);
		
		return sqlSession.insert("searchEcoMapper.ecoLikeInsert", l);
	}

	//좋아요 카운트
	public int ecoLikeCount(SqlSessionTemplate sqlSession, int bno) {
		
		return sqlSession.selectOne("searchEcoMapper.ecoLikeCount", bno);
	}

	//좋아요 체크
	public int ecoLikeCheck(SqlSessionTemplate sqlSession, int bno, int memberNo) {
		
		l.setEcoBoardNo(bno);
		l.setMemberNo(memberNo);
		
		return sqlSession.selectOne("searchEcoMapper.ecoLikeCheck", l);
	}

	//좋아요 업데이트
	public int ecoLikeUpdate(SqlSessionTemplate sqlSession, int bno, int memberNo) {
		
		l.setEcoBoardNo(bno);
		l.setMemberNo(memberNo);
		
		return sqlSession.update("searchEcoMapper.ecoLikeUpdate", l);
	}

	//좋아요 삭제
	public int ecoLikeDelete(SqlSessionTemplate sqlSession, int bno, int memberNo) {
		
		l.setEcoBoardNo(bno);
		l.setMemberNo(memberNo);
		
		return sqlSession.delete("searchEcoMapper.ecoLikeDelete", l);
	}

	//좋아요멤버 체크
	public int likeMemCheck(SqlSessionTemplate sqlSession, int bno, int memberNo) {
		
		l.setEcoBoardNo(bno);
		l.setMemberNo(memberNo);
		
		return sqlSession.selectOne("searchEcoMapper.likeMemCheck", l);
	}

	//브랜드 시퀀스
	public int getNextBrandNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("searchEcoMapper.getNextBrandNo");
	}

	//보드 시퀀스
	public int getNextEcoBoardNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("searchEcoMapper.getNextEcoBoardNo");
	}

	//어태치먼트 시퀀스
	public int getNextFileNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("searchEcoMapper.getNextFileNo");
	}

	//브랜드 인서트
	public int insertBrand(SqlSessionTemplate sqlSession, Brand b) {
		return sqlSession.insert("searchEcoMapper.insertBrand", b);
	}

	//보드 인서트
	public int insertSearchEco(SqlSessionTemplate sqlSession, SearchEco se) {
		return sqlSession.insert("searchEcoMapper.insertSearchEco", se);
	}

	//어태치먼트 인서트
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("searchEcoMapper.insertAttachment", a);
	}

	//조회수 증가
	public int increaseCountSearchEco(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("searchEcoMapper.increaseCountSearchEco", bno);
	}

	//상세보기
	public SearchEco detailSearchEco(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("searchEcoMapper.detailSearchEco", bno);
	}

	public Brand selectBrandNo(SqlSessionTemplate sqlSession, Brand b) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("searchEcoMapper.selectBrandNo", b);
	}

	//삭제하기
	public int searchEcoDelete(SqlSessionTemplate sqlSession, int bno) {

		return sqlSession.delete("searchEcoMapper.searchEcoDelete", bno);
	}

	public int searchEcoUpdate(SqlSessionTemplate sqlSession, SearchEco se) {
		return sqlSession.update("searchEcoMapper.searchEcoUpdate", se);
	}

	//좋아요 등록
	public int ecoLikeInsert(SqlSessionTemplate sqlSession, EcoLike like) {
		
			SearchEco se = new SearchEco();
			se.setEcoBoardNo(like.getEcoBoardNo());
			
			int likeCount = 0;
			
			//해당 게시물 좋아요 + 1
			sqlSession.update("searchEcoMapper.likeUp",like);
			
			//좋아요 테이블에 인서트
			int result = sqlSession.update("searchEcoMapper.likeSave",like);
			
			if(result == 1) {
				likeCount = sqlSession.selectOne("searchEcoMapper.likeCount",like.getEcoBoardNo());
			}
			
			return likeCount;
	}

	//좋아요 취소
	public int ecoLikeRemove(SqlSessionTemplate sqlSession, EcoLike like) {

				SearchEco se = new SearchEco();
				se.setEcoBoardNo(like.getEcoBoardNo());
				int likeCount = 0;
				
				//좋아요 카운트 다운 -1
				sqlSession.update("searchEcoMapper.likedown",se);
				
				//좋아요 테이블에 등록
				int result = sqlSession.delete("searchEcoMapper.likeRemove",like);
				
				if(result == 1) {
					likeCount = sqlSession.selectOne("searchEcoMapper.likeCount",like.getEcoBoardNo());
				}

		return likeCount;
	}
	
	//좋아요 유지시키기
	public int selectLikeYn(SqlSessionTemplate sqlSession, SearchEco se) {
		
		return sqlSession.selectOne("searchEcoMapper.selectLikeYn", se);
	}

	//메인에서 브랜드 클릭시 관련 보드번호 가져오기
	public int getBoardNo(SqlSessionTemplate sqlSession, int brandNo) {
		return sqlSession.selectOne("searchEcoMapper.getBoardNo", brandNo);
	}
	
	


}
