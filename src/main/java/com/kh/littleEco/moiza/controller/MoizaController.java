package com.kh.littleEco.moiza.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.moiza.model.service.MoizaService;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.moiza.model.vo.MoizaCategory;
import com.kh.littleEco.moiza.model.vo.MoizaMember;

@Controller
public class MoizaController {

	@Autowired
	private MoizaService moizaService;
	

	
	@GetMapping("moiza")
	public String Moiza() {
		
		
		return "moiza/moizaList";
	}
	
	//모집 게시판 리스트 메소드 
	@ResponseBody
	@RequestMapping(value="moizaList",  produces="application/json; charset=UTF-8")
	public ArrayList<Moiza> MoizaList(int page) {
		
		ArrayList<Moiza> mzList = moizaService.selectMoizaList();
		

		int moizaPage = 2;
		
		int startIndex = (page - 1) * moizaPage + 1;
		return mzList;
	}
	
	@GetMapping("moiza.in")
	public String MoizaInsert() {
		
		
		return "moiza/moizaInsert";
	}
	
	@PostMapping("moiza.in")
	public String MoizaInsert(Moiza moiza,HttpSession session) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		
		//moiza 관련 insert 메소드
		int moizaResult = moizaService.insertMoiza(moiza);
		
		int creatorResult = 0;
		
		int categoryResult = 0;
		if(moizaResult > 0) {
			
			creatorResult = moizaService.insertMoizaCreator(memberNo);
			
			categoryResult = moizaService.insertMoizaCategory(moiza);
		}
		
		int result = creatorResult * categoryResult;
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "moiza 성공");
			return "redirect:moiza";
		}else {
			
			session.setAttribute("alertMsg", "moiza 실패");
			return "redirect:moiza";
		}
		
		
	}
	
	
	@GetMapping("moiza.de")
	public String MoizaDetail(int mno,
								Model model) {
		
		Moiza m = moizaService.selectMoizaDetail(mno);
		
		ArrayList<MoizaCategory> cList = moizaService.selectMoizaCategory(mno);
		
		MoizaMember mMember = moizaService.selectMoizaCreator(mno);
		
		model.addAttribute("m",m);
		model.addAttribute("cList",cList);
		model.addAttribute("mMember",mMember);
		
		return "moiza/moizaDetail";
	}
	
	
	@GetMapping("moiza.up")
	public String MoizaUpdate(int mno
								,Model model) {
		
		Moiza m = moizaService.selectMoizaDetail(mno);
		
		ArrayList<MoizaCategory> cList = moizaService.selectMoizaCategory(mno);
		
		MoizaMember mMember = moizaService.selectMoizaCreator(mno);
		model.addAttribute("m",m);
		model.addAttribute("cList",cList);
		model.addAttribute("mMember",mMember);
		
		return "moiza/moizaUpdate";
	}
	
	@PostMapping("moiza.up")
	public String MoizaUpdate(Moiza moiza
								,Model model
								,HttpSession session) {
		
		int moizaUpdate = moizaService.updateMoiza(moiza);
		
		int deleteCategory = moizaService.deleteMoizaCategory(moiza);
		
		
		int insertCategory  = 0;
		if(deleteCategory > 0) {
			
			insertCategory = moizaService.insertNewMoizaCategory(moiza);
		}
		
		
		int result = moizaUpdate * deleteCategory * insertCategory;
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:moiza";
			
		}else {
			
			session.setAttribute("alertMsg", "게시글 수정 실패");
			return "redirect:moiza";
			
		}
	}
	
	//모집게시판 삭제
	@GetMapping("moiza.d")
	public String MoizaDelete(int mno
								,HttpSession session) {
		
		int deleteResult = moizaService.deleteMoiza(mno);
		
		
		if(deleteResult > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:moiza";
		}else {
			session.setAttribute("alertMsg", "게시글 삭제 실패");
			return "redirect:moiza";
		}
		
		
	}
	
	
	//-------------모집 게시판 신청 및 회원 관리 메소드-----------------------
	//모집 신청하기 버튼 클릭 시 신청되는 메소드
	@GetMapping("moiza.ap")
	public String MoizaApply(int mno
				,HttpSession session) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		MoizaMember m = new MoizaMember();
		
		m.setMemberNo(memberNo);
		m.setMoizaNo(mno);
		
		
		int result = moizaService.insertMoizaMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "모집 신청 성공");
			return "redirect:moiza";
		}else {
			session.setAttribute("alertMsg", "모집 신청 실패");
			return "redirect:moiza";
		}
		
	}
	
	
	//모집 단체 회원 관리 메인페이지
	@GetMapping("moiza.m")
	public String MoizaMember(int mno
						,HttpSession session) {
		
		session.setAttribute("mno", mno);
		
		return "moiza/moizaMember";
	}
	
	//모집 단체 회원 리스트
	@ResponseBody
	@RequestMapping(value="moizaMemberList",  produces="application/json; charset=UTF-8")
	public ArrayList<Member> MoizaMemberList(int mno) {
		
		ArrayList<Member> mList = moizaService.selectMoizaMember(mno);
		
		
		return mList;
	}
	
	
	//모집 단체 요청 리스트
	@ResponseBody
	@RequestMapping(value="moizaApplyList",  produces="application/json; charset=UTF-8")
	public ArrayList<Member> MoizaApplyList(int mno) {
			
			ArrayList<Member> mList = moizaService.selectMoizaApplyMember(mno);
			
			
			return mList;
	}
	
	//모집 단체 요청 리스트
	@ResponseBody
	@RequestMapping(value="moizaHoldList",  produces="application/json; charset=UTF-8")
	public ArrayList<Member> MoizaHoldList(int mno){
				
				ArrayList<Member> mList = moizaService.selectMoizaHoldMember(mno);
				
				
				return mList;
		}
	
	
	//신청자 보류하는 메소드
	@RequestMapping("memberHold")
	public String MemberApplyHold(int memberNo
						,int moizaNo
						,HttpSession session) {
		
		MoizaMember m = new MoizaMember();
		
		m.setMoizaNo(moizaNo);
		m.setMemberNo(memberNo);
		
		int result = moizaService.holdMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "회원 보류 성공");

			return "redirect:moiza.m?mno="+moizaNo;
		}else {
			session.setAttribute("alertMsg", "회원 보류 실패");

			return "redirect:moiza.m?mno="+moizaNo;
		}
		
		
	}
	
	
	//신청자 거절하는 메소드
	@RequestMapping("memberApplyDelete")
	public String MemberApplyDelete(int memberNo
							,int moizaNo
							,HttpSession session) {
			
		
			MoizaMember m = new MoizaMember();
			
			m.setMoizaNo(moizaNo);
			m.setMemberNo(memberNo);
			int result = moizaService.deleteApplyMember(m);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "회원 거절 성공");

				return "redirect:moiza.m?mno="+moizaNo;
			}else {
				session.setAttribute("alertMsg", "회원 거절 실패");

				return "redirect:moiza.m?mno="+moizaNo;
			}
			
			
		}

	//신청자 수락 메소드
	@RequestMapping("memberApplyAccept")
	public String MemberApplyAccept(int memberNo
							,int moizaNo
							,HttpSession session) {
			
		
			MoizaMember m = new MoizaMember();
			
			m.setMoizaNo(moizaNo);
			m.setMemberNo(memberNo);
			int result = moizaService.acceptApplyMember(m);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "회원 수락 성공");

				return "redirect:moiza.m?mno="+moizaNo;
			}else {
				session.setAttribute("alertMsg", "회원 수락 실패");

				return "redirect:moiza.m?mno="+moizaNo;
			}
			
			
		}

	//신청자 수락 메소드
		@RequestMapping("memberDelete")
		public String MemberDelete(int memberNo
								,int moizaNo
								,HttpSession session) {
				
			
				MoizaMember m = new MoizaMember();
				
				m.setMoizaNo(moizaNo);
				m.setMemberNo(memberNo);
				int result = moizaService.deleteMember(m);
				
				if(result > 0) {
					session.setAttribute("alertMsg", "회원 내보내기 성공");

					return "redirect:moiza.m?mno="+moizaNo;
				}else {
					session.setAttribute("alertMsg", "회원 내보내기 실패");

					return "redirect:moiza.m?mno="+moizaNo;
				}
				
				
			}
		

		
}
