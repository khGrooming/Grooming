package com.kh.groomingProject.grooming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GroomingController {

	@RequestMapping("groomingMain.do")
	public String groomingMain() {
		return "grooming/groomingMain";
	}
	
	@RequestMapping("groupPage.do")	
	public String groupPage() {
		return "grooming/groupPage";
	}
	
	@RequestMapping("groupBoardInsertForm.do")	
	public String groupBoardInsertForm() {
		return "grooming/groupBoardInsertForm";
	}
}
