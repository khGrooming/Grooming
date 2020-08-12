package com.kh.groomingProject.grooming.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

@Controller
public class GroomingController {

	@Autowired
	GroomingService gService;
	
//	�׷�� ���� ���
	@RequestMapping("groomingMain.do")
	public ModelAndView groomingList(ModelAndView mv) {
		
		ArrayList<Grooming> glist = gService.selectList();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		if(glist != null) {
			mv.addObject("glist",glist);
			mv.setViewName("grooming/groomingMain");
		}else {
			throw new GroomingException("�Խñ� ��ü ��ȸ ����!");
		}
		return mv;
	}
// �׷�� ���� (���� Ÿ�� ����) ���
	@RequestMapping("groomingMe.do")
	public void groomingMentorList(HttpServletResponse response) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMentorList();
		
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}
	
// �׷�� ���� (��ġ�� Ÿ�� ����) ���	
	@RequestMapping("groomingMo.do")
	public void groomingMoneyList(HttpServletResponse response)throws JsonIOException, IOException {
	
		response.setContentType("application/json; charset=utf-8");

		ArrayList<Grooming> glist = gService.selectMoneyList();
		
	
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(glist,response.getWriter());
	}

	// �˻�
	@RequestMapping("search.do")	
	public void gSearchWriter(HttpServletResponse response, String search, String keyword) throws JsonIOException, IOException {
		response.setContentType("application/json; charset=utf-8");

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
		System.out.println("�˻� ���� : " +search);
		System.out.println("�˻� ���� : " +keyword);
		System.out.println("�˻��� ����Ʈ : " +glist);
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
	
	@RequestMapping("groomingDetail.do")	
	public ModelAndView groomingDetailView(ModelAndView mv, String groomingNo) {
		
		int result = gService.addReadCount(groomingNo);
		System.out.println(result);
		if(result >0) {
			ArrayList<Grooming> grooming = gService.selectGrooming(groomingNo);
//			Grooming grooming = gService.selectGrooming(groomingNo);
			if(grooming != null) {
				mv.addObject("grooming",grooming)
				.setViewName("grooming/groomingDetailView");
			}else {
				throw new GroomingException("�׷�� �Խñ� ��ȸ ����!");
			}
			
			
			
			
		}else {
			throw new GroomingException("�׷�� �Խñ� ��ȸ�� ���� ����!");
		}
		
		
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}






