package com.kh.groomingProject.alert.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.alert.model.dao.AlertDao;
import com.kh.groomingProject.member.model.vo.MemberAlert;

@Service("alertService")
public class AlertServiceImpl implements AlertService {

	@Autowired
	private AlertDao alertDao;

	@Override
	public int insertAlert(MemberAlert memberAlert) {

		return alertDao.insertAlert(memberAlert);
	}

}
