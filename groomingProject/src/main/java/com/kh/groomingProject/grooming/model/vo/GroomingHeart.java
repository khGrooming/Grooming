package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingHeart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8262020308297061831L;
	
	private String groomingHNo;	// 찜번호
	private String groomingNo;	// 그루밍번호
	private String memberNo;	// 회원번호
	
	public GroomingHeart() {
		super();
	}
	public GroomingHeart(String groomingHNo, String groomingNo, String memberNo) {
		super();
		this.groomingHNo = groomingHNo;
		this.groomingNo = groomingNo;
		this.memberNo = memberNo;
	}
	
	public String getGroomingHNo() {
		return groomingHNo;
	}
	
	public void setGroomingHNo(String groomingHNo) {
		this.groomingHNo = groomingHNo;
	}
	
	public String getGroomingNo() {
		return groomingNo;
	}
	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}
	
	public String getMemberNo() {
		return memberNo;
	}
	
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "GroomingHeart [groomingHNo=" + groomingHNo + ", groomingNo=" + groomingNo + ", memberNo=" + memberNo
				+ "]";
	}
	
}
