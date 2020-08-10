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
	
	@RequestMapping("community.do")
	public String community() {
		return "community/mainCommunityForm";
		// 헤더 nav-bar에서 '커뮤니티'를 클릭했을때 mainCommunityForm.jsp로 보내자
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
		// communityFreeBoard.jsp로 이동
	}
	
	@RequestMapping("communityStudyPromotion.do")
	public String communityStudyPromotion() {
		return "community/communityStudyPromotion";
		// communityStudyPromotion.jsp로 이동
	}
	
	@RequestMapping("communityStudyConfirm.do")
	public String communityStudyConfirm() {
		return "community/communityStudyConfirm";
		// communityStudyConfirm.jsp로 이동
	}
	
	@RequestMapping("communityQnA.do")
	public String communityQnA() {
		return "community/communityQnA";
		// communityQnA.jsp로 이동
	}
}
