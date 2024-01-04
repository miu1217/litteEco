package com.kh.littleEco.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.littleEco.member.model.service.MemberService;
import com.kh.littleEco.member.model.vo.MemberCategory;
import com.kh.littleEco.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService; //서비스
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; //암호화
	
	//회원가입 
	//페이지로 넘겨주기
	@GetMapping("enrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	//회원가입 메소드
	@PostMapping("insert.me")
	@ResponseBody
	public ModelAndView insertMember(Member m
							  ,HttpSession session
							  ,Model model
							  ,ModelAndView mv
							  ) { //,@RequestParam(value="cArr[]")String[] cArr
			
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());	
		m.setMemberPwd(encPwd); //암호화시킨 비밀번호 세팅
		
		//회원가입
		int result = memberService.insertMember(m);
	
		if(result>0) {
			//@ResponseBody로 인해 리턴값이 데이터 그대로 넘어가기때문에 modelAndView로 설정후 리턴해주기
			mv.setViewName("member/enrollCompletedForm");
			return mv;
		}else {
			model.addAttribute("alertMsg","회원가입 실패");
			mv.setViewName("member/enrollCompletedForm");
			return mv;
		}
		
	}
	
	//로그인
	//페이지로 넘겨주기
	@GetMapping("loginForm.me")
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	//로그인 메소드
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m
								   ,ModelAndView mv
								   ,HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		Member m2 = new Member();
		
		
		
		
		System.out.println(loginUser);
		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getMemberPwd(),
															loginUser.getMemberPwd())) {
			//로그인유저 세션보내기
			session.setAttribute("loginUser", loginUser);
			
			//카테고리 목록
			
			mv.setViewName("redirect:/");
			
		}else {
			session.setAttribute("alertMsg", "알 수 없는 회원입니다");
			mv.setViewName("redirect:/");
			
		}
		
		return mv;
	}
	
	//로그아웃 메소드
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	//회원찾기 메소드
	@GetMapping("findMemberForm.me")
	public String findMemberForm() {
		return "member/findMemberForm";
	}
	
	@PostMapping("findMemberId.me")
	public String findId() {
		
		
		return "";
	}
	
	
	
	
	
	
	
}//
