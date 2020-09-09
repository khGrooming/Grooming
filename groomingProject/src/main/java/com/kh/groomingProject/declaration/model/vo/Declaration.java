package com.kh.groomingProject.declaration.model.vo;

public class Declaration {

	private String dNo; // 신고 번호
	private String memberNo; // 회원 번호
	private String dCategoryNo; // 신고 카테고리 번호
	private String dnNo; // 신고 글 번호
	private String dContent; // 신고 내용
	private String dCheck; // 제재 상태

	public Declaration() {
		super();
	}

	public Declaration(String dNo, String memberNo, String dCategoryNo, String dnNo, String dContent, String dCheck) {
		super();
		this.dNo = dNo;
		this.memberNo = memberNo;
		this.dCategoryNo = dCategoryNo;
		this.dnNo = dnNo;
		this.dContent = dContent;
		this.dCheck = dCheck;
	}

	public String getdNo() {
		return dNo;
	}

	public void setdNo(String dNo) {
		this.dNo = dNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getdCategoryNo() {
		return dCategoryNo;
	}

	public void setdCategoryNo(String dCategoryNo) {
		this.dCategoryNo = dCategoryNo;
	}

	public String getDnNo() {
		return dnNo;
	}

	public void setDnNo(String dnNo) {
		this.dnNo = dnNo;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	public String getdCheck() {
		return dCheck;
	}

	public void setdCheck(String dCheck) {
		this.dCheck = dCheck;
	}

	@Override
	public String toString() {
		return "Declaration [dNo=" + dNo + ", memberNo=" + memberNo + ", dCategoryNo=" + dCategoryNo + ", dnNo=" + dnNo
				+ ", dContent=" + dContent + ", dCheck=" + dCheck + "]";
	}

}
