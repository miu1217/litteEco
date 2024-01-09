package com.kh.littleEco.admin.controller;


import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.littleEco.admin.model.service.AdminService;
import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

import oracle.jdbc.logging.annotations.DefaultLogger;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminService adminService;
	
	//
	@GetMapping("admin")
	public String Admin() {
		
		return "admin/adminMain";
			
	}
	
	@ResponseBody
	@RequestMapping(value="memberList.ad",  produces="application/json; charset=UTF-8")
	public ArrayList<Member> MemberList() {
		
		ArrayList<Member> mList = adminService.MemberList();
		
		
		return mList;
	}
	
	//업데이트 시 member_category 테이블 안에 있는 걸 지우고 다시 입력하는 형식으로 하기
	//sql 문 한번에 하지 않고 member vo에 ArrayList<category>로 필드 만들기
	// select 할 때는 arrayList로 가져오고 insert 할 때는 String[] categoryNo로 넘겨서 insert문 반복 돌리기
	//mapper에서는 collection 사용해서 category 관련해서 들고오기
	//프론트에서 split으로 쪼개서 checkbox 로 체크 해주기
	
	@GetMapping("memberUpdate.ad")
	public String MemberDetail(int mno,
								Model model) {
		
		Member m = adminService.MemberDetail(mno);
		
		ArrayList<Category> cList = adminService.MemberCategory(mno);
		
		model.addAttribute("m", m);
		model.addAttribute("cList", cList);
		return "admin/adminMemberDetail";
	}
	
	//member 업데이트 하는 메소드
	@PostMapping("memberUpdate.ad")
	public String updateMember(Member m, HttpSession session) {
		
		//member 업데이트 하는 메소드
		int memberResult = adminService.updateMember(m);
		
		//update 시 memberCategory 삭제
		int deleteResult = adminService.deleteMemberCategory(m);
		
		int insertResult =0;
		if(deleteResult > 0) {
			// update 시 member_category 에서 delete 로 삭제하고 insert를 다시해서 수정하는 방법으로 하기
			insertResult = adminService.insertMemberCategory(m);
			
		}
		
		if(memberResult * insertResult > 0) {
			
			session.setAttribute("alertMsg", "회원 수정 성공");
			return "redirect:admin";
		}else {
			session.setAttribute("alertMsg", "회원 수정 실패");
			return "redirect:admin";
		}
	
	}
	
	//member 삭제하는 메소드 (status n으로 변경)
	@RequestMapping("memberDelete.ad")
	public String deleteMember(int mno, HttpSession session) {
		
		int result = adminService.deleteMember(mno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원 삭제 성공");
			return "redirect:admin";
		}else {
			session.setAttribute("alertMsg", "회원 삭제 실패");
			return "redirect:admin";
		}
	}
	
}
