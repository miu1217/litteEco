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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.littleEco.member.model.service.MemberService;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.member.model.vo.MemberCategory;

@Controller
public class MemberController {
	
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	


	
	//마이페이지로 이동
	@RequestMapping("mypage.me")
	public String mypageForm() {
		return "member/mypage";
	}
	
	//회원정보 수정 메소드
	@ResponseBody
	@RequestMapping("update.me")
	public ModelAndView updateMember(Member m,HttpSession session,ModelAndView mv,
									String memberPwd){
		
		
		Member loginUser = memberService.loginMember(m); //기존 회원정보 조회 메소드 불러오기
		
		String loginUserPwd = loginUser.getMemberPwd();
		
		
		if(bcryptPasswordEncoder.matches(memberPwd,
				loginUserPwd)) {
			int result = memberService.updateMember(m);
				if(result>0) {
					Member loginUser1 = memberService.loginMember(m);
					session.setAttribute("loginUser", loginUser1);
					session.setAttribute("alertMsg", "변경 성공");
					mv.setViewName("redirect:mypage.me");
				}
					
				}else {
					session.setAttribute("alertMsg", "변경 실패");
					mv.setViewName("redirect:mypage.me");
				}
				return mv;
				
			}
	
	
	//비밀번호 변경 메소드
	@ResponseBody
	@RequestMapping("updatePwd.me")
	public ModelAndView updatePassword( HttpSession session, ModelAndView mv,
	    @RequestParam(value="memberPwd") String memberPwd,
	    @RequestParam(value="newPwd") String newPwd,
	    @RequestParam(value="checkPwd") String checkPwd) {

	    // 현재 로그인된 사용자 정보 가져오기
		Member loginUser = (Member)session.getAttribute("loginUser");
		
	  
	    // 입력한 기존 비밀번호가 실제 회원의 비밀번호와 일치하는지 확인
	    if (bcryptPasswordEncoder.matches(memberPwd,loginUser.getMemberPwd())) {
	        // 새 비밀번호와 새 비밀번호 확인이 일치하는지 확인
	        if (newPwd.equals(checkPwd)) {
	            // 새 비밀번호를 회원 정보에 설정
	        	String encPwd = bcryptPasswordEncoder.encode(newPwd);
	        	loginUser.setMemberPwd(encPwd);

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
	//회원 탈퇴 페이지로 이동
	@RequestMapping("delete.me")
	public String deletePage() {
		
		
		return "member/memberDeleteForm";
	}
	
	
	//회원탈퇴 메소드
	@RequestMapping("deleteMember.me")
	public String deleteMember(String userPwd, String withdrawalReason, HttpSession session, Model model) {
	    Member loginUser = (Member) session.getAttribute("loginUser");

	    String loginUserPwd = loginUser.getMemberPwd();
	    
	    if (bcryptPasswordEncoder.matches(userPwd, loginUserPwd)) {

	        loginUser.setWithdrawalReason(withdrawalReason);
	        int result = memberService.deleteMember(loginUser);

	        if (result > 0) {
	            System.out.println(withdrawalReason);
	            
	            session.setAttribute("loginUser", loginUser); //세션에 갱신
	            session.setAttribute("alertMsg", "그 동안 저희 사이트를 이용해주셔서 감사합니다");
	            session.removeAttribute("loginUser");
	            return "redirect:/";
	        } else {
	            System.out.println(withdrawalReason);
	            session.setAttribute("alertMsg", "회원 탈퇴 실패");
	            return "member/memberDeleteForm";
	        }
	    } else {
	        System.out.println(withdrawalReason);
	        model.addAttribute("alertMsg", "비밀번호를 확인해주세요");
	        return "member/memberDeleteForm";
	    }
	}

	//////////////////////////////////////////////////////////////////////

	//회원가입 
	//페이지로 넘겨주기
	@GetMapping("enrollForm.me")
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
	}
	

	
	//카테고리 수정 페이지로 이동
	@RequestMapping("category.me")
	public String category() {
		
		
		return "member/updateCategory";
		
	}
	
	//회원 카테고리 수정 메소드
	@ResponseBody
	@RequestMapping("updateCaterory.me")
	public ModelAndView upadteCategory(ModelAndView mv,Model model,Member m,
			@RequestParam(value = "categoryNo") ArrayList<Integer> categoryNo,HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
			ArrayList<MemberCategory> categoryList = new ArrayList<>();
		
			MemberCategory memberCategory = new MemberCategory();
		   for (Integer catNo : categoryNo) {
			      memberCategory.setCategoryNo(catNo);
			      memberCategory.setMemberNo(loginUser.getMemberNo());
			      categoryList.add(memberCategory);
			   }
		
		int result = memberService.updateCategory(categoryList);
		
		
		
		if(result>0) {
			session.setAttribute("loginUser", loginUser);
			model.addAttribute("alertMsg","수정 성공");
			mv.setViewName("member/updateCategory");
			
		}else {
			model.addAttribute("alertMsg","수정 실패");
			mv.setViewName("member/updateCategory");
		}
		
		return mv;
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
	public String memberLoginForm() {
		return "member/memberLoginForm";
	}
	
	//로그인 메소드
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m
								   ,String memberId
								   ,String remember
								   ,Model model
								   ,ModelAndView mv
								   ,HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getMemberPwd(),
															loginUser.getMemberPwd())) {
			
			//로그인유저 세션보내기
			session.setAttribute("loginUser", loginUser);		
			mv.setViewName("redirect:/");
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
	
}
