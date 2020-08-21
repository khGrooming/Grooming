package com.kh.groomingProject.admin.controller;

import static com.kh.groomingProject.common.AdminPagination.getPageInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.admin.model.exception.AdminException;
import com.kh.groomingProject.admin.model.service.AdminService;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("adminMain.do")
	public String goMain() {
		return "admin/adminMain";
	}
	
	// 회원 관리
	@RequestMapping("memberManage.do")
	public ModelAndView memberManage(ModelAndView mv,@RequestParam(value="category", required=false) String category ,@RequestParam(value="name", required=false) String name, @RequestParam(value="page", required=false) Integer page) {
		Map info = new HashMap();
		info.put("name", name);
		info.put("category", category);
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = adminService.memberList(info);
		
		AdminPageInfo pi = getPageInfo(currentPage, listCount);
		
		ArrayList<MemberManageView> list = adminService.selectList(pi, info);

		if(list != null) {
			mv.addObject("category", category);
			mv.addObject("name", name);
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("admin/memberManage");
		}else {
			throw new AdminException("회원 조회 실패!");
		}
		
		return mv;
	}
	
	// 포인트 지급 및 차감
	@RequestMapping("pointCalculation.do")
	public String pointCalculation(Point p) {
		
		if(Integer.valueOf(p.getAddPoint()) < 0) {
			p.setPointList("포인트 차감");
		}else {
			p.setPointList("포인트 지급");
		}
		
		int result = adminService.pointCalculation(p);
		
		if(result > 0) {
			return "redirect:memberManage.do";			
		}else {
			throw new AdminException("포인트 변경 실패!");
		}
		
	}
	
	@RequestMapping("mentoManage.do")
	public ModelAndView mentoManage(ModelAndView mv, @RequestParam(value="mpage", required=false) Integer mpage, @RequestParam(value="spage", required=false) Integer spage, String category, String searchMento) {

		int scurrentPage = 1;
		int mcurrentPage = 1;
		
		if(mpage != null) {
			mcurrentPage = mpage;
		}
		if(spage != null) {
			scurrentPage = spage;
		}

		int listCount = adminService.selectmentoCount(1);
		int spareCount = adminService.selectmentoCount(2);

		
		AdminPageInfo pi = getPageInfo(mcurrentPage, listCount);
		AdminPageInfo spi = getPageInfo(scurrentPage, spareCount);

		
		ArrayList<MemberManageView> mNo = adminService.selectNo(pi, 1);
		ArrayList<MemberManageView> sNo = adminService.selectNo(spi, 2);


		ArrayList<MentoManageView> mentoList = adminService.selectmentoList(mNo);
		ArrayList<MentoManageView> spareList = adminService.selectSpareMentoList(sNo);

		
		mv.addObject("pi", pi);
		mv.addObject("spi", spi);
		
		mv.addObject("mNo",mNo);
		mv.addObject("sNo", sNo);
		
		mv.addObject("mentoList", mentoList);
		mv.addObject("spareMentoList", spareList);
		
		mv.setViewName("admin/mentoManage");

		return mv;
	}
	

	@RequestMapping("groomingManage.do")
	public String groomingManage() {
		return "admin/groomingManage";
	}
	
	@RequestMapping("declarationManage.do")
	public String declationManage() {
		return "admin/declarationManage";
	}
	
	@RequestMapping("boardManage.do")
	public String boardManage() {
		return "admin/boardManage";
	}
}
