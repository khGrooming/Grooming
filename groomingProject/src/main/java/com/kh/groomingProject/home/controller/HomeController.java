package com.kh.groomingProject.home.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.home.model.exception.HomeException;
import com.kh.groomingProject.home.model.service.HomeService;
import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomePageInfo;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.vo.Message;

import static com.kh.groomingProject.common.HomePagination.getPageInfo;

@SessionAttributes("loginUser")
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

		System.out.println("전체 그루밍 : " + listCount);
		
		int boardLimit = 8;

		HomePageInfo pi = getPageInfo(currentPage, listCount, boardLimit);

		ArrayList<HomeGrooming> gAList = homeService.getGroomingList(pi);

		return gAList;

	}
	
	@RequestMapping("addAllGroomingList.do")
	public void getAllGroomingList(HttpServletResponse response
			, @RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {

		System.out.println("메시지 리스트 확인 :" + page);

		// 페이징 관련 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		ArrayList<HomeGrooming> gAList = getAllGroomingList(currentPage);

		response.setContentType("application/json;charset=utf-8");

		new Gson().toJson(gAList, response.getWriter());

	}

}
