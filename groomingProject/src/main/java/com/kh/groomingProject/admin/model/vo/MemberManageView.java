package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;

public class MemberManageView implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2217245244835147435L;
	private String memberNo;
	private String memberEmail;
	private String memberNickname;
	private String memberName;
	private String memberPhone;
	private int point;
	
	public MemberManageView() {
	}

	public MemberManageView(String memberNo, String memberEmail, String memberNickname, String memberName,
			String memberPhone, int point) {
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberNickname = memberNickname;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.point = point;
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
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberManageView [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberNickname="
				+ memberNickname + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", point=" + point
				+ "]";
	}
	
}
