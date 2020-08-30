package com.kh.groomingProject.home.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.home.model.exception.HomeException;
import com.kh.groomingProject.home.model.service.HomeService;
import com.kh.groomingProject.home.model.vo.HomeBoard;
import com.kh.groomingProject.home.model.vo.HomeGrooming;
import com.kh.groomingProject.home.model.vo.HomePageInfo;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberCertiCode;
import com.kh.groomingProject.message.model.vo.Message;

import static com.kh.groomingProject.common.HomePagination.getPageInfo;

@SessionAttributes("loginUser")
@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping("home.do")
	public ModelAndView home(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		
		ArrayList<HomeBoard> hBoardList = homeService.getBoardTopList();
		
		System.out.println("홈 탑 게시글 : " + hBoardList);
		
		ArrayList<HomeGrooming> gMList = homeService.getGMentoTopList();
		
		System.out.println("홈 탑 멘토 그루밍 : " + gMList);
		
		ArrayList<HomeGrooming> gPList = homeService.getGPopulTopList();
		
		System.out.println("홈 탑 인기 그루밍 : " + gPList);
		
		ArrayList<HomeGrooming> gDList = homeService.getGDeadlineTopList();
		
		System.out.println("홈 탑 마감임박 그루밍 : " + gDList);

		// 페이징 관련 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		ArrayList<HomeGrooming> gAList = getAllGroomingList(currentPage);

		if(gMList != null && gPList != null && gDList != null && gAList != null) {
			mv.addObject("hBoardList", hBoardList)
			.addObject("gMList", gMList)
			.addObject("gPList", gPList)
			.addObject("gDList", gDList)
			.addObject("gAList", gAList)
			.setViewName("home");
		} else {
			throw new HomeException("전체 조회 실패!");
		}
		return mv;
	}

	public ArrayList<HomeGrooming> getAllGroomingList(int currentPage) {

		int listCount = homeService.getGListCount();

		System.out.println("전체 그루밍 : " + listCount);
		
		int boardLimit = 8;

		HomePageInfo pi = getPageInfo(currentPage, listCount, boardLimit);

		ArrayList<HomeGrooming> gAList = homeService.getGroomingList(pi);

		return gAList;

	}
	
	@RequestMapping("addAllGroomingList.do")
	public void getAllGroomingList(HttpServletResponse response
			, @RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {

		System.out.println("메시지 리스트 확인 :" + page);

		// 페이징 관련 처리
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		ArrayList<HomeGrooming> gAList = getAllGroomingList(currentPage);

		response.setContentType("application/json;charset=utf-8");

		new Gson().toJson(gAList, response.getWriter());

	}

	// 문의 메일 보내기
	@RequestMapping("siteQuestion.do")
	@ResponseBody
	public String sendCertiMail(String footer_qModal_email, String footer_qModal_content) {
		System.out.println("문의 메일 전송 : " + footer_qModal_email + " 내용 : " + footer_qModal_content);

		String mailFrom = "onebunonecho@gmail.com";
		String mailTo = "onebunonecho@gmail.com";
		String mailTitle = footer_qModal_email + " 님의 문의 입니다.";
		String mailContent = "<div marginwidth=\"0\" marginheight=\"0\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\"\r\n" + 
				"style=\"width:100%;background-color:#f8f8f9;letter-spacing:-1px\" align=\"center\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr>\r\n" + 
				"<td align=\"center\">\r\n" + 
				"<div style=\"max-width:595px;margin:0 auto\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width:595px;width:100%;font-family:'\\00b098\\00b214\\00ace0\\00b515',NanumGothic,'\\00b9d1\\00c740\\00ace0\\00b515',Malgun Gothic,'\\00b3cb\\00c6c0',Dotum,Helvetica,'Apple SD Gothic Neo',Sans-serif;background-color:#fff;text-align:left\" align=\"center\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr><td height=\"30\"></td></tr>\r\n" + 
				"<tr><td style=\"padding-right:27px;padding-left:21px\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr><td style=\"padding-right:5px;line-height:34px;font-size:29px;color:#424240;font-family:NanumGothic\">Grooming</td>\r\n" + 
				"<td style=\"vertical-align:bottom;font-size:14px;color:#696969;line-height:13px;font-family:NanumGothic\">문의</td></tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr><td height=\"13\"></td></tr>\r\n" + 
				"<tr><td height=\"1\" style=\"background-color:#e5e5e5\"></td></tr><tr>\r\n" + 
				"<td style=\"padding-top:24px;padding-right:27px;padding-bottom:32px;padding-left:20px\">\r\n" + 
				"<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" width=\"100%\">\r\n" + 
				"<tbody>\r\n" + 
				"<tr>\r\n" + 
				"<td style=\"font-size:14px;color:#696969;line-height:24px;font-family:NanumGothic\">" + footer_qModal_email+ " 님의 문의 입니다.</td>\r\n" + 
				"<td style=\"font-size:14px;color:#696969;line-height:24px;font-family:NanumGothic\">" + footer_qModal_content+ "</td>\r\n" + 
				"</tr>\r\n" + 
				"<tr><td height=\"24\"></td></tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</div>\r\n" + 
				"</td>\r\n" + 
				"</tr>\r\n" + 
				"</tbody>\r\n" + 
				"</table>\r\n" + 
				"</div>";

		final MimeMessagePreparator mmp = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(mailFrom);
				helper.setTo(mailTo);
				helper.setSubject(mailTitle);
				helper.setText(mailContent, true);
			}
		};
		mailSender.send(mmp);

		return "success";

	}
	
}
