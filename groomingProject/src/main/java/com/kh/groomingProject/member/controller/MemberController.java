package com.kh.groomingProject.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.groomingProject.member.model.exception.MemberException;
import com.kh.groomingProject.member.model.service.MemberService;
import com.kh.groomingProject.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired 
	private BCryptPasswordEncoder bcryptPasswordEncoder;


	@RequestMapping("memberInsert.do")
	public String memberInsert(Member m) {
		
		System.out.println("왔냐?" + m);
		String emcPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		
		m.setMemberPwd(emcPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			return "home";
		} else {
			throw new MemberException("회원 가입 실패!");
		}
		
	}

	
	
}
