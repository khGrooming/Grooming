package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingMember implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2489347792328216487L;

	private String gmemberNo;			// 그루밍 멤버
	private String memberNo;			// 회원 번호
	private String groomingNo;			// 그루밍 번호
	
	public GroomingMember() {
		super();
	}

	public GroomingMember(String gmemberNo, String memberNo, String groomingNo) {
		super();
		this.gmemberNo = gmemberNo;
		this.memberNo = memberNo;
		this.groomingNo = groomingNo;
	}

	public String getGmemberNo() {
		return gmemberNo;
	}

	public void setGmemberNo(String gmemberNo) {
		this.gmemberNo = gmemberNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getGroomingNo() {
		return groomingNo;
	}

	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GroomingMember [gmemberNo=" + gmemberNo + ", memberNo=" + memberNo + ", groomingNo=" + groomingNo + "]";
	}
	
	
}
