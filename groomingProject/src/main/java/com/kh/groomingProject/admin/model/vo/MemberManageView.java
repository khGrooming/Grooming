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
	private int sanctions;
	private int point;
	private int dCount;
	private int totalCount;
	
	public MemberManageView() {
	}
	
	public MemberManageView(String memberNo, String memberEmail, String memberNickname, String memberName,
			String memberPhone, int sanctions, int point, int dCount, int totalCount) {
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberNickname = memberNickname;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.sanctions = sanctions;
		this.point = point;
		this.dCount = dCount;
		this.totalCount = totalCount;
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
	public int getSanctions() {
		return sanctions;
	}
	public void setSanctions(int sanctions) {
		this.sanctions = sanctions;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getdCount() {
		return dCount;
	}
	public void setdCount(int dCount) {
		this.dCount = dCount;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	@Override
	public String toString() {
		return "MemberManageView [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberNickname="
				+ memberNickname + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", sanctions="
				+ sanctions + ", point=" + point + ", dCount=" + dCount + ", totalCount=" + totalCount + "]";
	}
	
	
}
