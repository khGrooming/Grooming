package com.kh.groomingProject.alert.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.alert.model.vo.Alert;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberAlert;

public interface AlertService {

	int insertAlert(MemberAlert memberAlert);

	ArrayList<Alert> getUserAlert(Member m);

}
