package com.kh.groomingProject.message.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.vo.Message;

@Repository("msgDao")
public class MessageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int getUserMessagesCount(Member m) {

		return sqlSessionTemplate.selectOne("messageMapper.getUserMessagesCount",m);
	}

	public ArrayList<Message> getUserMessage(Member m) {

		return (ArrayList)sqlSessionTemplate.selectList("messageMapper.getUserMessage", m);
	}

	public int readUserMessage(String messageNo) {

		return sqlSessionTemplate.update("messageMapper.readUserMessage", messageNo);
	}

	public ArrayList<Message> getUserMessageList(Member m) {

		return (ArrayList)sqlSessionTemplate.selectList("messageMapper.getUserMessageList", m);
	}

	public ArrayList<Message> loadChat(Message me) {

		return (ArrayList)sqlSessionTemplate.selectList("messageMapper.loadChat", me);
	}
}
