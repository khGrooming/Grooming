package com.kh.groomingProject.message.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.dao.MessageDao;

@Service("msgService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao msgDao;

	@Override
	public int getUserMessagesCount(Member m) {

		return msgDao.getUserMessagesCount(m);
	}
}
