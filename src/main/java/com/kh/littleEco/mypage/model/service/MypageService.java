package com.kh.littleEco.mypage.model.service;

import java.util.ArrayList;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.mypage.model.vo.InterestBoard;
import com.kh.littleEco.mypage.model.vo.MyPost;
import com.kh.littleEco.mypage.model.vo.Mypage;
import com.kh.littleEco.searchEco.model.vo.SearchEco;


public interface MypageService {
	
	//폴더 추가
	int addFolder(int memberNo ,String folderName);
	
	//폴더 조회
	ArrayList<Mypage> selectFolder(int memberNo);
	
	//폴더 삭제
	int deleteFolder(int folderNo);
	
	//내가 쓴글 개수
	int selectListCount(int memberNo);
	
	//내가 쓴글
	ArrayList<MyPost> selectBoardList(int memberNo,PageInfo pi);
	
	//스크랩한 게시물 조회
	int scrapBoard(int boardNo, int memberNo, int folderNo);
	
	//스크랩 게시물 총 개수
	int selectScrapCount(int folderNo);
	
	//스크랩 된 게시물 조회
	ArrayList<InterestBoard> selectScrapList(int folderNo, PageInfo pi);

	//스크랩 중복 체크
	int scrapChk(int memberNo, int boardNo);
	
	//내가 쓴 글 삭제
	int deleteMypost(int memberNo);

	//폴더 이동
	int updateFolder(Integer boardNo,Integer ecoBoardNo,Integer moizaNo, int folderNo);
	
	//참여중인 모이자
	ArrayList<Moiza> selectMoizaList(int mno);

	int scrapEcoChk(int memberNo, int ecoBoardNo);

	int scrapEcoBoard(int ecoBoardNo, int memberNo, int folderNo);
	
	
	//모이자 스크랩
	int scrapMoizaChk(int memberNo, int moizaNo);

	int scrapMoizaBoard(int moizaNo, int memberNo, int folderNo);
	
	
	//좋아요 게시글 조회
	ArrayList<SearchEco> selectLikeList(int memberNo);

	


	
	


}
