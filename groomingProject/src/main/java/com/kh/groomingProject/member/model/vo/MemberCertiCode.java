package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;

public class MemberCertiCode implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5938971714739501893L;

	private String memberEmail; // 회원 이메일
	private String certiNumber;	// 인증 코드
	private int expireTime;		// 만료 시간

	public MemberCertiCode() {
		super();
	}
	public MemberCertiCode(String memberEmail, String certiNumber, int expireTime) {
		super();
		this.memberEmail = memberEmail;
		this.certiNumber = certiNumber;
		this.expireTime = expireTime;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getCertiNumber() {
		return certiNumber;
	}
	public void setCertiNumber(String certiNumber) {
		this.certiNumber = certiNumber;
	}
	public int getExpireTime() {
		return expireTime;
	}
	public void setExpireTime(int expireTime) {
		this.expireTime = expireTime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MemberCertiCode [memberEmail=" + memberEmail + ", certiNumber=" + certiNumber + ", expireTime="
				+ expireTime + "]";
	}

}
