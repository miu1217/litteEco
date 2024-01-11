package com.kh.littleEco.mypage.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.mypage.model.vo.InterestBoard;
import com.kh.littleEco.mypage.model.vo.MyPost;
import com.kh.littleEco.mypage.model.vo.Mypage;

@Repository
public class MypageDao {


	public ArrayList<Mypage> selectFolder(SqlSessionTemplate sqlSession, int memberNo) {

		return (ArrayList)sqlSession.selectList("mypageMapper.selectFolder", memberNo);
	}
	//폴더 추가
	public int addFolder(SqlSessionTemplate sqlSession, int memberNo, String folderName) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("folderName", folderName);
		map.put("memberNo", memberNo);
		
		return sqlSession.insert("mypageMapper.addFolder", map);
	}
	public int deleteFolder(SqlSessionTemplate sqlSession, int folderNo) {

		return sqlSession.delete("mypageMapper.deleteFolder",folderNo);
	}
	public int selectListCount(SqlSessionTemplate sqlSession,int memberNo) {

		
		return sqlSession.selectOne("mypageMapper.selectCount",memberNo);
	}
	public ArrayList<MyPost> selectBoardList(SqlSessionTemplate sqlSession, int memberNo,PageInfo pi) {

		//몇개씩 보여줄지
		int limit = pi.getBoardLimit();
		
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectBoardList",memberNo,rowBounds);
	}
	public int scrapBoard(SqlSessionTemplate sqlSession, int boardNo, int memberNo, int folderNo) {

		Map<String,Object> map = new HashMap<>();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		map.put("folderNo", folderNo);
		
		return sqlSession.insert("mypageMapper.scrapBoard",map);
	}
	public int selectScrapCount(SqlSessionTemplate sqlSession, int folderNo) {

		return sqlSession.selectOne("mypageMapper.selectScrapCount",folderNo);
	}
	public ArrayList<InterestBoard> selectScrapList(SqlSessionTemplate sqlSession, int folderNo, PageInfo pi) {
		//몇개씩 보여줄지
		int limit = pi.getBoardLimit();
		
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mypageMapper.selectScrapList",folderNo,rowBounds);
	}
	public int scrapChk(SqlSessionTemplate sqlSession, int memberNo, int boardNo) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", memberNo);
		map.put("boardNo", boardNo);
		
		return sqlSession.selectOne("mypageMapper.scrapChk",map);
	}
	public int updateFolder(SqlSessionTemplate sqlSession, Integer boardNo, Integer ecoBoardNo,Integer moizaNo, int folderNo) {
	    Map<String, Object> map = new HashMap<String, Object>();

	        map.put("boardNo", boardNo);
	        map.put("ecoBoardNo", ecoBoardNo);
	        map.put("moizaNo", moizaNo);
	    map.put("folderNo", folderNo);
	    return sqlSession.update("mypageMapper.updateFolder", map);
	}
	public ArrayList<Moiza> selectMoizaList(SqlSessionTemplate sqlSession, int mno) {

		return (ArrayList)sqlSession.selectList("moizaMapper.myMoizaList",mno);
	}
	
	//에코보드 스크랩용
	public int scrapEcoChk(SqlSessionTemplate sqlSession, int memberNo, int ecoBoardNo) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", memberNo);
		map.put("ecoBoardNo", ecoBoardNo);
		return sqlSession.selectOne("mypageMapper.scrapEcoChk",map);
	}
	public int scrapEcoBoard(SqlSessionTemplate sqlSession, int ecoBoardNo, int memberNo, int folderNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("ecoBoardNo", ecoBoardNo);
		map.put("memberNo", memberNo);
		map.put("folderNo", folderNo);
		return sqlSession.insert("mypageMapper.scrapEcoBoard",map);
	}
	
	
	
	//모이자
	public int scrapMoizaChk(SqlSessionTemplate sqlSession, int memberNo, int moizaNo) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("memberNo", memberNo);
		map.put("moizaNo", moizaNo);
		return sqlSession.selectOne("mypageMapper.scrapMoizaChk",map);
	}
	public int scrapMoizaBoard(SqlSessionTemplate sqlSession, int moizaNo, int memberNo, int folderNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("moizaNo", moizaNo);
		map.put("memberNo", memberNo);
		map.put("folderNo", folderNo);
		return sqlSession.insert("mypageMapper.scrapMoizaBoard",map);
	}

	

}
