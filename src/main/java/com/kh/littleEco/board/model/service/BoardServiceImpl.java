package com.kh.littleEco.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.board.model.dao.BoardDao;
import com.kh.littleEco.board.model.vo.BoardAttachment;
import com.kh.littleEco.board.model.vo.Notice;
import com.kh.littleEco.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//공지사항 글 수
	@Override
	public int noticeListCount() {
		
		return boardDao.noticeListCount(sqlSession);
	}

	//공지사항 리스트 조회
	@Override
	public ArrayList<Notice> noticeList(PageInfo pi) {
		
		return boardDao.noticeList(sqlSession, pi);
	}

	//공지사항 조회수 증가
	@Override
	public int increaseCountNotice(int bno) {
		return boardDao.increaseCountNotice(sqlSession, bno);
	}

	//공지사항 상세보기
	@Override
	public Notice noticeDetail(int bno) {
		return boardDao.noticeDetail(sqlSession, bno);
	}
	
	//공지사항 글쓰기
	@Override
	public int noticeInsert(Notice n) {
		return boardDao.noticeInsert(sqlSession, n);
	}
	

	@Override
	public int noticeDelete(int bno) {
		return boardDao.noticeDelete(sqlSession, bno);
	}
	
	@Override
	public int getNextNoticeNo() {
		return boardDao.getNextNoticeNo(sqlSession);
	}
	//공지사항 업데이트
//	@Override
//	public int noticeUpdateForm(Notice n, BoardAttachment bat) {
//		
//		int result = boardDao.noticeUpdateForm(sqlSession, n);
//		
//		int result2 = 1;
//		
//		
//		System.out.println("파일번호" + bat.getBoFileNo());
//		
//		
//		if(bat.getBoFileNo() != 0) {
//			result2 = boardDao.updateAttachment(sqlSession, bat);
//		} else {
//			
//			System.out.println("파일 없으면 이거 타요");
//			result2 = boardDao.insertAttachment(sqlSession, bat);
//		}
//		
//		return result * result2;
//	}
	


	@Override
	public int updateAttachment(BoardAttachment bat) {
		// TODO Auto-generated method stub
		return boardDao.updateAttachment(sqlSession, bat);
	}

	@Override
	public int insertAttachment(BoardAttachment bat) {
		// TODO Auto-generated method stub
		return boardDao.insertAttachment(sqlSession, bat);
	}

	@Override
	public int noticeUpdateForm(Notice n, BoardAttachment bat) {
		return boardDao.noticeUpdateForm(sqlSession, n);
	}
	
	@Override
	public int deleteAttachment(BoardAttachment bat) {
		return boardDao.deleteAttachment(sqlSession, bat);
	}



}
