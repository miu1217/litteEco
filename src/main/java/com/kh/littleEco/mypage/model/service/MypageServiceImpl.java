package com.kh.littleEco.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.mypage.model.dao.MypageDao;
import com.kh.littleEco.mypage.model.vo.InterestBoard;
import com.kh.littleEco.mypage.model.vo.MyPost;
import com.kh.littleEco.mypage.model.vo.Mypage;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	//폴더 조회
	@Override
	public ArrayList<Mypage> selectFolder(int memberNo) {

	    return mypageDao.selectFolder(sqlSession, memberNo);
	}

	//폴더 추가
	@Override
	public int addFolder(int memberNo,String folderName) {
		
		return mypageDao.addFolder(sqlSession,memberNo,folderName);
	}

	@Override
	public int deleteFolder(int folderNo) {
		return mypageDao.deleteFolder(sqlSession,folderNo);
	}

	@Override
	public int selectListCount(int memberNo) {

		return mypageDao.selectListCount(sqlSession,memberNo);
	}

	@Override
	public ArrayList<MyPost> selectBoardList(int memberNo,PageInfo pi) {
		// TODO Auto-generated method stub
		return mypageDao.selectBoardList(sqlSession,memberNo,pi);
	}

	@Override
	public int scrapBoard(int boardNo, int memberNo, int folderNo) {
		return mypageDao.scrapBoard(sqlSession,boardNo,memberNo,folderNo);
	}

	@Override
	public int selectScrapCount(int folderNo) {
		// TODO Auto-generated method stub
		return mypageDao.selectScrapCount(sqlSession,folderNo);
	}

	@Override
	public ArrayList<InterestBoard> selectScrapList(int folderNo, PageInfo pi) {
		// TODO Auto-generated method stub
		return mypageDao.selectScrapList(sqlSession,folderNo,pi);
	}
	
	
	//스크랩 중복방지
	@Override
	public int scrapChk(int memberNo, int boardNo) {

		return mypageDao.scrapChk(sqlSession,memberNo,boardNo);
	}

	@Override
	public int deleteMypost(int memberNo) {

		return 0;
	}

	@Override
	public int updateFolder(Integer boardNo,Integer ecoBoardNo,Integer moizaNo, int folderNo) {
		// TODO Auto-generated method stub
		return mypageDao.updateFolder(sqlSession, boardNo, ecoBoardNo,moizaNo, folderNo);
	}

	@Override
	public ArrayList<Moiza> selectMoizaList(int mno) {

		return mypageDao.selectMoizaList(sqlSession,mno);
	}

	@Override
	public int scrapEcoChk(int memberNo, int ecoBoardNo) {
		// TODO Auto-generated method stub
		return mypageDao.scrapEcoChk(sqlSession,memberNo,ecoBoardNo);
	}

	@Override
	public int scrapEcoBoard(int ecoBoardNo, int memberNo, int folderNo) {
		// TODO Auto-generated method stub
		return mypageDao.scrapEcoBoard(sqlSession,ecoBoardNo,memberNo,folderNo);
	}
	
	
	//모이자 스크랩
	@Override
	public int scrapMoizaChk(int memberNo, int moizaNo) {
		// TODO Auto-generated method stub
		return mypageDao.scrapMoizaChk(sqlSession,memberNo,moizaNo);
	}

	@Override
	public int scrapMoizaBoard(int moizaNo, int memberNo, int folderNo) {
		// TODO Auto-generated method stub
		return mypageDao.scrapMoizaBoard(sqlSession,moizaNo,memberNo,folderNo);
	}



	

}
