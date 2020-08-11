package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;

public class MemberTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8158359001773369165L;
	
	private String memberEmail;	// 회원 이메일
	private String tagName;		// 태그명
	public MemberTag() {
		super();
	}
	public MemberTag(String memberEmail, String tagName) {
		super();
		this.memberEmail = memberEmail;
		this.tagName = tagName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MemberTag [memberEmail=" + memberEmail + ", tagName=" + tagName + "]";
	}

}
