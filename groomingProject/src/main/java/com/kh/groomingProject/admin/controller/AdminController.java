package com.kh.groomingProject.admin.controller;

import static com.kh.groomingProject.common.Pagination.getPageInfo;

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
import com.kh.groomingProject.common.PageInfo;
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
		
		PageInfo pi = getPageInfo(currentPage, listCount);
		
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
		System.out.println(p);
		int result = adminService.pointCalculation(p);
		
		if(result > 0) {
			return "redirect:memberManage.do";			
		}else {
			throw new AdminException("포인트 변경 실패!");
		}
		
	}
	
	@RequestMapping("mentoManage.do")
	public String mentoManage() {
		return "admin/mentoManage";
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
