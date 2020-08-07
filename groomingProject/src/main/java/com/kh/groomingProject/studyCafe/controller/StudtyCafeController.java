package com.kh.groomingProject.studyCafe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.kh.groomingProject.studyCafe.model.service.StudyCafeService;
import com.kh.groomingProject.studyCafe.model.vo.StudyCafe;

@Controller
public class StudtyCafeController {
	
	@Autowired
	StudyCafeService studyCafeService;
	
	@RequestMapping("searchMap.do")
	public String searchMap() {
		return "studyCafe/searchMap";
	}
	
	@RequestMapping("searchName.do")
	public String searchName() {
		return "studyCafe/searchName";
	}
	
	@RequestMapping(value="cafeName.do", method=RequestMethod.POST)
	public void getCafeNameList(String name, HttpServletResponse response) throws IOException {
		ArrayList<StudyCafe> list = new ArrayList<>();

		list = studyCafeService.selectCafeNameList(name);
		
		System.out.println(list);
		
		response.setContentType("application/json;charset=UTF-8");
		
		Gson gson = new Gson();
		gson.toJson(list, response.getWriter());
	}
	
	@RequestMapping("searchLocal.do")
	public String searchLocal() {
		return "studyCafe/searchLocal";
	}
}
