package com.kh.littleEco.faqList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class faqlistController {
	
	@GetMapping("faqList.bo")
	public String faqList() {
		return "board/FAQ";
	}
	
}
