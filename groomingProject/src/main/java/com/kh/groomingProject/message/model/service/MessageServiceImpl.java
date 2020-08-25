package com.kh.groomingProject.message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.dao.MessageDao;
import com.kh.groomingProject.message.model.vo.Message;

@Service("msgService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao msgDao;

	@Override
	public int getUserMessagesCount(Member m) {

		return msgDao.getUserMessagesCount(m);
	}

	@Override
	public ArrayList<Message> getUserMessage(Member m) {

		return msgDao.getUserMessage(m);
	}

	@Override
	public int readUserMessage(String messageNo) {

		return msgDao.readUserMessage(messageNo);
	}

	@Override
	public ArrayList<Message> getUserMessageList(Member m) {

		return msgDao.getUserMessageList(m);
	}
}
