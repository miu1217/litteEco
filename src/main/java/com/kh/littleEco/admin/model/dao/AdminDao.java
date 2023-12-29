package com.kh.littleEco.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

@Repository
public class AdminDao {

	//admin 페이지 회원 리스트 조회
	public ArrayList<Member> MemberList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.MemberList");
	}

	//회원 update 시 상세 조회
	public Member MemberDetail(SqlSession sqlSession, int mno) {
		
		return sqlSession.selectOne("adminMapper.MemberDetail", mno);
	}

	//회원 update 시 기존에 선택한 카테고리 조회
	public ArrayList<Category> MemberCategory(SqlSession sqlSession, int mno) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.MemberCategory", mno);
	}

	//member 업데이트 하는 메소드
	public int updateMember(SqlSession sqlSession, Member m) {
	
		return sqlSession.update("adminMapper.updateMember", m);
	}

	//update 시 memberCategory 삭제
	public int deleteMemberCategory(SqlSession sqlSession, Member m) {
		
		return sqlSession.delete("adminMapper.deleteMemberCategory", m);
	}

	
	//update 시 member_category에 insert
	public int insertMemberCategory(SqlSession sqlSession, Member m) {
		
		return sqlSession.insert("adminMapper.insertMemberCategory", m);
	}

	//member 삭제하는 메소드 (status n으로 변경)
	public int deleteMember(SqlSession sqlSession, int mno) {
		
		return sqlSession.update("adminMapper.deleteMember", mno);
	}

	//brand 관련 insert 메소드
	public int insertBrand(SqlSession sqlSession, Brand b) {
	
		return sqlSession.insert("adminMapper.insertBrand",b);
	}

	//brand 선택한 카테고리 입력하는 메소드
	public int insertBrandCategory(SqlSession sqlSession, Brand b) {
		
		return sqlSession.insert("adminMapper.insertBrandCategory", b);
	}

	//brand 입력 시 파일 업로드 하는 메소드
	public int insertBrandAttachment(SqlSession sqlSession, Attachment at) {
		
		return sqlSession.insert("adminMapper.insertBrandAttachment", at);
	}

	//brand List 조회 메소드
	public ArrayList<Brand> brandList(SqlSession sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.brandList");
	}

	//brand 상세 보기 메소드
	public Brand selectBrand(SqlSession sqlSession, int bno) {
		
		return sqlSession.selectOne("adminMapper.selectBrand", bno);
				
	}

	//brand 상세 보기 시 사진 조회 메소드
	public Attachment selectBrandAttachment(SqlSession sqlSession, int bno) {
		
		return sqlSession.selectOne("adminMapper.selectBrandAttachment", bno);
	}

	//brand 상세 보기 시 category 조회 메소드
	public ArrayList<Category> BrandCategory(SqlSession sqlSession, int bno) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.BrandCategory", bno);
	}

	//brand update 시 수정하는 메소드
	public int updateBrand(SqlSession sqlSession, Brand b) {
		
		return sqlSession.update("adminMapper.updateBrand", b);
	}

	//brand update 시 brand category 삭제 메소드
	public int deleteBrandCategory(SqlSession sqlSession, Brand b) {
		
		return sqlSession.delete("adminMapper.deleteBrandCategory", b);
	}

	public int insertNewBrandCategory(SqlSession sqlSession, Brand b) {
		
		return sqlSession.insert("adminMapper.insertNewBrandCategory", b);
	}

	public int updateBrandAttachment(SqlSession sqlSession, Attachment at) {
		
		return sqlSession.update("adminMapper.updateBrandAttachment", at);
	}

	public int deleteBrand(SqlSession sqlSession, int bno) {
		
		return sqlSession.update("adminMapper.deleteBrand", bno);
	}

}
