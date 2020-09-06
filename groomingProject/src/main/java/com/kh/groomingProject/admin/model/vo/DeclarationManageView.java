package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;

public class DeclarationManageView implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6043702744732789067L;
	private String declarationNo;
	private String memberNo;
	private String declarationCNo;
	private String declarationNNo;
	private String declarationContent;
	private String declarationCheck;
	
	public DeclarationManageView() {
	}
	
	public DeclarationManageView(String declarationNo, String memberNo, String declarationCNo, String declarationNNo,
			String declarationContent, String declarationCheck) {
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
	
	@Override
	public String toString() {
		return "DeclarationManageView [declarationNo=" + declarationNo + ", memberNo=" + memberNo + ", declarationCNo="
				+ declarationCNo + ", declarationNNo=" + declarationNNo + ", declarationContent=" + declarationContent
				+ ", declarationCheck=" + declarationCheck + "]";
	}
	
	
}
