package com.kh.littleEco.brand.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.brand.model.vo.Attachment;

@Repository
public class BrandDao {

	//브랜드 사진(attachment) 리스트 가져오기(메인화면으로)
	public ArrayList<Attachment> selectBrandList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("brandMapper.selectBrandList");
	}

}
