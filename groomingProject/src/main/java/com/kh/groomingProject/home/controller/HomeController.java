package com.kh.groomingProject.home.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.home.model.service.HomeService;
import com.kh.groomingProject.home.model.vo.HomeBoard;


@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;
	
	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mv) {
		
		ArrayList<HomeBoard> hBoardList = homeService.getBoardTopList();
		
		System.out.println("홈 탑 게시글 : " + hBoardList);
		
		
		mv.addObject("hBoardList", hBoardList)
		.setViewName("home");
		
		return mv;
	}

}
