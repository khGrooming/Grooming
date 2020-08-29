package com.kh.groomingProject.home.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.home.model.service.HomeService;
import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;


@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mv) {
		
		ArrayList<HomeBoard> hBoardList = homeService.getBoardTopList();
		
		System.out.println("홈 탑 게시글 : " + hBoardList);
		
		ArrayList<HomeGrooming> gMList = homeService.getGMentoTopList();
		
		System.out.println("홈 탑 멘토 그루밍 : " + gMList);
		
		ArrayList<HomeGrooming> gPList = homeService.getGPopulTopList();
		
		System.out.println("홈 탑 인기 그루밍 : " + gPList);
		
		ArrayList<HomeGrooming> gDList = homeService.getGDeadlineTopList();
		
		System.out.println("홈 탑 마감임박 그루밍 : " + gDList);

		// 올 그루밍은 페이지 네이션 필요

		
		mv.addObject("hBoardList", hBoardList)
		.addObject("gMList", gMList)
		.addObject("gPList", gPList)
		.addObject("gDList", gDList)
		.setViewName("home");
		
		return mv;
	}

}
