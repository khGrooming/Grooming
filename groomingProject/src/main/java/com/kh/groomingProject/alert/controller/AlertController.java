package com.kh.groomingProject.alert.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.groomingProject.alert.model.service.AlertService;
import com.kh.groomingProject.alert.model.vo.Alert;
import com.kh.groomingProject.member.model.vo.Member;

@SessionAttributes("userAlert")
@Controller
public class AlertController {

	@Autowired
	private AlertService alertService;

	@RequestMapping("getUserAlert.do")
	public void getUserAlert(HttpServletResponse response,Member m) throws JsonIOException, IOException {
	
		System.out.println("알림 확인 : " + m.getMemberNo());
		
		ArrayList<Alert> aList = alertService.getUserAlert(m);
		
		System.out.println("알림 확인 리스트: " + aList);

		response.setContentType("application/json;charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm").create();
		gson.toJson(aList, response.getWriter());

	}
	
}
