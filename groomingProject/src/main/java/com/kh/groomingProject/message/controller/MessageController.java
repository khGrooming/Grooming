package com.kh.groomingProject.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.alert.model.vo.Alert;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.service.MessageService;
import com.kh.groomingProject.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	// 메시지 페이지 이동
	@RequestMapping("messagePage.do")
	public ModelAndView loginPage(ModelAndView mv, Member m) {
		
		ArrayList<Message> mList = msgService.getUserMessageList(m);
		
		
		mv.addObject("mList", mList)
		.setViewName("message/messagePage");
		
		return mv;
	}
	
	@RequestMapping("getUserMessagesCount.do")
	@ResponseBody
	public String getUserMessagesCount(HttpServletResponse response, Member m) {
	
		System.out.println("메시지 확인 : " + m.getMemberNo());
		
		int mCount = msgService.getUserMessagesCount(m);
		
		System.out.println("메시지카운트 : " + mCount);
		
		String result = Integer.toString(mCount);
		
		if(mCount >= 10) {
			result = "9+";
		}
		
		return result;
	}
	
	@RequestMapping("getUserMessage.do")
	public void getUserMessage(HttpServletResponse response,Member m) throws JsonIOException, IOException {
		
		System.out.println("메시지 리스트 확인 :" + m.getMemberNo());

		ArrayList<Message> mList = msgService.getUserMessage(m);

		System.out.println("메시지 리스트 : " + mList);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		gson.toJson(mList, response.getWriter());
		
	}

	@RequestMapping("readUserMessage.do")
	public void readUserMessage(HttpServletResponse response,Member m, String messageNo) throws JsonIOException, IOException {
		
		System.out.println("메시지 읽음 : " + messageNo);
		
		int result = msgService.readUserMessage(messageNo);
		
		System.out.println("메시지 읽음 확인 : " + result);

		ArrayList<Message> mList = msgService.getUserMessage(m);

		System.out.println("메시지 확인 리스트 : " + mList);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd'T'HH:mm:ss").create();
		gson.toJson(mList, response.getWriter());
		
	}

}
