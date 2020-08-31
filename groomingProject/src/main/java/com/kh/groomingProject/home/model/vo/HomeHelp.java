package com.kh.groomingProject.home.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class HomeHelp implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8277771618775405830L;

	private String helpNo;			// 문의 번호
	private String hCategoryNo;		// 문의 카테고리 번호
	private String memberNo;		// 문의 회원 번호
	private String helpEmail;		// 문의 이메일
	private String helpContent;		// 문의 내용
	private Timestamp hCdate;		// 문의 등록일

	public HomeHelp() {
		super();
	}
	public HomeHelp(String helpNo, String hCategoryNo, String memberNo, String helpEmail, String helpContent,
			Timestamp hCdate) {
		super();
		this.helpNo = helpNo;
		this.hCategoryNo = hCategoryNo;
		this.memberNo = memberNo;
		this.helpEmail = helpEmail;
		this.helpContent = helpContent;
		this.hCdate = hCdate;
	}
	public String getHelpNo() {
		return helpNo;
	}
	public void setHelpNo(String helpNo) {
		this.helpNo = helpNo;
	}
	public String gethCategoryNo() {
		return hCategoryNo;
	}
	public void sethCategoryNo(String hCategoryNo) {
		this.hCategoryNo = hCategoryNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getHelpEmail() {
		return helpEmail;
	}
	public void setHelpEmail(String helpEmail) {
		this.helpEmail = helpEmail;
	}
	public String getHelpContent() {
		return helpContent;
	}
	public void setHelpContent(String helpContent) {
		this.helpContent = helpContent;
	}
	public Timestamp gethCdate() {
		return hCdate;
	}
	public void sethCdate(Timestamp hCdate) {
		this.hCdate = hCdate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HomeHelp [helpNo=" + helpNo + ", hCategoryNo=" + hCategoryNo + ", memberNo=" + memberNo + ", helpEmail="
				+ helpEmail + ", helpContent=" + helpContent + ", hCdate=" + hCdate + "]";
	}

}
