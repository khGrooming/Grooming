package com.kh.groomingProject.home.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.home.model.exception.HomeException;
import com.kh.groomingProject.home.model.service.HomeService;
import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomePageInfo;

import static com.kh.groomingProject.common.HomePagination.getPageInfo;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		
		ArrayList<HomeBoard> hBoardList = homeService.getBoardTopList();
		
		System.out.println("홈 탑 게시글 : " + hBoardList);
		
		ArrayList<HomeGrooming> gMList = homeService.getGMentoTopList();
		
		System.out.println("홈 탑 멘토 그루밍 : " + gMList);
		
		ArrayList<HomeGrooming> gPList = homeService.getGPopulTopList();
		
		System.out.println("홈 탑 인기 그루밍 : " + gPList);
		
		ArrayList<HomeGrooming> gDList = homeService.getGDeadlineTopList();
		
		System.out.println("홈 탑 마감임박 그루밍 : " + gDList);

		// 페이징 관련 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		ArrayList<HomeGrooming> gAList = getAllGroomingList(currentPage);

		if(gMList != null && gPList != null && gDList != null && gAList != null) {
			mv.addObject("hBoardList", hBoardList)
			.addObject("gMList", gMList)
			.addObject("gPList", gPList)
			.addObject("gDList", gDList)
			.addObject("gAList", gAList)
			.setViewName("home");
		} else {
			throw new HomeException("전체 조회 실패!");
		}
		return mv;
	}

	public ArrayList<HomeGrooming> getAllGroomingList(int currentPage) {

		int listCount = homeService.getGListCount();

		int pageLimit = 8;

		HomePageInfo pi = getPageInfo(currentPage, listCount, pageLimit);

		ArrayList<HomeGrooming> gAList = homeService.getGroomingList(pi);

		return gAList;

	}

}
