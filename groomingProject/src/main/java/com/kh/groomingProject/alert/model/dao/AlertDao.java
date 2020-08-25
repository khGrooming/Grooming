package com.kh.groomingProject.alert.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.alert.model.vo.Alert;
import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.member.model.vo.MemberAlert;

@Repository("alertDao")
public class AlertDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertAlert(MemberAlert memberAlert) {

		return sqlSessionTemplate.insert("alertMapper.insertAlert", memberAlert);
	}

	public int getUserAlertCount(Member m) {
		
		return sqlSessionTemplate.selectOne("alertMapper.getUserAlertCount", m);
	}

	public ArrayList<Alert> getUserAlert(Member m) {

		return (ArrayList)sqlSessionTemplate.selectList("alertMapper.getUserAlert", m);
	}

	public int readUserAlert(String alertNo) {

		return sqlSessionTemplate.update("alertMapper.readUserAlert", alertNo);
	}


}
