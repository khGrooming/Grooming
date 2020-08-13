package com.kh.groomingProject.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.community.model.exception.CommunityException;
import com.kh.groomingProject.community.model.service.CommunityService;
import com.kh.groomingProject.community.model.vo.Board;

@Controller
public class CommunityController {
	
	@Autowired
	CommunityService cService;
	
	@RequestMapping("communityMain.do")
	public String community() {
		return "community/mainCommunityForm";
	}
	
	////////////////////////////////// 공지 사항
	
	@RequestMapping("communityNotice.do")
	public ModelAndView communityNotice(ModelAndView mav) {
			ArrayList<Board> list = cService.selectList();
			
			if(!list.isEmpty()) {
				mav.addObject("list", list);
				mav.setViewName("community/communityNotice");
			}else {
				throw new CommunityException("공지사항 목록 보기 실패!");
			}
			return mav;
	}
	
	@RequestMapping("noticeInsertView.do")
	public String noticeInsertView() {
		return "community/noticeInsertForm";
	}
	
	@RequestMapping(value="noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(Board b, HttpServletRequest request) {
		int result = cService.noticeInsert(b);
		
		if(result > 0) {
			return "redirect:communityNotice.do";
		}else {
			throw new CommunityException("공지사항 등록 실패!");
		}
	}
	
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(Model model, String boardNo, Board b) {
		b = cService.selectOne(boardNo);
		int result = cService.addViewCount(boardNo);
		
		if(b != null) {
			model.addAttribute("board", b);
		}else {
			throw new CommunityException("공지사항 상세 보기 실패!");
		}
		return "community/noticeDetailView";
	}
	
	@RequestMapping("noticeUpdateView.do")
	public String noticeUpdateView(String boardNo, Model model) {
		model.addAttribute("board", cService.selectOne(boardNo));
		
		return "community/noticeUpdateView";
	}
	
	@RequestMapping(value="noticeUpdate.do", method=RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest request, Board b) {
		int result = cService.noticeUpdate(b);
		
		if(result > 0) {
			return "redirect:communityNotice.do";
		}else {
			throw new CommunityException("공지사항 수정 실패!");
		}
	}
	
	@RequestMapping("noticeDelete.do")
	public String noticeDelete(String boardNo, HttpServletRequest request) {
		Board b = cService.selectOne(boardNo);
		
		int result = cService.noticeDelete(boardNo);
		
		if(result > 0) {
			return "redirect:communityNotice.do";
		}else {
			throw new CommunityException("공지사항 삭제 실패!");
		}
	}
	
	
	//////////////////////////////////공지 사항
	///////////////////////////////// 자유 게시판
	
	@RequestMapping("communityFreeBoard.do")
	public ModelAndView communityFreeBoard(ModelAndView mav) {
		ArrayList<Board> list = cService.selectListFB();
		
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.setViewName("community/communityFreeBoard");
		}else {
			throw new CommunityException("자유게시판 목록 보기 실패!");
		}
		return mav;
	}
	
	@RequestMapping("FreeBoardDetail.do")
	public String FreeBoardDetail(Model model, String boardNo, Board b) {
		b = cService.selectOneFB(boardNo);
		int result = cService.addViewCount(boardNo);
		
		if(b != null) {
			model.addAttribute("board", b);
		}else {
			throw new CommunityException("자유게시판 상세 보기 실패!");
		}
		return "community/FreeBoardDetailView";
	}
	
	
	
	///////////////////////////////// 자유 게시판
	
	
	
	@RequestMapping("communityStudyPromotion.do")
	public String communityStudyPromotion() {
		return "community/communityStudyPromotion";
	}
	
	@RequestMapping("communityStudyConfirm.do")
	public String communityStudyConfirm() {
		return "community/communityStudyConfirm";
	}
	
	@RequestMapping("communityQnA.do")
	public String communityQnA() {
		return "community/communityQnA";
	}
}
