package com.kh.groomingProject.mypage.model.vo;

import java.io.Serializable;

public class MemberReport implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6722083359165628497L;
	private String declarationNo;
	private String memberNo;
	private String declarationCNo;
	private String declarationNNo;
	private String declarationContent;
	private String declarationCheck;
	public MemberReport() {
		super();
	}
	public MemberReport(String declarationNo, String memberNo, String declarationCNo, String declarationNNo,
			String declarationContent, String declarationCheck) {
		super();
		this.declarationNo = declarationNo;
		this.memberNo = memberNo;
		this.declarationCNo = declarationCNo;
		this.declarationNNo = declarationNNo;
		this.declarationContent = declarationContent;
		this.declarationCheck = declarationCheck;
	}
	public String getDeclarationNo() {
		return declarationNo;
	}
	public void setDeclarationNo(String declarationNo) {
		this.declarationNo = declarationNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getDeclarationCNo() {
		return declarationCNo;
	}
	public void setDeclarationCNo(String declarationCNo) {
		this.declarationCNo = declarationCNo;
	}
	public String getDeclarationNNo() {
		return declarationNNo;
	}
	public void setDeclarationNNo(String declarationNNo) {
		this.declarationNNo = declarationNNo;
	}
	public String getDeclarationContent() {
		return declarationContent;
	}
	public void setDeclarationContent(String declarationContent) {
		this.declarationContent = declarationContent;
	}
	public String getDeclarationCheck() {
		return declarationCheck;
	}
	public void setDeclarationCheck(String declarationCheck) {
		this.declarationCheck = declarationCheck;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MemberReport [declarationNo=" + declarationNo + ", memberNo=" + memberNo + ", declarationCNo="
				+ declarationCNo + ", declarationNNo=" + declarationNNo + ", declarationContent=" + declarationContent
				+ ", declarationCheck=" + declarationCheck + "]";
	}
	
	 
	
}
