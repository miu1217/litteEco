package com.kh.littleEco.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.member.model.vo.Member;

public interface AdminService {

	//admin 페이지 회원 리스트 조회
	ArrayList<Member> MemberList();

	//회원 update 시 상세 조회
	Member MemberDetail(int mno);

	//회원 update 시 기존에 선택한 카테고리 조회
	ArrayList<Category> MemberCategory(int mno);

	//member 업데이트 하는 메소드
	int updateMember(Member m);

	//update 시 memberCategory 삭제
	int deleteMemberCategory(Member m);

	//update 시 member_category에 insert
	int insertMemberCategory(Member m);

	//member 삭제하는 메소드 (status n으로 변경)
	int deleteMember(int mno);

	//brand 관련 insert 메소드
	int insertBrand(Brand b);

	//brand 선택한 카테고리 입력하는 메소드
	int insertBrandCategory(Brand b);

	//brand 입력 시 파일 업로드 하는 메소드
	int insertBrandAttachment(Attachment at);
	
	//brand List 조회 메소드
	ArrayList<Brand> brandList(PageInfo pi);

	//brand 상세 보기 메소드
	Brand selectBrand(int bno);

	//brand 상세 보기 시 사진 조회 메소드
	Attachment selectBrandAttachment(int bno);

	//brand 상세 보기 시 category 조회 메소드
	ArrayList<Category> BrandCategory(int bno);

	//brand update 시 수정하는 메소드
	int updateBrand(Brand b);

	//brand update 시 brand category 삭제 메소드
	int deleteBrandCategory(Brand b);
	
	//brand update 시 brand category 입력 메소드
	int insertNewBrandCategory(Brand b);

	//brand update 시 사진 수정 메소드
	int updateBrandAttachment(Attachment at);

	//brand delete 하는 메소드
	int deleteBrand(int bno);

	int brandListCount();

}
