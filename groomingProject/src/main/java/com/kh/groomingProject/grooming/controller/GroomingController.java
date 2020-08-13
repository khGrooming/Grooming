package com.kh.groomingProject.grooming.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.grooming.model.exception.GroomingException;
import com.kh.groomingProject.grooming.model.service.GroomingService;
import com.kh.groomingProject.grooming.model.vo.Grooming;
import com.kh.groomingProject.grooming.model.vo.GroomingSpec;
import com.kh.groomingProject.grooming.model.vo.GroomingTag;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;

@Controller
public class GroomingController {

	@Autowired
	GroomingService gService;
	

//	메인으로 가기
	@RequestMapping("groomingMain.do")
	public ModelAndView groomingList(ModelAndView mv) {
		
		ArrayList<Grooming> glist = gService.selectList();
		
		
		if(glist != null) {
			mv.addObject("glist",glist);
			mv.setViewName("grooming/groomingMain");
		}else {
			throw new GroomingException("리스트 불러오기 실패!");
		}
		return mv;
	}
	
// 멘토 필터 적용
	@RequestMapping("groomingMe.do")
	public void groomingMentorList(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMentorList();
		
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}
	
// 예치금 필터 적용
	@RequestMapping("groomingMo.do")
	public void groomingMoneyList(HttpServletResponse response)throws JsonIOException, IOException {
	
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMoneyList();
		
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}

	// 검색
	@RequestMapping("search.do")	
	public void gSearchWriter(HttpServletResponse response, String search, String keyword) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist =  new ArrayList<>();
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

		System.out.println("gSearchWriter // search : " + search);
		System.out.println("gSearchWriter // keyword : " + keyword);
		System.out.println("gSearchWriter // glist : " + glist);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}
	
	
	
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
	
	// 그루밍 상세보기
	@RequestMapping("groomingDetail.do")	
	public ModelAndView groomingDetailView(ModelAndView mv, String groomingNo) {
		
		int result = gService.addReadCount(groomingNo);
		System.out.println(result);
		if(result >0) {
			Grooming grooming = gService.selectGrooming(groomingNo);

			ArrayList<GroomingTag> tag = gService.selectTag(groomingNo);
			ArrayList<GroomingSpec> spec = gService.selectSpec(groomingNo);
			Member member = gService.selectMember(groomingNo);
			System.out.println(member);
			if(grooming != null && tag != null && spec != null && member != null) {
				mv.addObject("grooming",grooming)
				.addObject("tag",tag)
				.addObject("spec",spec)
				.addObject("member",member)
				.setViewName("grooming/groomingDetailView");
			}else {
				throw new GroomingException("조회실패!");
			}
			
			
			
			
		}else {
			throw new GroomingException("게시글 조회수 증가 실패!");
		}
		
		
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

