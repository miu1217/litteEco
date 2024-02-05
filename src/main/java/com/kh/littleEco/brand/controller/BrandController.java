package com.kh.littleEco.brand.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.littleEco.brand.model.service.BrandService;
import com.kh.littleEco.brand.model.vo.Attachment;
import com.kh.littleEco.brand.model.vo.Category;

@Controller
public class BrandController {

	@Autowired
	private BrandService brandService;
	
	//브랜드 사진(attachment) 리스트 가져오기(메인화면으로)
	@ResponseBody
	@RequestMapping("getBrandList.ac")
	public ArrayList<Attachment> selectBrandList() {

		ArrayList<Attachment> acList = new ArrayList<>();
		
		acList = brandService.selectBrandList();
		
		return acList;
	}
	
}//