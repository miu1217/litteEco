package com.kh.littleEco.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.littleEco.board.model.service.BoardService;
import com.kh.littleEco.board.model.vo.BoardAttachment;
import com.kh.littleEco.board.model.vo.Notice;
import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.common.template.Pagination;

/**
 * Servlet implementation class BoardController 공지사항 게시판 컨트롤러
 * 
 */
@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;


	// 공지사항 리스트 조회
	@RequestMapping("notice.bo")
	public String noticeList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {

		// 전체 게시글 개수
		int listCount = boardService.noticeListCount();

		// 한 페이지에서 보여줘야 하는 게시글 개수
		int boradLimit = 10;

		// 페이징바 개수
		int pageLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boradLimit);

		ArrayList<Notice> list = boardService.noticeList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "board/noticeListView";
	}

	// 공지사항 상세보기
	@GetMapping("detail.no")
	public String noticeDetail(int bno, Model model) {

		// 조회수 증가
		int result = boardService.increaseCountNotice(bno);
		

		// 조회수 증가 후 조회
		if (result > 0) {
			Notice n = boardService.noticeDetail(bno);
			model.addAttribute("n", n);
		} else {
			model.addAttribute("errorMsg", "공지사항 조회 실패");
			return "common/errorPage";
		}

		return "board/noticeDetailView";
	}


	// 파일명 수정 모듈
	public String saveFile(MultipartFile upFile, HttpSession session) {

		String originName = upFile.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		int ranNum = (int) (Math.random() * 90000 + 10000);

		String ext = originName.substring(originName.lastIndexOf("."));

		String changeName = currentTime + ranNum + ext;

		String savePath = session.getServletContext().getRealPath("/resources/boardFiles");

		try {
			upFile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return changeName;

	}
	
	@GetMapping("insert.no")
	public String noticeInsertForm() {
		
		return "board/noticeInsertForm";
		
	}
	
	@PostMapping("insert.no")
	public String noticeInsert(Notice n, MultipartFile upFile, BoardAttachment bat, HttpSession session) {

		// 게시글 시퀀스 채번 및 등록 
		int boardNo = boardService.getNextNoticeNo();
		
		n.setBoardNo(boardNo);
		
		int result = boardService.noticeInsert(n);
		
		//파일 존재 체크
		if(!upFile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upFile, session);
			
			bat.setBoOriginName(upFile.getOriginalFilename());
			bat.setBoChangeName("/resources/boardFiles" + changeName);
			bat.setBoardNo(boardNo);
			bat.setFilePath(changeName);
			boardService.insertAttachment(bat);
		}
		

		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항 등록 성공");
			return "redirect:notice.bo";
			
			
		}else {
			session.setAttribute("alertMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}

	}
	
	

	@GetMapping("update.no")
	public String noticeUpdateForm(int bno, Model model) {

		Notice n = boardService.noticeDetail(bno);
		model.addAttribute("n", n);

		return "board/noticeUpdateForm";
	}


	
	//공지사항 업데이트
	 @PostMapping("/update.no")
	    public String noticeUpdate(Notice n,
	    						   int boardNo,
	    						   String boardTitle,
	    						   String boardContent,
	    						   BoardAttachment bat,
	    						   MultipartFile reUpFile,
	    						   HttpSession session) {
	       
		 	if(!reUpFile.getOriginalFilename().equals("")) {
		 		String changeName = saveFile(reUpFile, session);
		 		
		 		if(!bat.getBoOriginName().equals("")) {
		 			new File(session.getServletContext().getRealPath(bat.getBoChangeName())).delete();
		 		}
		 	
		 		bat.setBoOriginName(reUpFile.getOriginalFilename());
		 		bat.setBoChangeName("/resources/boardFiles/"+changeName);
		 	}
		 	
		 	n.setBoardNo(boardNo);
		 	n.setBoardTitle(boardTitle);
		 	n.setBoardContent(boardContent);
		 
		 	int result = boardService.noticeUpdateForm(n, bat);
		 	
		 	if (bat != null) {
		 		
		 		// 첨부된 파일이 있으면
	            if (!bat.getBoOriginName().equals("")) {
	                //result = boardService.updateAttachment(bat);
	            	//1.BOARD_ATTACHMENT에서 현 boardNo 기준으로 첨부파일 삭제 
	            	boardService.deleteAttachment(bat);
	            	boardService.insertAttachment(bat);

	            	//2.현재 bat에 있는 첨부파일 신규 등록  
	            } else {
	            	
	               // result = boardService.insertAttachment(bat);
	            	//여긴 할 게 없
	            }
	        }
		 	
		 	
		 	if(result>0) {
		 		session.setAttribute("alertMsg", "공지사항 업데이트");
	            return "redirect:detail.no?bno=" + n.getBoardNo();
		 		
		 	}else {
		 		session.setAttribute("alertMsg", "공지사항 업데이트 실패");
	            return "redirect:detail.no?bno=" + n.getBoardNo();
		 	}
		 
	    }
	
	
	
	
	
	//공지사항 삭제하기
	@PostMapping("delete.no")
	public String noticeDelete(int bno, String filePath, HttpSession session) {
		
		int result = boardService.noticeDelete(bno);
		
		
		if(result > 0) {
			
			if(filePath.equals("")) {
				File f = new File(session.getServletContext().getRealPath(filePath));
				f.delete();
			}
			session.setAttribute("alertMsg", "공지사항을 삭제하다니... 피도눈물도 없는 당신");
			return "redirect:notice.bo";
			
			
		} else {
			session.setAttribute("alertMsg", "공지사항 삭제 실패");
			
		}		
		return "redirect:notice.bo";
	}
}
