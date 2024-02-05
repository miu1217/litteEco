package com.kh.littleEco.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.littleEco.common.Pagination;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.mypage.model.service.MypageService;
import com.kh.littleEco.mypage.model.vo.InterestBoard;
import com.kh.littleEco.mypage.model.vo.MyPost;
import com.kh.littleEco.mypage.model.vo.Mypage;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

@Controller
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	
	
	@RequestMapping("scrap.mp")
	public String scrap() {
		
		return "member/scrap";
	}
	
	//폴더 조회
	@ResponseBody
	@RequestMapping(value = "selectFolder.mp", produces = "application/json; charset=UTF-8")
	public String selectFolder(HttpSession session) {
	    
		Member loginUser = (Member) session.getAttribute("loginUser");
	    int memberNo = loginUser.getMemberNo();

	    ArrayList<Mypage> list = mypageService.selectFolder(memberNo);
	  
	    return new Gson().toJson(list);
	}
	
	
	//폴더 추가 메소드
	@ResponseBody
	@RequestMapping(value = "addFolder.mp", produces = "application/json; charset=UTF-8")
	public String addFolder(@RequestParam(value = "folderName") String folderName,
	                        @RequestParam(value = "memberNo") int memberNo ,
	                        HttpSession session) {
		
	    int result = mypageService.addFolder(memberNo, folderName);
	    
	    Map<String, Object> response = new HashMap<>();
	    if (result > 0) {
	        response.put("success", true);
	        response.put("message", "폴더 추가 성공");
	    } else {
	        response.put("success", false);
	        response.put("message", "폴더 추가 실패");
	    }

	    return new Gson().toJson(response);
	}
	
	//폴더 삭제 메소드
	@ResponseBody
	@RequestMapping(value = "deleteFolder.mp", produces = "application/json;charset=UTF-8")
	public String deleteFolder(@RequestParam(value = "folderNo") int folderNo) {
	    int result = mypageService.deleteFolder(folderNo);

	    Map<String, Object> response = new HashMap<>();
	    if (result > 0) {
	        response.put("success", true);
	        response.put("message", "폴더 삭제 성공");
	    } else {
	        response.put("success", false);
	        response.put("message", "폴더 삭제 실패");
	    }

	    return new Gson().toJson(response);
	}
	
	
	//좋아요 한 게시글 조회
	@RequestMapping("likePost.mp")
	public String likePost(HttpSession session , Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		
		ArrayList<SearchEco> elList = mypageService.selectLikeList(memberNo);
		
		model.addAttribute("elList",elList);
		
		
		return "member/myLikePost";
	}
	
	//내가 쓴글
	@RequestMapping("myPost.mp")
	public String myPost(@RequestParam(value="currentPage",defaultValue="1")int currentPage,
	Model model,HttpSession session ) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		
		
		//페이징 처리된 게시글 조회하기 
		//현재 페이지정보 (currentPage) - 처음 게시판을 들어올 때는 페이지정보가 없으니 defaultValue에 설정해주기 
		//전체 게시글 개수 (listCount)-selectListCount() 메소드명 
		int listCount = mypageService.selectListCount(memberNo);
		int boardLimit = 6; //한페이지에 보여줘야하는 게시글 개수 (boardLimit ) : 6
		int pageLimit = 10; //페이징바 개수 (pageLimit) : 10 
		
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
	    
		ArrayList<MyPost>list = mypageService.selectBoardList(memberNo,pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "member/myPost";
	}
	
	
	//내가 쓴글 삭제
	@ResponseBody
	@RequestMapping
	public String deleteMyPost(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		
		int result = mypageService.deleteMypost(memberNo);
		
		
		return "member/myPost";
		
	}
	
	
	
	//리사이클 보드 게시물 스크랩
	@ResponseBody
	@RequestMapping(value = "scrapBoard.mp", produces = "application/json; charset=UTF-8")
	public int scrapBoard(int boardNo, int memberNo, int folderNo, Model model) {
	    
		int scrapChk = mypageService.scrapChk(memberNo,boardNo);
		
		if(scrapChk!=0) {
		
			return  0;
		}
		int result = mypageService.scrapBoard(boardNo, memberNo, folderNo);
	    
	    if (result > 0) {
	        return result;
	    } else {
	    	
	    }
		
		return scrapChk;
	}
	
	//에코 보드 게시물 스크랩
	@ResponseBody
	@RequestMapping(value = "scrapEcoBoard.mp", produces = "application/json; charset=UTF-8")
	public int scrapEcoBoard(int ecoBoardNo, int memberNo, int folderNo, Model model) {
	    
		//스크랩 중복확인
		int scrapChk = mypageService.scrapEcoChk(memberNo,ecoBoardNo);
		
		if(scrapChk!=0) {
		
			return  0;
		}
		int result = mypageService.scrapEcoBoard(ecoBoardNo, memberNo, folderNo);
	   
	    if (result > 0) {
	    	
	        return result;
	    } else {
	    	
	    }
		
		return scrapChk;
	}
	
	
	//모이자 게시물 스크랩
	@ResponseBody
	@RequestMapping(value = "scrapMoizaBoard.mp", produces = "application/json; charset=UTF-8")
	public int scrapMoizaBoard(int moizaNo, int memberNo, int folderNo, Model model) {
	    
		//스크랩 중복확인
		int scrapChk = mypageService.scrapMoizaChk(memberNo,moizaNo);
		
		if(scrapChk!=0) {
		
			return  0;
		}
		int result = mypageService.scrapMoizaBoard(moizaNo, memberNo, folderNo);
	    
	    if (result > 0) {
	    	
	        return result;
	    } else {
	    	
	    }
		
		return scrapChk;
	}
	
	
	
	
	//폴더 내에 스크랩 게시물 조회
	@RequestMapping("scrapListContent.mp")
	public ModelAndView selectScrap(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
	                                HttpSession session,  int folderNo) {

	    int listCount = mypageService.selectScrapCount(folderNo);
	    int boardLimit = 6;
	    int pageLimit = 10;

	    PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

	    ArrayList<InterestBoard> list = mypageService.selectScrapList(folderNo, pi);

	    ModelAndView modelAndView = new ModelAndView("member/scrapListView"); 
	    modelAndView.addObject("list", list);
	    modelAndView.addObject("pi", pi);
	   
	    
	    return modelAndView;
	}
	
	//게시물 폴더 이동
	@ResponseBody
	@RequestMapping("updateFolder")
	public int updateFolder(int folderNo,
	                            @RequestParam(value = "boardNo", required = false) Integer boardNo
	                            ,@RequestParam(value = "ecoBoardNo", required = false) Integer ecoBoardNo
	                            ,@RequestParam(value = "moizaNo", required = false) Integer moizaNo, Model model) {

		int result = mypageService.updateFolder(boardNo,ecoBoardNo,moizaNo, folderNo);
		
		
	    return result;
	}
	
	
	@GetMapping("moiza.mp")
	public String Moiza() {
		
		
		return "member/myMoiza";
	}
	
	//모집 게시판 리스트 메소드 
	@ResponseBody
	@RequestMapping(value="moizaList.mp",  produces="application/json; charset=UTF-8")
	public ArrayList<Moiza> MoizaList(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int mno = loginUser.getMemberNo();
		
		ArrayList<Moiza> mzList = mypageService.selectMoizaList(mno);
		
		
		return mzList;
	}

			
}
	



	

	
	

