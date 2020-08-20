package com.kh.groomingProject.message.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.Member;

@Repository("msgDao")
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getUserMessagesCount(Member m) {

		return sqlSessionTemplate.selectOne("messageMapper.getUserMessagesCount",m);
	}
}
