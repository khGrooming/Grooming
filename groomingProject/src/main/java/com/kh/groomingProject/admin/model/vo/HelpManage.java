package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class HelpManage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8722585840585945648L;

	private String helpNo;			// 문의 번호
	private String helpCName;		// 문의 카테고리
	private String memberNo;		// 문의 회원 번호
	private String helpEmail;		// 문의 이메일
	private String helpContent;		// 문의 내용
	private Timestamp helpCDate;	// 문의 날짜

	public HelpManage() {
		super();
	}
	public HelpManage(String helpNo, String helpCName, String memberNo, String helpEmail, String helpContent,
			Timestamp helpCDate) {
		super();
		this.helpNo = helpNo;
		this.helpCName = helpCName;
		this.memberNo = memberNo;
		this.helpEmail = helpEmail;
		this.helpContent = helpContent;
		this.helpCDate = helpCDate;
	}
	public String getHelpNo() {
		return helpNo;
	}
	public void setHelpNo(String helpNo) {
		this.helpNo = helpNo;
	}
	public String getHelpCName() {
		return helpCName;
	}
	public void setHelpCName(String helpCName) {
		this.helpCName = helpCName;
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
	public Timestamp getHelpCDate() {
		return helpCDate;
	}
	public void setHelpCDate(Timestamp helpCDate) {
		this.helpCDate = helpCDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HelpManage [helpNo=" + helpNo + ", helpCName=" + helpCName + ", memberNo=" + memberNo + ", helpEmail="
				+ helpEmail + ", helpContent=" + helpContent + ", helpCDate=" + helpCDate + "]";
	}

}
