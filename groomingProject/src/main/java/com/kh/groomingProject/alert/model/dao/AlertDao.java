package com.kh.groomingProject.alert.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.MemberAlert;

@Repository("alertDao")
public class AlertDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertAlert(MemberAlert memberAlert) {

		return sqlSessionTemplate.insert("alertMapper.insertAlert", memberAlert);
	}

}
