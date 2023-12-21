package com.kh.littleEco.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.littleEco.member.model.service.MemberService;
import com.kh.littleEco.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	

	@RequestMapping("insert.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	//마이페이지로 이동
	@RequestMapping("mypage.me")
	public String mypageForm() {
		return "member/mypage";
	}
	
	//회원정보 수정 메소드
	@RequestMapping("update.me")
	public ModelAndView updateMember(Member m,HttpSession session,ModelAndView mv){
		
	
		
			
		
		int result = memberService.updateMember(m);
		
		if(result>0) {
			Member loginUser = memberService.loginMember(m);  //기존 회원정보 조회 메소드 불러오기
			session.setAttribute("loginUser", loginUser); // 세션에 갱신
			session.setAttribute("alertMsg", "변경 성공");
			mv.setViewName("redirect:mypage.me");
			
		}else {
			session.setAttribute("alertMsg", "변경 실패");
			mv.setViewName("redirect:mypage.me");
		}
		
		return mv;
	}
	
	
	@GetMapping("enrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	
	//회원가입 메소드
	@PostMapping("insert.me")
	public String insertMember(HttpSession session
							  ,Model model) {
		
		int result = memberService.insertMember();
		
		System.out.println(result);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입 성공");
			return "redirect:/";
		}else {
			model.addAttribute("alertMsg","회원가입 실패");
			return "redirect:/";
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
		
		if(loginUser != null) {
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인 성공");
			mv.setViewName("redirect:/");
		}else {
			
			session.setAttribute("alertMsg", "로그인 실패");
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
	
	
	
	//비밀번호 변경 메소드
	@RequestMapping("updatePwd.me")
	public ModelAndView updatePassword(Member m, HttpSession session, ModelAndView mv,
	    @RequestParam(value="memberPwd") String memberPwd,
	    @RequestParam(value="newPwd") String newPwd,
	    @RequestParam(value="checkPwd") String checkPwd) {

	    // 현재 로그인된 사용자 정보 가져오기
	    Member loginUser = (Member)session.getAttribute("loginUser");

	    // 입력한 기존 비밀번호가 실제 회원의 비밀번호와 일치하는지 확인
	    if (memberPwd.equals(loginUser.getMemberPwd())) {
	        // 새 비밀번호와 새 비밀번호 확인이 일치하는지 확인
	        if (newPwd.equals(checkPwd)) {
	            // 새 비밀번호를 회원 정보에 설정
	            loginUser.setMemberPwd(newPwd);

	            int result = memberService.updateMember2(loginUser);

	            if (result > 0) {
	                
	                session.setAttribute("loginUser", loginUser);
	                session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
	                mv.setViewName("redirect:mypage.me");
	            } else {
	                session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
	                mv.setViewName("redirect:mypage.me");
	            } 
	        } 
	    } 

	    return mv;
	}


}
