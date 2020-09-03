package com.kh.groomingProject.alert.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping("getUserAlertCount.do")
	@ResponseBody
	public String getUserAlertCount(HttpServletResponse response,Member m) {
	
		System.out.println("알림 확인 : " + m.getMemberNo());
		
		int aCount = alertService.getUserAlertCount(m);
		
		System.out.println("알림 카운트 : " + aCount);
		
		String result = Integer.toString(aCount);
		
		if(aCount >= 10) {
			result = "9+";
		}
		
		return result;

	}

	@RequestMapping("getUserAlert.do")
	public void getUserAlert(HttpServletResponse response,Member m) throws JsonIOException, IOException {
		
		System.out.println("알림 리스트 확인 : " + m.getMemberNo());

		ArrayList<Alert> aList = alertService.getUserAlert(m);

		System.out.println("알림 리스트 : " + aList);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd HH:mm:ss").create();
		gson.toJson(aList, response.getWriter());
		
	}

	@RequestMapping("readUserAlert.do")
	public void readUserAlert(HttpServletResponse response,Member m, String alertNo) throws JsonIOException, IOException {
		
		System.out.println("알림 읽음 : " + alertNo);
		
		int result = alertService.readUserAlert(alertNo);
		
		System.out.println("알림 읽음 확인 : " + result);

		ArrayList<Alert> aList = alertService.getUserAlert(m);

		System.out.println("알림 확인 리스트 : " + aList);

		response.setContentType("application/json;charset=utf-8");

		Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd'T'HH:mm:ss").create();
		gson.toJson(aList, response.getWriter());
		
	}
	
}
