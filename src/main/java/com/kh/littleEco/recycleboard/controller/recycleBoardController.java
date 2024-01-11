package com.kh.littleEco.recycleboard.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartRequest;

import com.kh.littleEco.common.model.vo.PageInfo;
import com.kh.littleEco.common.template.Pagination;
import com.kh.littleEco.recycleboard.model.service.recycleBoardService;
import com.kh.littleEco.recycleboard.model.vo.boardAttachment;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;

import lombok.extern.slf4j.Slf4j;


/**
 * Servlet implementation class recycleBoardController
 */
@Slf4j
@Controller
public class recycleBoardController {
	@Autowired
	private recycleBoardService rBoardService;
	

	@GetMapping("rblist.hrb")
	public String recycleBList(@RequestParam(value="currentPage",defaultValue="1")int currentPage,
											Model model) {
		//페이징 처리된 게시글 조회하기 
		//현재 ㅔ이지정보 (currentPage) - 처음 게시판을 들어올 때는 페이지정보가 없으니 defaultValue에 설정해주기 
		//전체 게시글 개수 (listCount)-selectListCount() 메소드명 
		int listCount = rBoardService.selectRecycleListCount();
		int boardLimit = 6; //한페이지에 보여줘야하는 게시글 개수 (boardLimit ) : 6
		int pageLimit = 10; //페이징바 개수 (pageLimit) : 10 
		
		PageInfo pi = Pagination.getPageInfo(listCount,currentPage,pageLimit,boardLimit);
	    
		ArrayList<recycleBoard> list = rBoardService.selectRecycleList(pi);
		
		System.out.println(list);
		//페이징 처리된 게시글 몰록 조회해서 listview에 보여주기 
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return"board/how2RecycleList";
	}
	
	private static String realPath="/resources/fileupload";
	
	@RequestMapping("download.hrb")
	protected void download(@RequestParam String imageFileName,
			 				HttpServletResponse response) throws Exception {
		//인터넷상에서 파일을 다룰때 Streaming gudtlr
		OutputStream out = response.getOutputStream();
		
		//다운로드 폴더에 있는 이미지를 문자열 형태로 만든 후 
		String downFile = realPath+"\\"+imageFileName;
		File file = new File(downFile); //파일객체로 반환 
		
		//헤더내부에 가지고 있는 이름이기에 변경 불가능- cache메모리 사용여부 
		response.setHeader("Cache-Control", "no-cache");
		//HTML문서의 헤더 부분 (POST방식을 이용하면 헤더를 통해 이동함) 
		//content: "attachment:fileName= "+imageFileName
		response.addHeader("Content-disposition","attachment:fileName="+imageFileName);
		
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		
		System.out.println(buffer);
		System.out.println(in);
		
		
		while(true) {
			int count = in.read(buffer); //버퍼에 읽어들인 문자 개수 
			if(count == -1) //버퍼의 마지막에 도달하였는지 확인 
				break;
			out.write(buffer,0,count); //~ 어느 배열의 몇번 인덱스부터 몇번 인덱스까지 ~
		}
		in.close();
		out.close();
	}
	
	
	
	
	
	@GetMapping("rbinsert.hrb")
	public String recycleInsert() {
		return "board/how2RecycleEnrollForm";
	}

	
	/*
	
	@PostMapping("rbinsert.hrb")
	public String insertBoard(@RequestParam("multiFile")List<MultipartFile> multiFileList, 
							 recycleBoard rb,
							 HttpServletRequest request) {

		// 받아온것 출력 확인
				System.out.println("multiFileList : " + multiFileList);
				
				// path 가져오기
				String path = request.getSession().getServletContext().getRealPath("resources");
				String root = path + "\\" + "uploadFiles";
				
				File fileCheck = new File(root);
				
				if(!fileCheck.exists()) fileCheck.mkdirs();
				
				
				List<Map<String, String>> fileList = new ArrayList<>();
				
				for(int i = 0; i < multiFileList.size(); i++) {
					String originFile = multiFileList.get(i).getOriginalFilename();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					
					
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);
					
					fileList.add(map);
				}
				
				
				// System.out.println(fileList);
				
				// 파일업로드
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
						File uploadFile = new File(root + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
					
					System.out.println("다중 파일 업로드 성공!");
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					
					
					e.printStackTrace();
				}
				
				
				
				return "result";
			}
	
	*/
	
	
	@PostMapping("rbinsert.hrb")
	public String insertBoard(recycleBoard rb,
							boardAttachment bat,
			                MultipartFile upfile,
			                HttpSession session) {
		
		/*
			String changeName = saveFile(upfile,session);
			System.out.println(changeName);
			//8.데이터베이스에 등록할 변경이름 , 원본이름 Board VO에 담기 
			
			rb.setBoOriginName(upfile.getOriginalFilename());
			rb.setBoChangeName("resources/uploadFiles/"+changeName);
		    rb.setBoardNo(rb.getBoardNo());
		    rb.setMemberNo(rb.getMemberNo());
			
			System.out.println("INSERT "+rb);
		//if문 벗어나서 작업하기 
		//데이터베이스에 정보 등록하기 
			int result = rBoardService.insertRecycle(rb);
				
			
			if(result >0) {
				session.setAttribute("alertMsg", "게시글 등록 성공");
				return "board/how2RecycleList";
			}else {
				
				session.setAttribute("alerMsg", "게시글 등록 실패");
				return "board/how2RecycleList";
			}
			*/
			

		
		// 게시글 시퀀스 채번 및 등록 
		int boardNo = rBoardService.getNextRecycleNo();
		int boFileNo = rBoardService.getNextBoardAttachNo();
		
		rb.setBoardNo(boardNo);
		rb.setThumImg("/resources/uploadFiles" + upfile.getOriginalFilename());
		bat.setBoFileNo(boFileNo);
		System.out.println(rb.getThumImg());
		int result = rBoardService.recycleInsert(rb);
		
		
		System.out.println("보드넘버를찍어보자 " + boardNo);
		
		
		
		//파일 존재 체크
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			bat.setBoOriginName(upfile.getOriginalFilename());
			bat.setBoChangeName("/resources/uploadFiles" + changeName);
			bat.setBoardNo(boardNo);
			bat.setFilePath(changeName);
			rBoardService.insertAttachment(bat);
		}
		

		if(result > 0) {
			session.setAttribute("alertMsg", "게시물 등록 성공");
			return "redirect:rblist.hrb";
			
			
		}else {
			session.setAttribute("alertMsg", "게시물 등록 실패");
			return "common/errorPage";
		}
		
		
		/*
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile,session);
			
			rb.setBoOriginName(upfile.getOriginalFilename());
			rb.setBoChangeName("resources/uploadFiles/"+changeName);
			System.out.println("목록보여주세염"+rb);
			
		}
		int result = rBoardService.insertRecycle(rb);
		
		if(result>0) {
			session.setAttribute("alertMsg","게시글 등록 성공");
			return "redirect:rblist.hrb";
		}else {
			session.setAttribute("alertMsg","게시글 등록 실패");
			return "common/errorPage";
		}
		*/
	}

	@GetMapping("rbUpdate.hrb")
	public String recycleUpdate(int rbno,
								Model model) {
		recycleBoard rb = rBoardService.recycleBoardDetail(rbno);
		System.out.println("rb나오니? : "+rb);
		model.addAttribute("rb",rb);
		return "board/how2RecycleUpdateForm";
	}
	

	//게시물 수정
		 @PostMapping("rbUpdate.hrb")
		    public String recycleUpdate(recycleBoard rb,
		    						@RequestParam("rbno") int rbno,
		    						   MultipartFile reUpFile,
		    						   Model model,
		    						   HttpSession session) {

			 int aresult = 0;
			
		 	if(reUpFile != null) {
			 	if(!reUpFile.getOriginalFilename().equals("")) {
			 		System.out.println("reUpFile:"+reUpFile);
			 		
			 		boardAttachment bat = new boardAttachment();	 		
			 		String changeName = saveFile(reUpFile, session);
	
			 		bat.setBoOriginName(reUpFile.getOriginalFilename());
			 		bat.setBoChangeName(changeName);
			 		bat.setFilePath("resources/uploadFiles/");
			 		bat.setBoardNo(rbno);
			 		
			 		if(!bat.getBoOriginName().equals("")) {
			 			System.out.println(bat.getBoOriginName());
			 			new File(session.getServletContext().getRealPath(bat.getBoChangeName())).delete();
			 		}
			 		
			 		aresult = rBoardService.updateRecycleAttach(bat);
			 		rb.setBoChangeName(changeName);
			 		rb.setBoOriginName(bat.getBoOriginName());
			 		rb.setFilePath(bat.getFilePath());
			 		rb.setBoardNo(rbno);
			 	}
		 	}
			
		 	int presult = rBoardService.updateRecycle(rb);
			 
		 	rb.setBoardNo(rbno);
		 	model.addAttribute("rb",rb);
		 	

			session.setAttribute("alertMsg", "게시물 업데이트성공");

			return "board/how2RecycleDetailForm";
/*			if(!reUpFile.getOriginalFilename().equals("")) {
				String changeName = saveFile(reUpFile,session);
				if(!rb.getBoOriginName().equals("")) {
					File f = new File(session.getServletContext().getRealPath(rb.getBoChangeName()));
					f.delete();
				}
				
				rb.setBoOriginName(reUpFile.getOriginalFilename());
				rb.setBoChangeName("resources/uploadFiles/"+changeName);
}

			int result = rBoardService.updateRecycle(rb);
			
			if(result>0) {
				session.setAttribute("alertMsg","게시글 수정 성공");
				return "redirect:rbdetail.hrb?rbno"+rb.getBoardNo();
			}else {
				session.setAttribute("alertMsg","게시글 수정 실패");
				return "common/errorPage";
			}
			 */
		    }
		
	//게시물 상세보기 
	@GetMapping("rbdetail.hrb")
	public String recycleDetail(@RequestParam(value="rbno",defaultValue="1")int rbno,Model model)  {
		//조회수 증가(update-DML)
		int result = rBoardService.increaseCount(rbno);
		System.out.println(rbno);
		
		//조회수 증가가 이루어지면 해당 페이지 조회한다. 
		if(result>0) { //성공
			recycleBoard rb = rBoardService.recycleBoardDetail(rbno);
			model.addAttribute("rb",rb);
		
			System.out.println("RB:"+rb);
			System.out.println("RBNO:"+rbno);
		}else {
			model.addAttribute("errorMsg","게시글 조회 실패");
			return "common/errorPage";
		}
		return "board/how2RecycleDetailForm";
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
				String savePath = session.getServletContext().getRealPath("resources/uploadFiles/");
				
				//7.경로와 수정파일명으로 파일 업로드 하기 (경로+파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다. 
				try {
					upfile.transferTo(new File(savePath+changeName));

				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return changeName;
			}
			
			
			
			
			//게시물 삭제하기
			@PostMapping("rbdelete.hrb")
			public String noticeDelete(int rbno, String filePath, HttpSession session) {
				
				int result = rBoardService.recycleDelete(rbno);
				
				System.out.println("delete"+rbno);
				
//				System.out.println(bno);
				
				if(result > 0) {
					
					if(filePath.equals("")) {
						File f = new File(session.getServletContext().getRealPath(filePath));
						f.delete();
					}
					session.setAttribute("alertMsg", "공지사항을 삭제하다니... 피도눈물도 없는 당신");
					return "redirect:rblist.hrb";
					
					
				} else {
					session.setAttribute("alertMsg", "공지사항 삭제 실패");
					
				}		
				return "board/how2RecycleList";
			}
			
			//인기게시글
			@ResponseBody
			@PostMapping("bestBoard.rb")
			public ArrayList<recycleBoard> selectBestBoard(){
				ArrayList<recycleBoard> bestBoardList = new ArrayList<recycleBoard>();
				bestBoardList = rBoardService.selectBestBoard();
				return bestBoardList;
			}
		
			
}
