package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;

public class MemberAlert implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 724169465091244074L;

	private String memberNo;		// 회원 번호
	private String alertContent;	// 알림 내용

	public MemberAlert() {
		super();
	}
	public MemberAlert(String memberNo, String alertContent) {
		super();
		this.memberNo = memberNo;
		this.alertContent = alertContent;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getAlertContent() {
		return alertContent;
	}
	public void setAlertContent(String alertContent) {
		this.alertContent = alertContent;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MemberAlert [memberNo=" + memberNo + ", alertContent=" + alertContent + "]";
	}

}
