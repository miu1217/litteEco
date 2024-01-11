package com.kh.littleEco.about.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class aboutController {
	
	@GetMapping("about.ab")
	public String faqList() {
		return "about/about";
	}
	
}
