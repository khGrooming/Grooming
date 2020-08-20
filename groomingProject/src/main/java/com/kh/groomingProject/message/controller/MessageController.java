package com.kh.groomingProject.message.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonIOException;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	@RequestMapping("getUserMessagesCount.do")
	@ResponseBody
	public int getUserMessagesCount(HttpServletResponse response,Member m) throws JsonIOException, IOException {
	
		System.out.println("메시지 확인 : " + m.getMemberNo());
		
		int mCount = msgService.getUserMessagesCount(m);
		
		System.out.println("메시지카운트: " + mCount);
		
		return mCount;

	}
}
