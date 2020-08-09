package com.kh.groomingProject.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.groomingProject.member.model.exception.MemberException;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//TODO �α��� or ȸ������ �� ���� ������ ���� �ϴ� ��...
	public String checkPage(String pageHistory) {
		String result = "";
		if(pageHistory != null) {
			result = pageHistory;
		}
		
		return result;
	}
	@RequestMapping("loginPage.do")
	public ModelAndView loginPage(ModelAndView mv, HttpServletRequest request) {
		
		System.out.println("request.getParameter(\"pageHistory\") : " + request.getParameter("pageHistory"));
		
		String pageHistory = checkPage(request.getParameter("pageHistory"));
		
		mv.addObject("pageHistory", pageHistory)
		.addObject("loginCheck", "login")
		.setViewName("member/memberLoginRegistration");
		
		return mv;
	}
	
	@RequestMapping("registerPage.do")
	public ModelAndView registerPage(ModelAndView mv, String pageHistory) {
		
		String result = checkPage(pageHistory);
		
		mv.addObject("pageName", result)
		.addObject("loginCheck", "register")
		.setViewName("member/memberLoginRegistration");
		
		return mv;
	}
	
	@RequestMapping("memberInsert.do")
	public String memberInsert(Member m) {
		
		System.out.println("memberInsert : " + m);
		
		String emcPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(emcPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "home";
		} else {
			throw new MemberException("ȸ�� ���� ����!");
		}
		
	}

//	@RequestMapping("memberLogin.do")
//	public String memberLogin(Member m, Model model) {
//		
//		System.out.println("memberLogin : " + m);
//		
//		Member loginUser = mService.loginMember(m);
//		
//		if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
//			model.addAttribute("loginUser", loginUser);
//			return "home";
//		} else {
//			throw new MemberException("�α��� ����!");
//		}
//		
//	}

	@RequestMapping("memberLogin.do")
	@ResponseBody
	public String memberLogin(Member m, Model model) {
		
		System.out.println("memberLogin : " + m);
		
		Member loginUser = mService.loginMember(m);
		
		if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			System.out.println("��� Ȯ�� : ����");
			model.addAttribute("loginUser", loginUser);
			return "success";
		} else {
			System.out.println("��� Ȯ�� : ����");
			// throw new MemberException("�α��� ����!");
			return "fail";
		}
		
	}
	
	@RequestMapping("logout.do")
	public String logout(SessionStatus status){
		status.setComplete();

		return "home";
		
	}
	
	@RequestMapping("emailDuplicateChk.do")
	@ResponseBody
	public String emailDuplicateChk(Member m) {
		
		System.out.println("�̸��� �ߺ� Ȯ�� : " + m.getMemberEmail());
		
		int result = mService.emailDuplicateChk(m);
		
		if(result == 0) {
			System.out.println("�̸��� �ߺ� Ȯ�� : " + m.getMemberEmail() + "( ��밡�� )");
			return "success";
		} else {
			System.out.println("�̸��� �ߺ� Ȯ�� : " + m.getMemberEmail() + "( ��� �� )");
			// throw new MemberException("�α��� ����!");
			return "fail";
		}

	}
	
}
