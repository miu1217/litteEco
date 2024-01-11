package com.kh.littleEco.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.board.model.vo.BoardAttachment;
import com.kh.littleEco.board.model.vo.Notice;
import com.kh.littleEco.common.model.vo.PageInfo;
@Repository
public class BoardDao {

	//공지사항 글 카운트
	public int noticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.noticeListCount");
	}

	//공지사항 조회
	public ArrayList<Notice> noticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		//몇개씩 보여줄것인지
		int limit = pi.getBoardLimit();
		
		//몇개 건너뛸건지
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeList", pi, rowBounds);
	}

	//공지사항 조회수 증가
	public int increaseCountNotice(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("noticeMapper.increaseCountNotice", bno);
	}

	//공지사항 상세보기
	public Notice noticeDetail(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("noticeMapper.noticeDetail", bno);
	}
	
	//공지사항 글쓰기
	public int noticeInsert(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.noticeInsert", n);
	}
	

	//공지사항 업데이트
	public int noticeUpdateForm(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.noticeUpdateForm", n);
	}
	
	//공지사항 첨부파일 update
	public int updateAttachment(SqlSessionTemplate sqlSession, BoardAttachment bat) {
		return sqlSession.update("noticeMapper.updateAttachment", bat);
	}
	
	//공지사항 첨부파일 insert
	public int insertAttachment(SqlSessionTemplate sqlSession, BoardAttachment bat) {
		return sqlSession.insert("noticeMapper.insertAttachment", bat);
	}
	
	//삭제
	public int noticeDelete(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.delete("noticeMapper.noticeDelete", bno);
	}
	
	//신규 글쓰기 할 떄 시퀀스로부터 nextval 가져오기 
	public int getNextNoticeNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getNextNoticeNo");
	}
	
	//공지사항 첨부파일 delete
	public int deleteAttachment(SqlSessionTemplate sqlSession, BoardAttachment bat) {
		return sqlSession.update("noticeMapper.deleteAttachment", bat);
	}





}
