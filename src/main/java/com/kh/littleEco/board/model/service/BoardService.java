package com.kh.littleEco.board.model.service;

import java.util.ArrayList;

import com.kh.littleEco.board.model.vo.BoardAttachment;
import com.kh.littleEco.board.model.vo.Notice;
import com.kh.littleEco.common.model.vo.PageInfo;

public interface BoardService {

	//notice 페이지내이션 카운트
	int noticeListCount();

	//notice 리스트 조회
	ArrayList<Notice> noticeList(PageInfo pi);

	//notice 조회수 증가
	int increaseCountNotice(int bno);

	//notice 상세보기
	Notice noticeDetail(int bno);

	//notice 글쓰기
	int noticeInsert(Notice n);
	
	int getNextNoticeNo();
	
	//notice 수정하기
	//int noticeUpdateForm(Notice n, BoardAttachment bat);

	//notice 삭제하기
	int noticeDelete(int bno);

	//notice 업데이트
	//int updateNotice(Notice n, BoardAttachment bat);

	int updateAttachment(BoardAttachment bat);

	int insertAttachment(BoardAttachment bat);

	int noticeUpdateForm(Notice n, BoardAttachment bat);

	int deleteAttachment(BoardAttachment bat);



}
