package com.kh.groomingProject.grooming.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	// 검색
	@RequestMapping("search.do")	
	public ModelAndView gSearchWriter(ModelAndView mv, String search, String keyword) {
		ArrayList<Grooming> glist =  new ArrayList();
		if(search.equals("title")) {
			ArrayList<Grooming> list = gService.gSearchTitle(keyword);
			glist = list;
		}else if(search.equals("writer")) {
			ArrayList<Grooming> list = gService.gSearchWriter(keyword);
			glist = list;
		}else {
			ArrayList<Grooming> list = gService.gSearchContent(keyword);
			glist = list;
		}
		System.out.println("검색 유형 : " +search);
		System.out.println("검색 내용 : " +keyword);
		System.out.println("검색된 리스트 : " +glist);
	
		if(glist != null) {
		mv.addObject("glist",glist);
		mv.setViewName("grooming/groomingMain");
		}else {
			throw new GroomingException("작성자 검색 실패!");
		}
		
		
		return mv;
	}
	
	
	/*
	 * @RequestMapping("searchContent.do") public Model gSearchContent() { return
	 * "grooming/groupPage"; }
	 * 
	 * 
	 * @RequestMapping("searchTitle.do") public Model gSearchTitle() { return
	 * "grooming/groupPage"; }
	 */
	
	
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
