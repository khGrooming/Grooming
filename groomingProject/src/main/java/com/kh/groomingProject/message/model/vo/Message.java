package com.kh.groomingProject.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3492711911528126114L;

	private String messageNo;		// 메시지 번호
	private String fromMemberNo;	// 보낸사람
	private String toMemberNo;		// 받는사람
	private String messageContent;	// 메시지 내용
	private Date messageDate;		// 메시지 생성일
	private String MessageConfirm;	// 메시지 확인 유무

	public Message() {
		super();
	}
	public Message(String messageNo, String fromMemberNo, String toMemberNo, String messageContent, Date messageDate,
			String messageConfirm) {
		super();
		this.messageNo = messageNo;
		this.fromMemberNo = fromMemberNo;
		this.toMemberNo = toMemberNo;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		MessageConfirm = messageConfirm;
	}
	public String getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
	}
	public String getFromMemberNo() {
		return fromMemberNo;
	}
	public void setFromMemberNo(String fromMemberNo) {
		this.fromMemberNo = fromMemberNo;
	}
	public String getToMemberNo() {
		return toMemberNo;
	}
	public void setToMemberNo(String toMemberNo) {
		this.toMemberNo = toMemberNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageConfirm() {
		return MessageConfirm;
	}
	public void setMessageConfirm(String messageConfirm) {
		MessageConfirm = messageConfirm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", fromMemberNo=" + fromMemberNo + ", toMemberNo=" + toMemberNo
				+ ", messageContent=" + messageContent + ", messageDate=" + messageDate + ", MessageConfirm="
				+ MessageConfirm + "]";
	}

}
