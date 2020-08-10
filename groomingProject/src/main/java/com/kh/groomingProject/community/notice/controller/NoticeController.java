package com.kh.groomingProject.community.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.community.notice.model.service.NoticeService;
import com.kh.groomingProject.community.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping("nlist.do")
	public ModelAndView noticeList(ModelAndView mav) {
		ArrayList<Notice> list = nService.selectList();
		
		return null;
	}
	
	
}
