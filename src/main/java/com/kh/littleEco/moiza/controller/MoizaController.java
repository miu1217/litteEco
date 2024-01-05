package com.kh.littleEco.moiza.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.littleEco.member.model.vo.Member;
import com.kh.littleEco.moiza.model.service.MoizaService;
import com.kh.littleEco.moiza.model.vo.Moiza;

@Controller
public class MoizaController {

	@Autowired
	private MoizaService moizaService;
	

	
	@GetMapping("moiza")
	public String Moiza() {
		
		
		return "moiza/moizaList";
	}
	
	//모집 게시판 리스트 메소드 
	@ResponseBody
	@RequestMapping(value="moizaList",  produces="application/json; charset=UTF-8")
	public ArrayList<Moiza> MoizaList() {
		
		ArrayList<Moiza> mzList = moizaService.MoizaList();
		
		
		System.out.println(mzList);
		return mzList;
	}
	@GetMapping("moizaInsert")
	public String MoizaInsert() {
		
		
		return "moiza/moizaInsert";
	}
	
	@PostMapping("moizaInsert")
	public String MoizaInsert(Moiza moiza,HttpSession session) {
		
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		
		//moiza 관련 insert 메소드
		int moizaResult = moizaService.MoizaInsert(moiza);
		
		int creatorResult = 0;
		
		int categoryResult = 0;
		if(moizaResult > 0) {
			
			creatorResult = moizaService.MoizaCreatorInsert(memberNo);
			
			categoryResult = moizaService.MoizaCategory(moiza);
		}
		
		int result = creatorResult * categoryResult;
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "moiza 성공");
			return "redirect:moiza";
		}else {
			
			session.setAttribute("alertMsg", "moiza 실패");
			return "redirect:moiza";
		}
		
		
	}
}
