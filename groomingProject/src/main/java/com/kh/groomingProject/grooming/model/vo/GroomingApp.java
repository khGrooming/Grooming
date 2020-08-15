package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class GroomingApp implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2770345528548331431L;

	
	private String groomingANo;	// 그루밍 신청자 번호
	private String groomingNo;	// 그루밍 번호
	private String memberNo;	// 로그인 회원 번호
	private String groomingAC;	// 신청 내용
	private String groomingAS;	// 신청 상태
	
	
	
	public GroomingApp() {
		super();
	}



	public GroomingApp(String groomingANo, String groomingNo, String memberNo, String groomingAC, String groomingAS) {
		super();
		this.groomingANo = groomingANo;
		this.groomingNo = groomingNo;
		this.memberNo = memberNo;
		this.groomingAC = groomingAC;
		this.groomingAS = groomingAS;
	}



	public String getGroomingANo() {
		return groomingANo;
	}



	public void setGroomingANo(String groomingANo) {
		this.groomingANo = groomingANo;
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



	public String getGroomingAC() {
		return groomingAC;
	}



	public void setGroomingAC(String groomingAC) {
		this.groomingAC = groomingAC;
	}



	public String getGroomingAS() {
		return groomingAS;
	}



	public void setGroomingAS(String groomingAS) {
		this.groomingAS = groomingAS;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "GroomingApp [groomingANo=" + groomingANo + ", groomingNo=" + groomingNo + ", memberNo=" + memberNo
				+ ", groomingAC=" + groomingAC + ", groomingAS=" + groomingAS + "]";
	}
 	
	
	
}
