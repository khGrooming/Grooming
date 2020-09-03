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
	private String fromMConfirm;		// 보낸 사람 메시지 확인 유무
	private String toMConfirm;			// 받은 사람 메시지 확인 유무

	public Message() {
		super();
	}
	public Message(String messageNo, String fromMemberNo, String fromMemberNickname, String fromMemberPhoto,
			String toMemberNo, String toMemberNickname, String toMemberPhoto, String messageContent,
			Timestamp messageDate, String fromMConfirm, String toMConfirm) {
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
		this.fromMConfirm = fromMConfirm;
		this.toMConfirm = toMConfirm;
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
	public String getFromMConfirm() {
		return fromMConfirm;
	}
	public void setFromMConfirm(String fromMConfirm) {
		this.fromMConfirm = fromMConfirm;
	}
	public String getToMConfirm() {
		return toMConfirm;
	}
	public void setToMConfirm(String toMConfirm) {
		this.toMConfirm = toMConfirm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", fromMemberNo=" + fromMemberNo + ", fromMemberNickname="
				+ fromMemberNickname + ", fromMemberPhoto=" + fromMemberPhoto + ", toMemberNo=" + toMemberNo
				+ ", toMemberNickname=" + toMemberNickname + ", toMemberPhoto=" + toMemberPhoto + ", messageContent="
				+ messageContent + ", messageDate=" + messageDate + ", fromMConfirm=" + fromMConfirm + ", toMConfirm="
				+ toMConfirm + "]";
	}

}
