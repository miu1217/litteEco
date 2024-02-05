package com.kh.littleEco.brand.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.brand.model.dao.BrandDao;
import com.kh.littleEco.brand.model.vo.Attachment;

@Service
public class BrandServiceImp implements BrandService {
	
	@Autowired
	private BrandDao brandDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	//브랜드 사진(attachment) 리스트 가져오기(메인화면으로)
	@Override
	public ArrayList<Attachment> selectBrandList() {
		return brandDao.selectBrandList(sqlSession);
	}

}
