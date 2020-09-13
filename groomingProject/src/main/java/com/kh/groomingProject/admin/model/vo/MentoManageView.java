package com.kh.groomingProject.admin.model.vo;

import java.io.Serializable;

public class MentoManageView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 4840272890390944856L;
	private String memberNo;
	private String memberEmail;
	private String memberNickname;
	private String memberName;
	private String mentorNo;
	private String mentorPass;
	private String specNo;
	private String specName;
	private String specFileName;
	private String specCName;
	private String specComfirm;
	
	public MentoManageView() {
	}
	
	public MentoManageView(String memberNo, String memberEmail, String memberNickname, String memberName,
			String mentorNo, String mentorPass, String specNo, String specName, String specFileName, String specCName,
			String specComfirm) {
		this.memberNo = memberNo;
		this.memberEmail = memberEmail;
		this.memberNickname = memberNickname;
		this.memberName = memberName;
		this.mentorNo = mentorNo;
		this.mentorPass = mentorPass;
		this.specNo = specNo;
		this.specName = specName;
		this.specFileName = specFileName;
		this.specCName = specCName;
		this.specComfirm = specComfirm;
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
	public String getMentorNo() {
		return mentorNo;
	}
	public void setMentorNo(String mentorNo) {
		this.mentorNo = mentorNo;
	}
	public String getMentorPass() {
		return mentorPass;
	}
	public void setMentorPass(String mentorPass) {
		this.mentorPass = mentorPass;
	}
	public String getSpecNo() {
		return specNo;
	}
	public void setSpecNo(String specNo) {
		this.specNo = specNo;
	}
	public String getSpecName() {
		return specName;
	}
	public void setSpecName(String specName) {
		this.specName = specName;
	}
	public String getSpecFileName() {
		return specFileName;
	}
	public void setSpecFileName(String specFileName) {
		this.specFileName = specFileName;
	}
	public String getSpecCName() {
		return specCName;
	}
	public void setSpecCName(String specCName) {
		this.specCName = specCName;
	}
	public String getSpecComfirm() {
		return specComfirm;
	}
	public void setSpecComfirm(String specComfirm) {
		this.specComfirm = specComfirm;
	}
	
	@Override
	public String toString() {
		return "MentoManageView [memberNo=" + memberNo + ", memberEmail=" + memberEmail + ", memberNickname="
				+ memberNickname + ", memberName=" + memberName + ", mentorNo=" + mentorNo + ", mentorPass="
				+ mentorPass + ", specNo=" + specNo + ", specName=" + specName + ", specFileName=" + specFileName
				+ ", specCName=" + specCName + ", specComfirm=" + specComfirm + "]";
	}
	
	
}
