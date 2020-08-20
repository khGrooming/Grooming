package com.kh.groomingProject.alert.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.alert.model.dao.AlertDao;
import com.kh.groomingProject.alert.model.vo.Alert;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberAlert;

@Service("alertService")
public class AlertServiceImpl implements AlertService {

	@Autowired
	private AlertDao alertDao;

	@Override
	public int insertAlert(MemberAlert memberAlert) {

		return alertDao.insertAlert(memberAlert);
	}
	
	@Override
	public int getUserAlertCount(Member m) {

		return alertDao.getUserAlertCount(m);
	}

	@Override
	public ArrayList<Alert> getUserAlert(Member m) {

		return alertDao.getUserAlert(m);
	}

	@Override
	public int readUserAlert(String alertNo) {

		return alertDao.readUserAlert(alertNo);
	}

}
