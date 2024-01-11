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
		
		//System.out.println(currentPage);
		
		ArrayList<SearchEco> sList = searchEcoService.searchEcoList(pi);
		
		model.addAttribute("sList",sList);
		model.addAttribute("pi",pi);
		
		
		return "searchEco/searchEcoListView";
		
	}
	
	/*
	 * //좋아요 인서트 기능 관련
	 * 
	 * @PostMapping("likeInsert.bo") public int ecoLikeInsert(int bno, int memberNo)
	 * {
	 * 
	 * System.out.println("LIKEINSERT" + bno + memberNo);
	 * 
	 * int num = 0;
	 * 
	 * // 동일 게시글에 대한 이전 추천 여부 검색 int result = searchEcoService.ecoLikeCheck(bno,
	 * memberNo);
	 * 
	 * if(result == 0){ // 추천하지 않았다면 추천 추가 num = searchEcoService.ecoLikeUpdate(bno,
	 * memberNo); }else{ // 추천을 하였다면 추천 삭제 num = searchEcoService.ecoLikeDelete(bno,
	 * memberNo); }
	 * 
	 * return searchEcoService.ecoLikeInsert(bno, memberNo);
	 * 
	 * }
	 */
	
	/*
	 * //좋아요 카운트 기능 관련
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "likeCount.bo", produces =
	 * "application/json; charset=UTF-8") public int ecoLikeCount(int bno) {
	 * 
	 * return searchEcoService.ecoLikeCount(bno);
	 * 
	 * }
	 * 
	 * //좋아요 체크 기능 관련
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "likeCheck.bo", produces =
	 * "application/json; charset=UTF-8") public int ecoLikeCheck(int bno, int
	 * memberNo) {
	 * 
	 * System.out.println("일로왔나"); System.out.println(bno);
	 * System.out.println(memberNo);
	 * 
	 * return searchEcoService.likeMemCheck(bno, memberNo);
	 * 
	 * // JSON 형식으로 응답 // Gson gson = new Gson(); // Google Gson 라이브러리를 사용하여 JSON 변환
	 * // String json = gson.toJson(result); // // return
	 * searchEcoService.ecoLikeCheck(bno, memberNo);
	 * 
	 * }
	 */
	//좋아요 인서트
	@ResponseBody
	@RequestMapping("likeInsert.bo")
	public int likeInsert(@RequestParam("ebno") int ecoBoardNo,HttpSession session) {
		
		EcoLike like = new EcoLike();
		
		System.out.println("좋아요 인서트 컨트롤러"+ecoBoardNo);
		
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
		
		System.out.println("좋아요 리무브 컨트롤러"+ecoBoardNo);
		
		like.setEcoBoardNo(ecoBoardNo);
		like.setMemberNo(((Member) session.getAttribute("loginUser")).getMemberNo());
		
		int e = searchEcoService.ecoLikeRemove(like);
		System.out.println(e);
		return e;
	}
	
	
	
	
	@GetMapping("searchEcoInsert.bo")
	public String seInsert() {
		return "searchEco/searchEcoEnrollForm";
	}
	/*
   @PostMapping("searchEcoInsert.bo")
   public void InsertEco(SearchEco se
		   					,Attachment at
		   					,HttpServletRequest request
		   					,HttpServletResponse response
		   					,HttpSession session
		   					) throws IOException {
	   
	   
	   
	   
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			//저장경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			MultipartRequest multiRequest = new MultipartRequest(request,savePath,maxSize,"URF-8",new MyFileRenamePolicy());
			
			
			String title = request.getParameter("searchEcoTitle");
			String content = request.getParameter("searchEcoBoardContent");
			
			se.setEcoBoardContent(content);
			se.setEcoBoardTitle(title);
			
			ArrayList<Attachment> list = new ArrayList<>();
			
			//각 키값을 반복 돌리면서 요소 꺼내주기
			
			for(int i=1; i<=3; i++) {
				//키값
				String key = "file"+i;
				
				//키값에 해당하는 요소가 있는지 확인하기
				if(multiRequest.getOriginalFileName(key)!=null) {
					//해당 키값에 파일이 있다면
					//Attachment 객체 생성후 데이터 담아주기
					//여러개가 나올 수 있으니 Attachment객체를 list에 추가하기
					//원본명,변경이름,파일경로,파일레벨(썸네일사진/상세사진)
					
					at.setOriginName(multiRequest.getOriginalFileName(key));
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("/resources/uploadFiles/");
					
					if(i==1) { //대표이미지 fileLevel == 1
						at.setFileLevel(1);
					}else { //상세이미지 fileLevel == 2
						at.setFileLevel(2);
					}
					list.add(at); //값 추출 끝났으니 리스트에 추가하기.
				}
			}
			//서비스에 요청하기
			
			int result = searchEcoService.searchEcoinsert(se,list);
			HttpSession session1 = request.getSession();
			
			if(result>0) { //성공
				//성공메세지와함께 사진게시판 목록 보여주기
				session1.setAttribute("alertMsg", "게시글을 등록했습니다.");
				response.sendRedirect(request.getContextPath()+"/searchEco.bo");
				
				
			}else {//실패
				//실패메세지와함께 사진게시판 목록 보여주기
				session1.setAttribute("alertMsg", "게시글 작성을 실패했습니다.");
				response.sendRedirect(request.getContextPath()+"/searchEco.bo");
				
			}
		}
	   
	   
   }

	
	
	@PostMapping("searchEcoInsert.bo")
	public String insertSearchEco(SearchEco se,Model model,MultipartFile upFile,HttpSession session) {
		
		
		int presult =searchEcoService.insertSearchEco(se);
		int aresult = 0;
		
		System.out.println("등록p : "+se);
		
		if(!upFile.getOriginalFilename().equals("")) {
			
			Attachment a = new Attachment();
			
			String changeName = saveFile(upFile,session);
			
			a.setOriginName(upFile.getOriginalFilename());
			a.setChangeName(changeName);
			a.setFilePath("resources/uploadFiles/");
			
			aresult = searchEcoService.insertAttachment(a);
			
			System.out.println("등록pr : "+presult);
			System.out.println("등록ar : "+aresult);
			System.out.println("등록a : "+a);
			
		}
			
		
			if((presult*aresult)>0) {
				
				session.setAttribute("alertMsg", "게시글 등록 성공");
				return "redirect:searchEco.bo";
				
				}else {
					session.setAttribute("alertMsg", "게시글 등록 실패");
					return "common/errorPage";
			}
		
	}
	*/
	
	@PostMapping("searchEcoInsert.bo")
	public String insertSearchEco(SearchEco se, Brand b, Attachment at, Model model,
								  HttpSession session) {
		
		//브랜드 채번
		//int brandNo = searchEcoService.getNextBrandNo();

		Brand brand = searchEcoService.selectBrandNo(b);
		
		System.out.println("dssseeess"+se.getEcoBoardTitle());
		System.out.println("dddd" + se);
		System.out.println("ddsssdd" + b);
		System.out.println(brand);
		int brandNo = brand.getBrandNo();
		
		System.out.println(brandNo);
		//게시글 채번
		int ecoBoardNo = searchEcoService.getNextEcoBoardNo();
		
		//attachment File no 채번
		int fileNo = searchEcoService.getNextFileNo();

		
		b.setBrandNo(brandNo);
		se.setBrandNo(brandNo);
		se.setEcoBoardNo(ecoBoardNo);
		//se.setThumImg(upFile.getOriginalFilename());
		
		
		System.out.println("dddd" + se);
		int result2 = searchEcoService.insertSearchEco(se);
		
		//upFileDetail
		
		//파일 체크해서 Attachment 테이블에 인서트(썸네일)
		/*
		 * if(!upFile.getOriginalFilename().equals("")) {
		 * 
		 * 
		 * 
		 * String changeName = saveFile(upFile, session);
		 * 
		 * at.setFileNo(fileNo); at.setOriginName(upFile.getOriginalFilename());
		 * at.setChangeName(changeName); at.setFilePath("resources/brandAttachmet/");
		 * 
		 * at.setBrandNo(brandNo);
		 * 
		 * int result3 = searchEcoService.insertAttachment(at); }
		 */

		
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
		System.out.println(originName);
		
		
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
	public String detailSearchEco(int bno, Model model) {

		// 조회수 증가
		int result = searchEcoService.increaseCountSearchEco(bno);
		System.out.println("detailboard bno 보드넘버 컨트롤러 : " + bno);

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
		
		System.out.println("delete"+bno);
		
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "공지사항을 삭제하다니... 피도눈물도 없는 당신");
			
			
			
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
		
		return "searchEco/searchEcoListView";

	}
	

	@RequestMapping("likeCheck")
	public String likeCheck(@RequestParam("ebno") int ecoBoardNo) {
		int bno;
		
		
		return null;
	}
	
	
}
