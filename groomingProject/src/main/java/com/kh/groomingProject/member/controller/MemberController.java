package com.kh.groomingProject.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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


	@RequestMapping("memberInsert.do")
	public String memberInsert(Member m) {
		
		System.out.println("memberInsert : " + m);
		
		String emcPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(emcPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "home";
		} else {
			throw new MemberException("회원 가입 실패!");
		}
		
	}

	@RequestMapping("memberLogin.do")
	public String memberLogin(Member m, Model model) {
		
		System.out.println("memberLogin : " + m);
		
		Member loginUser = mService.loginMember(m);
		
		if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "home";
		} else {
			throw new MemberException("로그인 실패!");
		}
		
	}
	
	
}
