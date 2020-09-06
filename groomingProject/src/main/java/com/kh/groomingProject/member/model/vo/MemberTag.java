package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;

public class MemberTag implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8158359001773369165L;

	private String memberNo;	// 회원번호
	private String memberEmail;	// 회원이메일
	private String tagName;		// 태그명

	public MemberTag() {
		super();
	}
	public MemberTag(String memberNo, String memberEmail, String tagName) {
		super();
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.tagName = tagName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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
		return "MemberTag [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", tagName=" + tagName + "]";
	}

}
