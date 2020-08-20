package com.kh.groomingProject.message.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Message implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3508906481942866735L;

	private String messageNo;			// 메시지 번호
	private String fromMemberNo;		// 보낸사람 번호
	private String fromMemberNickname;	// 보낸사람 번호
	private String toMemberNo;			// 받는사람 번호
	private String toMemberNickname;	// 받는사람
	private String messageContent;		// 메시지 내용
	private Date messageDate;			// 메시지 생성일
	private String MessageConfirm;		// 메시지 확인 유무

	public Message() {
		super();
	}
	public Message(String messageNo, String fromMemberNo, String fromMemberNickname, String toMemberNo,
			String toMemberNickname, String messageContent, Date messageDate, String messageConfirm) {
		super();
		this.messageNo = messageNo;
		this.fromMemberNo = fromMemberNo;
		this.fromMemberNickname = fromMemberNickname;
		this.toMemberNo = toMemberNo;
		this.toMemberNickname = toMemberNickname;
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
	public String getFromMemberNickname() {
		return fromMemberNickname;
	}
	public void setFromMemberNickname(String fromMemberNickname) {
		this.fromMemberNickname = fromMemberNickname;
	}
	public String getToMemberNo() {
		return toMemberNo;
	}
	public void setToMemberNo(String toMemberNo) {
		this.toMemberNo = toMemberNo;
	}
	public String getToMemberNickname() {
		return toMemberNickname;
	}
	public void setToMemberNickname(String toMemberNickname) {
		this.toMemberNickname = toMemberNickname;
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
		return "ViewMessage [messageNo=" + messageNo + ", fromMemberNo=" + fromMemberNo + ", fromMemberNickname="
				+ fromMemberNickname + ", toMemberNo=" + toMemberNo + ", toMemberNickname=" + toMemberNickname
				+ ", messageContent=" + messageContent + ", messageDate=" + messageDate + ", MessageConfirm="
				+ MessageConfirm + "]";
	}

}
