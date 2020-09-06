package com.kh.groomingProject.message.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.exception.MessageException;
import com.kh.groomingProject.message.model.service.MessageService;
import com.kh.groomingProject.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;

	@Autowired
	private MemberService mService;
	
	// 메시지 페이지 이동
	@RequestMapping("messagePage.do")
	public ModelAndView loginPage(ModelAndView mv, Member m) {
		System.out.println("메시지 페이지 접근 유저 : " + m.getMemberNo());
		
		ArrayList<Message> mList = msgService.getUserMessageList(m);
		
		System.out.println("메시지 페이지 대화 리스트 : " + mList);
		
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
	public void getUserMessage(HttpServletResponse response, Member m) throws JsonIOException, IOException {
		
		System.out.println("메시지 리스트 확인 :" + m.getMemberNo());

		ArrayList<Message> mList = msgService.getUserMessage(m);

		System.out.println("메시지 리스트 : " + mList);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		gson.toJson(mList, response.getWriter());
		
	}

	@RequestMapping("readUserMessage.do")
	public void readUserMessage(HttpServletResponse response, Member m, String messageNo) throws JsonIOException, IOException {
		
		System.out.println("메시지 읽음 : " + messageNo);
		
		int result = msgService.readUserMessage(messageNo);
		
		System.out.println("메시지 읽음 확인 : " + result);

		ArrayList<Message> mList = msgService.getUserMessage(m);

		System.out.println("메시지 확인 리스트 : " + mList);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create();
		gson.toJson(mList, response.getWriter());
		
	}

	@RequestMapping("loadChatList.do")
	public void loadChatList(HttpServletResponse response, Member m) throws JsonIOException, IOException {

		System.out.println("채팅 리스트 확인 유저번호 : " + m.getMemberNo());

		ArrayList<Message> mListI = msgService.loadChatList(m);
		ArrayList<Message> mListJ = new ArrayList<Message>();
		ArrayList<Message> mList = new ArrayList<Message>();

		mListJ.addAll(mListI);

		// 정리용 for문 (for문안에서 삭제가 가능한 Iterator)
		for(Iterator<Message> im = mListI.iterator(); im.hasNext();) {
			Message i = im.next();
			String iFmNo = i.getFromMemberNo();
			String iTmNo = i.getToMemberNo();
			Timestamp iTime = i.getMessageDate();

			// 비교용 for문
			for(Iterator<Message> jm = mListJ.iterator(); jm.hasNext(); ) {
				Message j = jm.next();
				String jFmNo = j.getFromMemberNo();
				String jTmNo = j.getToMemberNo();
				Timestamp jTime = j.getMessageDate();
				
				// 같은 채팅 인원의 시간 비교 후 리스트에 최근 메시지 시간 표시 용 데이터 정리
				if(jFmNo.equals(iTmNo) && jTmNo.equals(iFmNo)) {
					if(iTime.getTime() < jTime.getTime()) {
						//System.out.println("시간 비교 < : " + (iTime.getTime() < jTime.getTime()) + " / " + i.getMessageNo());
						im.remove();
						break;
					}
				}
			}
		}
		
		mList.addAll(mListI);
		
		System.out.println("채팅 리스트 확인 : " + mList);
				
		response.setContentType("application/json;charset=utf-8");
		
		// 앞단에서 시간 계산을 위해 ,로 구분
		Gson gson = new GsonBuilder().setDateFormat("yyyy,MM,dd,HH,mm,ss").create();
		gson.toJson(mList, response.getWriter());
		
	}

	@RequestMapping("loadChat.do")
	public void loadChat(HttpServletResponse response, Message me) throws JsonIOException, IOException {
		
		System.out.println("채팅 확인 유저번호 : " + me.getFromMemberNo() + "/" + me.getToMemberNo());
		
		int result = msgService.readChat(me);
		
		System.out.println("채팅 읽음 표시 결과 : " + result);

		ArrayList<Message> mList = msgService.loadChat(me);
		
		System.out.println("채팅  확인 : " + mList);
				
		response.setContentType("application/json;charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일,a hh시mm분").create();
		gson.toJson(mList, response.getWriter());
		
	}

	@RequestMapping("sendChat.do")
	@ResponseBody
	public String sendChat(HttpServletResponse response, Message me) throws JsonIOException, IOException {

		System.out.println("채팅 전송 : " + me);

		int result = msgService.sendChat(me);

		if(result > 0) {
			System.out.println("채팅 전송 : 성공");
			return "success";
		}
		System.out.println("채팅 전송 : 실패");
		return "fail";

	}

	@RequestMapping("createChatRoom.do")
	public void createChatRoom(HttpServletResponse response, Member m) throws JsonIOException, IOException {
		
		System.out.println("채팅 시작 유저번호 : " + m.getMemberNo());
		
		Member member = mService.findMember(m);
		
		Message message = new Message();
		if(member != null) {
			message.setFromMemberNickname(member.getMemberNickName());
			message.setFromMemberPhoto(member.getMemberPhoto());
			message.setFromMemberNo(member.getMemberNo());
		}
		
		response.setContentType("application/json;charset=utf-8");
		
		new Gson().toJson(message, response.getWriter());

	}

}
