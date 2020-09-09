package com.kh.groomingProject.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.kh.groomingProject.admin.model.service.AdminService;
import com.kh.groomingProject.admin.model.vo.VisitCount;

public class VisitCounter implements HttpSessionListener{
	
	 @Override
     public void sessionCreated(HttpSessionEvent e){
         HttpSession session = e.getSession();
         WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
         //등록되어있는 빈을 사용할수 있도록 설정해준다
         HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
         //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
         VisitCountDAO visitCountDAO = (VisitCounterDAO)wac.getBean("visitCounterDAO");
         VisitCount vo = new VisitCount();
         vo.setVisit_ip(request.getRemoteAddr());
         vo.setVisit_agent(request.getHeader("User-Agent"));//브라우저 정보
         vo.setVisit_refer(request.getHeader("referer"));//접속 전 사이트 정보
         visitCountDAO.insertVisitor(vo);
         
     }
     @Override
     public void sessionDestroyed(HttpSessionEvent arg0){
         //TODO Auto-generated method stub
     }
    }