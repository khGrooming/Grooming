package com.kh.groomingProject.admin.controller;

import static com.kh.groomingProject.common.AdminPagination.getPageInfo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.admin.model.exception.AdminException;
import com.kh.groomingProject.admin.model.service.AdminService;
import com.kh.groomingProject.admin.model.vo.DeclarationManageView;
import com.kh.groomingProject.admin.model.vo.GroomingManageView;
import com.kh.groomingProject.admin.model.vo.MemberManageView;
import com.kh.groomingProject.admin.model.vo.MentoManageView;
import com.kh.groomingProject.common.AdminPageInfo;
import com.kh.groomingProject.studyCafe.model.service.StudyCafeService;
import com.kh.groomingProject.studyCafe.model.vo.CafeInfo;
import com.kh.groomingProject.studyCafe.model.vo.Point;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	StudyCafeService studyCafeService;
	
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

		System.out.println("listCount : "+listCount);
		System.out.println("mNo : "+mNo);
		System.out.println("mentoList : "+mentoList);
		
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
	public ModelAndView groomingManage(ModelAndView mv, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) String category) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int gListCount = adminService.selectGroomingCount(category);
		
		AdminPageInfo pi = getPageInfo(currentPage, gListCount);
		
		ArrayList<GroomingManageView> glist = adminService.selectGroomingList(pi, category);
		
		mv.addObject("glist", glist);
		mv.setViewName("admin/groomingManage");
		
		return mv;
	}
	
	@RequestMapping("declarationManage.do")
	public ModelAndView declationManage(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		
		int dListCount = adminService.selectDeclarationCount();
		
		AdminPageInfo pi = getPageInfo(currentPage, dListCount);
		
		ArrayList<MemberManageView> dMemberList = adminService.selectDMemberCount();
		ArrayList<DeclarationManageView> dList = adminService.selectDeclarationList(dMemberList);
		
		ArrayList<MemberManageView> mList = adminService.selectDeclarationMember(pi, dMemberList);
		
		ArrayList<MemberManageView> dCount = adminService.selectDCount(dMemberList);
		ArrayList<MemberManageView> totalCount = adminService.selectTotalCount(dMemberList);

		mv.addObject("pi", pi);
		mv.addObject("dList", dList);
		mv.addObject("mList", mList);
		mv.addObject("dCount", dCount);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("admin/declarationManage");
		
		return mv;
	}
	
	@RequestMapping("cafeManage.do")
	public ModelAndView cafeManage(ModelAndView mv) {
		ArrayList<StudyCafe> cafeList = studyCafeService.selectCafeList();
		
		mv.addObject("cafeList", cafeList);
		mv.setViewName("admin/cafeManage");
		
		return mv;
	}
	
	@RequestMapping("cafeinfo.do")
	public void cafeDetail(HttpServletResponse response, CafeInfo cafe) throws JsonIOException, IOException {
		System.out.println(cafe);
		ArrayList<CafeInfo> info = studyCafeService.selectCafeInfo(cafe);
		System.out.println(info);
		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();;
		gson.toJson(info, response.getWriter());
	}
	
	@RequestMapping("cafeInfoChange.do")
	public ModelAndView cafeInfoChange(ModelAndView mv, CafeInfo cafe) {
		System.out.println(cafe);
		
		int result = adminService.cafeInfoChange(cafe);
		
		if(result > 0) {
			ArrayList<StudyCafe> cafeList = studyCafeService.selectCafeList();
			
			mv.addObject("cafeList", cafeList);
			mv.setViewName("admin/cafeManage");
			
			return mv;
		}else {
			throw new AdminException("카페 정보 변경 실패!");
		}
	}
	
	@RequestMapping("insertCafeInfo.do")
	public String insertCafeInfo(CafeInfo cafe) {
		System.out.println(cafe);
		
		int result = adminService.insertCafeInfo(cafe);
		
		return "redirect:cafeManage.do";
	}
}
