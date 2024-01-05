package com.kh.littleEco.member.controller;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
	public ModelAndView insertMember(Member m
							  ,Model model
							  ,ModelAndView mv
							  ) { //,@RequestParam(value="cArr[]")String[] cArr
			
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());	
		m.setMemberPwd(encPwd); //암호화시킨 비밀번호 세팅
		
		//회원가입
		int result = memberService.insertMember(m);
	
		if(result>0) {
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
	public String memberLoginForm(HttpServletRequest request
								 ,HttpSession session) {
		
		//referer(이전 페이지) 값 가져오기
		String referer = request.getHeader("Referer");
		
		//기존 페이지가 null 이고 이전페이지가 "/login"을 포함한다면 로그인 실패 등의 이유로 이전 페이지가 loginForm에 대한 페이지인 것이므로 session에 해당 주소를 저장하지 않는다
		if (referer != null && !referer.contains("/login")) {
	        request.getSession().setAttribute("prevPage", referer);
	    }
		
		//session에 refere 값 넣어주기
		session.setAttribute("referer", referer);
		
		return "member/memberLoginForm";
	}
	
	//로그인 메소드
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m
								   ,String memberId
								   ,ModelAndView mv
								   ,HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		//기존 저장된 refere 값 꺼내주기
		String referer = (String)session.getAttribute("referer");

		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getMemberPwd(),
															loginUser.getMemberPwd())) {
			
			//로그인유저 세션보내기
			session.setAttribute("loginUser", loginUser);
			//로그인 후 이전 페이지로 redirect 해주기
			mv.setViewName("redirect:"+referer);
		}else {
			session.setAttribute("alertMsg", "알 수 없는 회원입니다");
			mv.setViewName("member/memberLoginForm");
			
		}
		
		return mv;
	}
	
	//로그아웃 메소드
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
	//회원id찾기 폼
	@GetMapping("findMemberIdForm.me")
	public String findMemberForm() {
		return "member/findMemberForm";
	}
	
	//id 찾기
	@PostMapping("findMemberId.me")
	public String selectFindId(Member m
							  ,Model model) {
		
		Member memberId = memberService.selectFindId(m);
		
		String findId = memberId.getMemberId();
		
		//System.out.println("찾은 아이디 : "+findId);
		
		if(findId != null) {
			model.addAttribute("findResult", findId);
			model.addAttribute("findMsg", "가입하신 계정");
			return "member/findCompletedForm";
		}else {
			model.addAttribute("alertMsg", "알 수 없는 회원입니다");
			return "member/findMemberForm";
		}
		
	}
	
	//회원pwd찾기 폼
	@GetMapping("findMemberPwdForm.me")
	public String findMemberPwdForm() {
		return "member/findMemberForm";
	}
	
	//pwd 찾기(찾기 누르면 새 비밀번호 폼 표출)
	@PostMapping("findMemberPwd.me")
	public String selectFindPwd(Member m
							   ,String memberId
							   ,String memberName2
							   ,String email2
							   ,Model model) {
		
		//비밀번호 찾기에서 작성한 값들 넣기
		m.setMemberId(memberId);
		m.setMemberName(memberName2);
		m.setEmail(email2);
		
		Member findMember = memberService.selectFindPwd(m);

		if(findMember != null) {
			model.addAttribute("findMember", findMember);
			return "member/resetMemberPwdForm";
		}else {
			model.addAttribute("alertMsg", "알 수 없는 회원입니다");
			return "member/findMemberForm";
		}

	}
	
	//rsetPwd
	@PostMapping("resetMemberPwd.me")
	public String updateNewPwd(Member m
							  ,String memberId
							  ,String newPwd
							  ,Model model) {
		
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		
		m.setMemberId(memberId);
		m.setMemberPwd(encPwd);
		
		int result = memberService.resetMemberPwd(m);
		
		if(result>0) {
			model.addAttribute("alertMsg", "비밀번호가 변경되었습니다");
			return "member/memberLoginForm";
		}else {
			model.addAttribute("alertMsg", "비밀번호 변경 실패");
			return "member/findMemberForm";
		}
		
	}
	
	//아이디 중복
	@PostMapping("checkId.me")
	@ResponseBody
	public int checkId(String memberId) {
		int result = memberService.checkId(memberId);
		return result;
	}
	
	//닉네임 중복
	@PostMapping("checkNick.me")
	@ResponseBody
	public int checkNick(String nickName) {
		int result = memberService.checkNick(nickName);
		return result;
	}
	
	//이메일 중복
	@PostMapping("checkEmail.me")
	@ResponseBody
	public int checkEmail(String email) {
		int result = memberService.checkEmail(email);
		return result;
	}
	
	//폰번호 중복
	@PostMapping("checkPhone.me")
	@ResponseBody
	public int checkPhone(String phone) {
		int result = memberService.checkPhone(phone);
		return result;
	}
	
}//
