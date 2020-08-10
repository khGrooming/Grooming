package com.kh.groomingProject.grooming.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.grooming.model.service.GroomingService;
import com.kh.groomingProject.grooming.model.vo.Grooming;

@Controller
public class GroomingController {

	@Autowired
	GroomingService gService;
	
//	그루밍 메인 출력
	@RequestMapping("groomingMain.do")
	public ModelAndView groomingList(ModelAndView mv) {
		
		ArrayList<Grooming> list = gService.selectList();
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("grooming/groomingMain");
		}else {
			throw new GroomingException("게시글 전체 조회 실패!");
		}
		return mv;
	}
// 그루밍 메인 (멘토 타입 필터) 출력
	@RequestMapping("groomingMe.do")
	public ModelAndView groomingMentorList(ModelAndView mv) {
		
		ArrayList<Grooming> list = gService.selectMentorList();
		
		if(list != null) {
			mv.addObject("list",list);
			mv.setViewName("grooming/groomingMain");
		}else {
			throw new GroomingException("게시글 전체 조회 실패!");
		}
		return mv;
	}
// 그루밍 메인 (멘토 타입 필터) 출력	

	
	
	
	@RequestMapping("groupPage.do")	
	public String groupPage() {
		return "grooming/groupPage";
	}
	
	
	
	@RequestMapping("groupBoardInsertForm.do")	
	public String groupBoardInsertForm() {
		return "grooming/groupBoardInsertForm";
	}
	
	
	@RequestMapping("groupdetail.do")	
	public String groupBoardDetailView() {
		return "grooming/groupBoardDetailView";
	}
	
	@RequestMapping("groomingInsertForm.do")	
	public String groomingInsertForm() {
		return "grooming/groomingInsertForm";
	}
	@RequestMapping("groomingDetail.do")	
	public String groomingDetailView() {
		return "grooming/groomingDetailView";
	}
	
}
