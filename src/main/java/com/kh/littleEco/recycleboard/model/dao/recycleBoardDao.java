package com.kh.littleEco.recycleboard.model.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.recycleboard.model.vo.boardAttachment;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;

@Repository
public class recycleBoardDao {

	public int selectRecycleListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recycleBoardMapper.selectRecycleListCount");
	}

	public ArrayList<recycleBoard> selectRecycleList(SqlSessionTemplate sqlSession, PageInfo pi) {
		//몇개씩 보여줄지
		int limit = pi.getBoardLimit();
		//몇개 건너띌까 
		int offset = (pi.getCurrentPage()-1) * limit;
		
		//rowbounds 객체를 전달해야하는데 전달 할 파라미터 (전달값)이 없다면 null을 넣어서 메소드 호출하기
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("recycleBoardMapper.selectRecycleList",null,rowBounds);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int rbno) {
		return sqlSession.update("recycleBoardMapper.increaseCount",rbno);
	}

	public recycleBoard recycleBoardDetail(SqlSessionTemplate sqlSession, int rbno) {
		return sqlSession.selectOne("recycleBoardMapper.recycleDetail",rbno);
	}


	public int getNextRecycleNo(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("recycleBoardMapper.getNextRecycleNo");
	}

	public int recycleDelete(SqlSessionTemplate sqlSession, int rbno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recycleBoardMapper.recycleDelete",rbno);
	}


	public int deleteAttachment(SqlSessionTemplate sqlSession, boardAttachment bat) {
		// TODO Auto-generated method stub
		return sqlSession.delete("recycleBoardMapper.deleteAttachment", bat);
	}

	public int updateRecycle(SqlSessionTemplate sqlSession, recycleBoard rb) {
		// TODO Auto-generated method stub
		return sqlSession.update("recycleBoardMapper.updateRecycle",rb);
	}

	public int updateRecycleAttach(SqlSessionTemplate sqlSession, boardAttachment bat) {
		// TODO Auto-generated method stub
		return sqlSession.update("recycleBoardMapper.updateRecycleAttach", bat);
	}

	public int insertRecycle(SqlSessionTemplate sqlSession, recycleBoard rb) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recycleBoardMapper.insertRecycle", rb);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, boardAttachment bat) {
		// TODO Auto-generated method stub
		return sqlSession.insert("recycleBoardMapper.insertAttachment",bat);
	}

	public int getNextBoardAttachNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recycleBoardMapper.getNextBoardAttachNo");
	}


}
