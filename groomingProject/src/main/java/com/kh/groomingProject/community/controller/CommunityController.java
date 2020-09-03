package com.kh.groomingProject.community.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.community.model.exception.CommunityException;
import com.kh.groomingProject.community.model.service.CommunityService;
import com.kh.groomingProject.community.model.vo.Board;
import com.kh.groomingProject.community.model.vo.Reply;
import com.kh.groomingProject.member.model.vo.Member;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService cService;
	
	@RequestMapping(value= "communityMain.do")
	public ModelAndView communityMain(HttpServletRequest request, ModelAndView mav, String bCategoryNo) {
		String bCate = request.getParameter("bCategoryNo");
		
		System.out.println("파라미터 되니? : " + bCate);
		ArrayList<Board> list = cService.selectList(null);
		mav.addObject("list", list);
		
		ArrayList<Board> nlist = cService.selectList("BC00001");
		mav.addObject("nlist", nlist);
		
		ArrayList<Board> flist = cService.selectList("BC00002");
		mav.addObject("flist", flist);
		
		ArrayList<Board> plist = cService.selectList("BC00003");
		mav.addObject("plist", plist);
		
		ArrayList<Board> qlist = cService.selectList("BC00005");
		mav.addObject("qlist", qlist);
		
		mav.setViewName("community/communityMain");
		mav.addObject("bCategoryNo", bCate);
		return mav;
	}
	
	// -------------------------------------------------------------------------------------
	
	@RequestMapping("communityDetailView.do")
	public String communityDetailView(Model model, String boardNo) {
		Board b = cService.selectOne(boardNo); 
		ArrayList<Reply> replyList = cService.replySelectList(boardNo);
		
		int result = cService.addViewCount(boardNo);
		
		if(b != null) { 
			model.addAttribute("board", b); 
			model.addAttribute("replyList", replyList);
			
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
	public String communityInsert(HttpServletRequest request, Board b, Model model) { 
		Member member = (Member)request.getSession().getAttribute("loginUser");
					
		int result = cService.communityInsert(b, member);
//		model.addAttribute("bCategoryNo", b.getbCategoryNo());
		
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
		}else { 
			throw new CommunityException("게시물 등록 실패!"); 
		} 
	}
	
	// -------------------------------------------------------------------------------------	
		
	@RequestMapping(value="replyInsert.do", method=RequestMethod.POST) 
	public String replyInsert(HttpServletRequest request, Board b, Reply reply, Model model) { 
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		System.out.println("댓글" + reply);
		int result = cService.replyInsert(reply, member);
		
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
		}else { 
			throw new CommunityException("댓글 등록 실패!"); 
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
		Member member = (Member)request.getSession().getAttribute("loginUser");
		System.out.println("1 " + b);
		int result = cService.communityUpdate(b, member);
		System.out.println("2 " + b);
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo();  
		}else { 
			throw new CommunityException("게시물 수정 실패!"); 
		} 
	}

	// -------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	// -------------------------------------------------------------------------------------
	
	@RequestMapping("communityDelete.do")
	public String communityDelete(String boardNo, HttpServletRequest request) { 
		Board b = cService.selectOne(boardNo);
	
		int result = cService.communityDelete(boardNo);
			 
		if(result > 0) { 
			return "redirect:communityMain.do?bCategoryNo="+b.getbCategoryNo(); 
		}else { 
			throw new CommunityException("게시물 삭제 실패!"); 
		} 
	}
		
	// -------------------------------------------------------------------------------------	
		
	
}
