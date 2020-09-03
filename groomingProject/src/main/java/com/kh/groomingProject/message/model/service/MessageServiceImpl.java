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

	@Override
	public int readChat(Message me) {

		return msgDao.readChat(me);
	}

	@Override
	public ArrayList<Message> loadChat(Message me) {

		return msgDao.loadChat(me);
	}

	@Override
	public int sendChat(Message me) {

		return msgDao.sendChat(me);
	}

	@Override
	public ArrayList<Message> loadChatList(Member m) {

		return msgDao.loadChatList(m);
	}

}
