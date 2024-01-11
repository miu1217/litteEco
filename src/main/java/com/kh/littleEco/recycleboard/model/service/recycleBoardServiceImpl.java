package com.kh.littleEco.recycleboard.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.recycleboard.model.dao.recycleBoardDao;
import com.kh.littleEco.recycleboard.model.vo.boardAttachment;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class recycleBoardServiceImpl implements recycleBoardService {
	
	@Autowired
	private recycleBoardDao rboardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectRecycleListCount() {
		// TODO Auto-generated method stub
		return rboardDao.selectRecycleListCount(sqlSession);
	}

	@Override
	public ArrayList<recycleBoard> selectRecycleList(PageInfo pi) {
		return rboardDao.selectRecycleList(sqlSession,pi);
	}

	@Override
	public int increaseCount(int rbno) {
		return rboardDao.increaseCount(sqlSession,rbno);
	}

	//게시글 상세보기
	@Override
	public recycleBoard recycleBoardDetail(int rbno) {
		return rboardDao.recycleBoardDetail(sqlSession,rbno);
	}

	@Override
	public int getNextRecycleNo() {
		// TODO Auto-generated method stub
		return rboardDao.getNextRecycleNo(sqlSession);
	}


	
	//게시글 삭제
	@Override
	public int recycleDelete(int rbno) {
		// TODO Auto-generated method stub
		return rboardDao.recycleDelete(sqlSession,rbno);
	}

	@Override
	public int deleteAttachment(boardAttachment bat) {
		// TODO Auto-generated method stub
		return rboardDao.deleteAttachment(sqlSession,bat);
	}

	
	//게시글 수정 
	@Override
	public int updateRecycle(recycleBoard rb) {
		// TODO Auto-generated method stub
		return rboardDao.updateRecycle(sqlSession,rb);
	}

	@Override
	public int updateRecycleAttach(boardAttachment bat) {
		// TODO Auto-generated method stub
		return rboardDao.updateRecycleAttach(sqlSession,bat);
	}

	//게시글 등록
	@Override
	public int recycleInsert(recycleBoard rb) {
		// TODO Auto-generated method stub
		return rboardDao.insertRecycle(sqlSession,rb);
	}

	@Override
	public int insertAttachment(boardAttachment bat) {
		// TODO Auto-generated method stub
		return rboardDao.insertAttachment(sqlSession,bat);
	}

	//보드 어태치먼트 시퀀스 채번
	@Override
	public int getNextBoardAttachNo() {
		return rboardDao.getNextBoardAttachNo(sqlSession);
	}

	//인기게시글
		@Override
		public ArrayList<recycleBoard> selectBestBoard() {
			return rboardDao.selectBestBoard(sqlSession);
		}
	
}
