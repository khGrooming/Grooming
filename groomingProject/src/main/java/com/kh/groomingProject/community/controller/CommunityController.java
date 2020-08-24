package com.kh.groomingProject.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.community.model.exception.CommunityException;
import com.kh.groomingProject.community.model.service.CommunityService;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.member.model.vo.Member;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService cService;
	
	@RequestMapping(value= {"communityMain.do","communityNotice.do","communityFreeBoard.do","communityStudyPromotion.do",
							"communityStudyConfirm.do","communityQnA.do"})
	public ModelAndView communityMain(HttpServletRequest request, ModelAndView mav, String bCategoryNo) {
		if((request.getServletPath().equals("/communityMain.do"))) {
			ArrayList<Board> list = cService.selectList(bCategoryNo);
			mav.addObject("list", list);
			mav.setViewName("community/communityMain");
			
		}else if(request.getServletPath().equals("/communityNotice.do")){
			ArrayList<Board> nlist = cService.selectList(bCategoryNo);
			mav.addObject("nlist", nlist);
			mav.setViewName("community/communityNotice");
			
		}else if(request.getServletPath().equals("/communityFreeBoard.do")){
			ArrayList<Board> flist = cService.selectList(bCategoryNo);
			mav.addObject("flist", flist);
			mav.setViewName("community/communityFreeBoard");
			
		}else if(request.getServletPath().equals("/communityStudyPromotion.do")){
			ArrayList<Board> plist = cService.selectList(bCategoryNo);
			mav.addObject("plist", plist);
			mav.setViewName("community/communityStudyPromotion");
			
		}else if(request.getServletPath().equals("/communityQnA.do")){
			ArrayList<Board> qlist = cService.selectList(bCategoryNo);
			mav.addObject("qlist", qlist);
			mav.setViewName("community/communityQnA");
			
		}else{
			throw new CommunityException("전체 화면 조회 실패!");
		}
		return mav;
	}
	// -------------------------------------------------------------------------------------
	
	@RequestMapping("communityDetailView.do")
	public String communityDetailView(Model model, String boardNo, Board b) {
		b = cService.selectOne(boardNo); 
		
		int result = cService.addViewCount(boardNo);
		
		if(b != null) { 
			model.addAttribute("board", b); 
		}else { 
			throw new CommunityException("게시물 상세 보기 실패!"); 
		} 
			return "community/communityDetailView";
		}	
	// -------------------------------------------------------------------------------------
		@RequestMapping("communityInsertView.do") 
		public String communityInsertView(String bCategoryNo, Model model) {
			if(bCategoryNo != null) {
				model.addAttribute("bCategoryNo", bCategoryNo);
			}	
			return "community/communityInsertView"; 
		}
		 
		@RequestMapping(value="communityInsert.do", method=RequestMethod.POST) 
		public String communityInsert(HttpServletRequest request, Board b) { 
			Member member = (Member)request.getSession().getAttribute("loginUser");
						
			int result = cService.communityInsert(b, member);
			
			if(result > 0) { 
				return "redirect:communityMain.do"; 
			}else { 
				throw new CommunityException("게시물 등록 실패!"); 
			} 
		}
	// -------------------------------------------------------------------------------------
		@RequestMapping("communityUpdateView.do") 
		public String communityUpdateView(String boardNo, Model model, String bCategoryNo) { 
			model.addAttribute("board", cService.selectOne(boardNo));
			return "community/communityUpdateView"; 
		}
		
		@RequestMapping(value="communityUpdate.do", method=RequestMethod.POST)
		public String communityUpdate(HttpServletRequest request, Board b) {
			System.out.println("컨트롤" + b);
			Member member = (Member)request.getSession().getAttribute("loginUser");
			int result = cService.communityUpdate(b, member);
			
			if(result > 0) { 
				return "redirect:communityMain.do"; 
			}else { 
				throw new CommunityException("게시물 수정 실패!"); 
			} 
		}
	// -------------------------------------------------------------------------------------
		@RequestMapping("communityDelete.do")
		public String communityDelete(String boardNo, HttpServletRequest request) { 
			Board b = cService.selectOne(boardNo);
		
			int result = cService.communityDelete(boardNo);
				 
			if(result > 0) { 
				return "redirect:communityMain.do"; 
			}else { 
				throw new CommunityException("게시물 삭제 실패!"); 
			} 
		}
		
	// -------------------------------------------------------------------------------------		
}
