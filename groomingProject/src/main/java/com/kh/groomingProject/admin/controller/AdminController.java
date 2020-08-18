package com.kh.groomingProject.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.groomingProject.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("adminMain.do")
	public String goMain() {
		return "admin/adminMain";
	}
	
	@RequestMapping("memberManage.do")
	public String memberManage() {
		return "admin/memberManage";
	}
	
	@RequestMapping("mentoManage.do")
	public String mentoManage() {
		return "admin/mentoManage";
	}
	

	@RequestMapping("groomingManage.do")
	public String groomingManage() {
		return "admin/groomingManage";
	}
	
	@RequestMapping("declarationManage.do")
	public String declationManage() {
		return "admin/declarationManage";
	}
	
	@RequestMapping("boardManage.do")
	public String boardManage() {
		return "admin/boardManage";
	}
}
