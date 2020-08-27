package com.kh.groomingProject.message.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class Message implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3508906481942866735L;

	private String messageNo;			// 메시지 번호
	private String fromMemberNo;		// 보낸사람 번호
	private String fromMemberNickname;	// 보낸사람 닉네임
	private String fromMemberPhoto;		// 보낸사람 프로필 사진
	private String toMemberNo;			// 받는사람 번호
	private String toMemberNickname;	// 받는사람 닉네임
	private String toMemberPhoto;		// 받는사람 프로필 사진
	private String messageContent;		// 메시지 내용
	private Timestamp messageDate;		// 메시지 생성일
	private String messageConfirm;		// 메시지 확인 유무

	public Message() {
		super();
	}
	public Message(String messageNo, String fromMemberNo, String fromMemberNickname, String fromMemberPhoto,
			String toMemberNo, String toMemberNickname, String toMemberPhoto, String messageContent, Timestamp messageDate,
			String messageConfirm) {
		super();
		this.messageNo = messageNo;
		this.fromMemberNo = fromMemberNo;
		this.fromMemberNickname = fromMemberNickname;
		this.fromMemberPhoto = fromMemberPhoto;
		this.toMemberNo = toMemberNo;
		this.toMemberNickname = toMemberNickname;
		this.toMemberPhoto = toMemberPhoto;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		this.messageConfirm = messageConfirm;
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
	public String getFromMemberPhoto() {
		return fromMemberPhoto;
	}
	public void setFromMemberPhoto(String fromMemberPhoto) {
		this.fromMemberPhoto = fromMemberPhoto;
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
	public String getToMemberPhoto() {
		return toMemberPhoto;
	}
	public void setToMemberPhoto(String toMemberPhoto) {
		this.toMemberPhoto = toMemberPhoto;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Timestamp getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Timestamp messageDate) {
		this.messageDate = messageDate;
	}
	public String getMessageConfirm() {
		return messageConfirm;
	}
	public void setMessageConfirm(String messageConfirm) {
		this.messageConfirm = messageConfirm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", fromMemberNo=" + fromMemberNo + ", fromMemberNickname="
				+ fromMemberNickname + ", fromMemberPhoto=" + fromMemberPhoto + ", toMemberNo=" + toMemberNo
				+ ", toMemberNickname=" + toMemberNickname + ", toMemberPhoto=" + toMemberPhoto + ", messageContent="
				+ messageContent + ", messageDate=" + messageDate + ", messageConfirm=" + messageConfirm + "]";
	}

}
