package com.kh.littleEco.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.littleEco.admin.model.dao.AdminDao;
import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.member.model.vo.Member;

import oracle.security.o3logon.a;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	//admin 페이지 회원 리스트 조회
	@Override
	public ArrayList<Member> MemberList() {
		
		return adminDao.MemberList(sqlSession);
	}

	//회원 update 시 상세 조회
	@Override
	public Member MemberDetail(int mno) {
		
		return adminDao.MemberDetail(sqlSession, mno);
	}

	//회원 update 시 기존에 선택한 카테고리 조회
	@Override
	public ArrayList<Category> MemberCategory(int mno) {
		
		return adminDao.MemberCategory(sqlSession, mno);
	}

	//member 업데이트 하는 메소드
	@Override
	public int updateMember(Member m) {
		
		return adminDao.updateMember(sqlSession, m);
	}

	//update 시 memberCategory 삭제
	@Override
	public int deleteMemberCategory(Member m) {
		
		return adminDao.deleteMemberCategory(sqlSession, m);
	}

	//update 시 member_category에 insert
	@Override
	public int insertMemberCategory(Member m) {
		
		return adminDao.insertMemberCategory(sqlSession, m);
	}

	//member 삭제하는 메소드 (status n으로 변경)
	@Override
	public int deleteMember(int mno) {
		
		return adminDao.deleteMember(sqlSession, mno);
	}

	
	//brand 관련 insert 메소드
	@Override
	public int insertBrand(Brand b) {
		
		return adminDao.insertBrand(sqlSession, b);
	}

	//brand 선택한 카테고리 입력하는 메소드
	@Override
	public int insertBrandCategory(Brand b) {
		
		return adminDao.insertBrandCategory(sqlSession, b);
	}

	//brand 입력 시 파일 업로드 하는 메소드
	@Override
	public int insertBrandAttachment(Attachment at) {
		
		return adminDao.insertBrandAttachment(sqlSession, at);
	}

	//brand List 조회 메소드
	@Override
	public ArrayList<Brand> brandList(PageInfo pi) {
		
		return adminDao.brandList(sqlSession, pi);
	}

	//brand 상세 보기 메소드
	@Override
	public Brand selectBrand(int bno) {
		
		return adminDao.selectBrand(sqlSession, bno);
	}

	
	//brand 상세 보기 시 사진 조회 메소드
	@Override
	public Attachment selectBrandAttachment(int bno) {
		
		return adminDao.selectBrandAttachment(sqlSession, bno);
	}
	
	
	//brand 상세 보기 시 category 조회 메소드
	@Override
	public ArrayList<Category> BrandCategory(int bno) {
		
		return adminDao.BrandCategory(sqlSession, bno);
	}

	//brand update 시 수정하는 메소드
	@Override
	public int updateBrand(Brand b) {
		
		return adminDao.updateBrand(sqlSession, b);
	}
	
	//brand update 시 brand category 삭제 메소드
	@Override
	public int deleteBrandCategory(Brand b) {
		
		return adminDao.deleteBrandCategory(sqlSession, b);
	}

	@Override
	public int insertNewBrandCategory(Brand b) {
		
		return adminDao.insertNewBrandCategory(sqlSession, b);
	}

	@Override
	public int updateBrandAttachment(Attachment at) {
		
		return adminDao.updateBrandAttachment(sqlSession, at);
		
	}

	@Override
	public int deleteBrand(int bno) {
		// TODO Auto-generated method stub
		return adminDao.deleteBrand(sqlSession, bno);
	}


	@Override
	public int brandListCount() {
		
		

		int count = adminDao.brandListCount(sqlSession);
		return count;
	}

}
