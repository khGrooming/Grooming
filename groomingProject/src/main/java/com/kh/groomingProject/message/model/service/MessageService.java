package com.kh.groomingProject.message.model.service;

import java.util.ArrayList;

import com.kh.groomingProject.member.model.vo.Member;
import com.kh.groomingProject.message.model.vo.Message;

public interface MessageService {

	int getUserMessagesCount(Member m);

	ArrayList<Message> getUserMessage(Member m);

	int readUserMessage(String messageNo);

	ArrayList<Message> getUserMessageList(Member m);

	ArrayList<Message> loadChat(Message me);

	int sendChat(Message me);

	ArrayList<Message> loadChatList(Member m);

	int readChat(Message me);

}
