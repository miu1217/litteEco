package com.kh.littleEco.searchEco.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.littleEco.board.model.vo.Notice;
import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Brand;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.common.template.Pagination;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.searchEco.model.service.SearchEcoService;
import com.kh.littleEco.searchEco.model.vo.EcoLike;
import com.kh.littleEco.searchEco.model.vo.SearchEco;


@Controller
public class SearchEcoController {
	
	@Autowired
	SearchEcoService searchEcoService;
	
	
	//서치에코 리스트 뷰
	@RequestMapping("searchEco.bo")
	public String searchEcoList(@RequestParam(value = "currentPage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = searchEcoService.searchEcoListCount();
		
		int boardLimit = 4;
		
		int pageLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<SearchEco> sList = searchEcoService.searchEcoList(pi);
	
		
		model.addAttribute("sList",sList);
		model.addAttribute("pi",pi);
		
		
		return "searchEco/searchEcoListView";
		
	}
	
	//좋아요 인서트
	@ResponseBody
	@RequestMapping("likeInsert.bo")
	public int likeInsert(@RequestParam("ebno") int ecoBoardNo,HttpSession session) {
		
		EcoLike like = new EcoLike();
		
		like.setEcoBoardNo(ecoBoardNo);
		like.setMemberNo(((Member) session.getAttribute("loginUser")).getMemberNo());
		
		int e = searchEcoService.ecoLikeInsert(like);
		
		return e;
	}
	
	//좋아요 해제 
	@ResponseBody
	@RequestMapping(value="likeRemove.bo")
	public int removeLike(@RequestParam("ebno") int ecoBoardNo, HttpSession session) {
			
		EcoLike like = new EcoLike();
		
		like.setEcoBoardNo(ecoBoardNo);
		like.setMemberNo(((Member) session.getAttribute("loginUser")).getMemberNo());
		
		int e = searchEcoService.ecoLikeRemove(like);
		
		return e;
	}
	
	
	
	
	@GetMapping("searchEcoInsert.bo")
	public String seInsert() {
		return "searchEco/searchEcoEnrollForm";
	}
	
	
	@PostMapping("searchEcoInsert.bo")
	public String insertSearchEco(SearchEco se, Brand b, Attachment at, Model model,
								  HttpSession session) {
		
		//브랜드 채번
		//int brandNo = searchEcoService.getNextBrandNo();

		Brand brand = searchEcoService.selectBrandNo(b);
		
		int brandNo = brand.getBrandNo();

		//게시글 채번
		int ecoBoardNo = searchEcoService.getNextEcoBoardNo();
		
		//attachment File no 채번
		int fileNo = searchEcoService.getNextFileNo();

		
		b.setBrandNo(brandNo);
		se.setBrandNo(brandNo);
		se.setEcoBoardNo(ecoBoardNo);
		
		int result2 = searchEcoService.insertSearchEco(se);
		
	
		
		if(result2 > 0 ) {
			session.setAttribute("alertMsg", "브랜드 등록 성공");
		}else {
			session.setAttribute("alertMsg", "브랜드 등록 실패");
			
		}
	
		return "redirect:searchEco.bo";
	
	}
   
	//파일명 수정 모듈 
	public String saveFile(MultipartFile upfile,HttpSession session) {
		//파일명 수정하기 
		//1.원본 파일명 추출
		String originName = upfile.getOriginalFilename();

		//2. 시간 추출하기 (년월일시분초)-utill.Date
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//3.뒤에 붙일 랜덤값 5자리 추출하기 
		int ranNum = (int)( Math.random() * 90000+10000);
		
		//4.원본 파일명ㅇ에서 확장자 추출하기 test.txt  - 뒤에서부터 .을 찾고 그 뒤로 잘라내기  .txt
		String ext = originName.substring(originName.lastIndexOf("."));
		
		
		//5. 2,3,4 이어붙여서 변경이름 만들기 (업로드 이름) 
		String changeName = currentTime + ranNum +ext;
		
		//6.저장시킬 실질적인 물리적 경로 추출하기 (r경로가져오기 HttpSession session)
		String savePath = session.getServletContext().getRealPath("resources/brandAttachment/");
		
		//7.경로와 수정파일명으로 파일 업로드 하기 (경로+파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다. 
		try {
			upfile.transferTo(new File(savePath+changeName));

		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	@GetMapping("detail.sbo")
	public String detailSearchEco(int bno
								 ,Model model) {
		

		// 조회수 증가
		int result = searchEcoService.increaseCountSearchEco(bno);
		
		// 조회수 증가 후 조회
		if (result > 0) {
			SearchEco s = searchEcoService.detailSearchEco(bno);
			model.addAttribute("s", s);

		} else {
			model.addAttribute("errorMsg", "브랜드 조회 실패");
			return "common/errorPage";
		}

		return "searchEco/searchEcoDetailView";
	}
	
	
	
	//게시물 삭제하기
	@PostMapping("delete.sbo")
	public String noticeDelete(int bno, HttpSession session) {
		
		int result = searchEcoService.searchEcoDelete(bno);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "공지사항 삭제 성공");
			
			
			
		} else {
			session.setAttribute("alertMsg", "공지사항 삭제 실패");
			
		}		
		return "redirect:searchEco.bo";
	}
	
	//업데이트 페이지 이동
	@GetMapping ("searchEcoUpdate.bo")
	public String searchEcoUpdate(int bno, Model model) {
		
		SearchEco se = searchEcoService.detailSearchEco(bno);
		
		model.addAttribute("se", se);
		return "searchEco/searchEcoUpdateForm";
		
		

	}
	
	@PostMapping("searchEcoUpdate.bo")
	public String searchEcoUpdate(SearchEco se, @RequestParam("ecoBoardNo") int ecoBoardNo,
								  Model model, HttpSession session) {
		
		int result = searchEcoService.searchEcoUpdate(se);
		se.setEcoBoardNo(ecoBoardNo);
		
		model.addAttribute("se",se);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "업데이트 성공");
			
		} else {
			
			session.setAttribute("alertMsg", "업데이트 실패");
		}
		
		return "redirect:searchEco.bo";

	}
	

	//메인에서 브랜드 클릭시 관련 보드번호 가져오기
	@ResponseBody
	@PostMapping("brandDetail.bo")
	public int getBoardNo(int brandNo) {
		int getBno = searchEcoService.getBoardNo(brandNo);
		return getBno;
	}
	
	
	
	
}
