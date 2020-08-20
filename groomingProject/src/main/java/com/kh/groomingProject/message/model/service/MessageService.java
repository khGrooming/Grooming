package com.kh.groomingProject.message.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.vo.Message;

public interface MessageService {

	int getUserMessagesCount(Member m);

	ArrayList<Message> getUserMessage(Member m);

}
