package com.kh.littleEco.recycleboard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.recycleboard.model.vo.boardAttachment;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;

public interface recycleBoardService {

	//게시글 개수
	int selectRecycleListCount();
	
	//게시글 목록
	ArrayList<recycleBoard> selectRecycleList(PageInfo pi);
	//조회수 증가
	int increaseCount(int rbno);

	//상세조회
	recycleBoard recycleBoardDetail(int rbno);

	int getNextRecycleNo();

	//게시글 등록 
	int recycleInsert(recycleBoard rb);
	int insertAttachment(boardAttachment bat);

	//게시글삭제 
	int recycleDelete(int rbno);
	//게시글 첨부파일 삭제
	int deleteAttachment(boardAttachment bat);
	//게시글 수정
	int updateRecycle(recycleBoard rb);
	//게시글 첨부파일수정
	int updateRecycleAttach(boardAttachment bat);

	//보드첨부파일 번호 채번
	int getNextBoardAttachNo();

	//인기게시글
	ArrayList<recycleBoard> selectBestBoard();

	
//
//	int insertAttach(ArrayList<boardAttachment> bList);


	

}
