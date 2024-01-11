package com.kh.littleEco.popularSearch.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.littleEco.moiza.model.vo.Moiza;
import com.kh.littleEco.popularSearch.model.service.PopularSearchService;
import com.kh.littleEco.popularSearch.model.vo.PopularSearch;
import com.kh.littleEco.recycleboard.model.service.recycleBoardService;
import com.kh.littleEco.recycleboard.model.vo.recycleBoard;
import com.kh.littleEco.searchEco.model.service.SearchEcoService;
import com.kh.littleEco.searchEco.model.vo.SearchEco;

@Controller
public class PopularSearchController {

	@Autowired
	private PopularSearchService psService;
	
	//합쳐야 쓸 수 있음
	@Autowired
    private SearchEcoService searchEcoService;

    @Autowired
    private recycleBoardService recycleBoardService;
//
//    @Autowired
//    private ClubService clubService;
	
	
	//검색어 상위 10개 조회 메소드
	@ResponseBody
	@RequestMapping(value="select.ps",produces="application/json; charset=UTF-8")
	public String selectKeyword() {
		
		ArrayList<PopularSearch> list = psService.selectKeyword();
		
		
		return new Gson().toJson(list);
	}
	
	//검색 메소드 (db추가 및 조회)
	@RequestMapping("insert.ps")
	public String insertKeyword(@RequestParam (value="keyword") String keyword , Model model) {
		
		
		int result = psService.insertKeyword(keyword);
		
		if(result>0) {
			ArrayList<SearchEco> sList = psService.searchEcoKeyword(keyword);
			ArrayList<recycleBoard> rList = psService.searchRecycleBoardKeyword(keyword);
			ArrayList<Moiza> mList = psService.searchMoiza(keyword);
			model.addAttribute("keyword", keyword);
			model.addAttribute("rList",rList);
			model.addAttribute("sList",sList);
			model.addAttribute("mList",mList);
			System.out.println(model);
			System.out.println(mList);
		}else {
		}
		
		return "board/allBoardList";
	}
	
	//자동완성 메소드
	@ResponseBody
	@RequestMapping(value="auto.ps",produces="application/json; charset=UTF-8")
	public String autoComplate(@RequestParam(value="keyword") String keyword){
		
		ArrayList<PopularSearch> sList = psService.autoComplate(keyword);
		
		return new Gson().toJson(sList);
	}
	


	

	
}
