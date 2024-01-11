package com.kh.littleEco.admin.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.littleEco.admin.model.service.AdminService;
import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.brand.model.vo.Category;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.common.template.Pagination;
import com.kh.littleEco.member.model.vo.Member;


@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//adminMain.jsp 이동
	@GetMapping("admin")
	public String Admin(HttpSession session) {
		
		String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		System.out.println(memberId);
		
		if(memberId.equals("admin")) {
			return "admin/adminMain";
		}else {
			
			return "redirect:/";
		}
		
			
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
		return "admin/adminMemberUpdate";
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
	
	//--------------------여기서부터 브랜드 관련 메소드-----------------------
	
	
	//admin 페이지에서 brand 가져오는 메소드
	@GetMapping("brand.ad")
	public String brandList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		// 전체 게시글 개수
		int listCount = adminService.brandListCount();

		int boardLimit = 5;
		int pageLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		

		ArrayList<Brand> bList = adminService.brandList(pi);
		
		
		model.addAttribute("bList", bList);
		model.addAttribute("pi", pi);
		return "admin/adminBrandList";
	}
	
	@GetMapping("brandInsert.ad")
	public String brandInsert() {
		
		
		return "admin/adminBrandInsert";
	}
	
	//brand 입력하는 메소드
	@PostMapping("brandInsert.ad")
	public String brandInsert(Brand b,
							Attachment at,
							MultipartFile upfile,
							HttpSession session) {
	if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setFilePath("resources/brandUploadFiles/");
			
		}
		
		//brand 관련 insert 메소드
		int brandResult = adminService.insertBrand(b);
		
		int result = 0;
		if(brandResult > 0) {
			//brand 선택한 카테고리 입력하는 메소드
			int categoryResult = adminService.insertBrandCategory(b);
			
			int attachResult = adminService.insertBrandAttachment(at);
			
			result = brandResult * categoryResult * attachResult;
			
			
		}

		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 등록 성공");
			return "redirect:brand.ad";
		} else {
			session.setAttribute("alertMsg", "게시글 등록 실패");
			return "redirect:brand.ad";
		}

		
	}
	
	
	@GetMapping("brandUpdate.ad")
	public String brandUpdate(int bno,
							Model model) {
		
		
		Brand b = adminService.selectBrand(bno);
		
		ArrayList<Category> cList = adminService.BrandCategory(bno);
		
		Attachment at = adminService.selectBrandAttachment(bno);
		
		model.addAttribute("b",b);
		model.addAttribute("cList",cList);
		model.addAttribute("at",at);
		return "admin/adminBrandUpdate";
	}
	
	
	
	@PostMapping("brandUpdate.ad")
	public String brandUpdate(Brand b,
							Attachment at,
							MultipartFile upfile,
							HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			if(!at.getOriginName().equals("")) {
				File deleteFile = new File(session.getServletContext().getRealPath(at.getChangeName()));
				deleteFile.delete();
			}
			
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setFilePath("resources/brandUploadFiles/");
			
		}
		
		
		int brandResult = adminService.updateBrand(b);
		
		int deleteResult = adminService.deleteBrandCategory(b);
		
		int insertResult =0;
		if(deleteResult > 0) {
			// update 시 brand_category 에서 delete 로 삭제하고 insert를 다시해서 수정하는 방법으로 하기
			insertResult = adminService.insertNewBrandCategory(b);
			
		}
		
		int attachResult = adminService.updateBrandAttachment(at);
		
		int result = brandResult * deleteResult * insertResult * attachResult;
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:brand.ad";
		} else {
			session.setAttribute("alertMsg", "게시글 수정 실패");
			return "redirect:brand.ad";
		}
	}
	
	
	@RequestMapping("brandDelete.ad")
	public String brandDelete(int bno
								,HttpSession session) {
		int brandResult = adminService.deleteBrand(bno);
		
		
		if(brandResult > 0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:brand.ad";
		}else {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:brand.ad";
		}
	}
	
	//브랜드 관련 파일 업로드 시 파일 이름 변경 하는 메소드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int) Math.random()*90000+10000;
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		String savePath = session.getServletContext().getRealPath("/resources/brandUploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
	}
	
}
