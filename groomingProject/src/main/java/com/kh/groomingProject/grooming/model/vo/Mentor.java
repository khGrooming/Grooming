package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;

public class Mentor implements Serializable{

	private String mentorNo;		// 멘토번호
	private String memberNo;		// 멤버 번호
	private String pass;			// 합격 여부
	
	public Mentor() {
		super();
	}
	
	public Mentor(String mentorNo, String memberNo, String pass) {
		super();
		this.mentorNo = mentorNo;
		this.memberNo = memberNo;
		this.pass = pass;
	}

	public String getMentorNo() {
		return mentorNo;
	}

	public void setMentorNo(String mentorNo) {
		this.mentorNo = mentorNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "Mentor [mentorNo=" + mentorNo + ", memberNo=" + memberNo + ", pass=" + pass + "]";
	}
	
	
	
	
}
