package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;

public class MemberAlert implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 724169465091244074L;

	private String memberNo;		// 회원 번호
	private String alertContent;	// 알림 내용
	private String memberEmail;		// 멤버 이메일

	public MemberAlert() {
		super();
	}
	public MemberAlert(String alertContent, String memberEmail) {
		super();
		this.alertContent = alertContent;
		this.memberEmail = memberEmail;
	}
	public MemberAlert(String memberNo, String alertContent, String memberEmail) {
		super();
		this.memberNo = memberNo;
		this.alertContent = alertContent;
		this.memberEmail = memberEmail;
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
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MemberAlert [memberNo=" + memberNo + ", alertContent=" + alertContent + ", memberEmail=" + memberEmail
				+ "]";
	}

}
