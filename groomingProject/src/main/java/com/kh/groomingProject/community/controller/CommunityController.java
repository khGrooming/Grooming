package com.kh.groomingProject.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("communityNotice.do")
	public String communityNotice() {
			return "community/communityNotice";
	}
	
	@RequestMapping("noticeInsertView.do")
	public String noticeInsertView() {
		return "community/noticeInsertView";
	}
	
	@RequestMapping("communityFreeBoard.do")
	public String communityFreeBoard() {
		return "community/communityFreeBoard";
	}
	
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
