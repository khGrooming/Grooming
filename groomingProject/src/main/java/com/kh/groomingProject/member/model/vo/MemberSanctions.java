package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

public class MemberSanctions implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6159240405831701247L;
	private String sanctionsNo;	// 재제 번호
	private String memberNo;	// 재제 대상
	private Timestamp sanctionsSDate;	// 재제 일
	private Timestamp sanctionsFDate;	// 재제 종료일
	private String sanctionsContent;	// 재제 내용
	private String loginSatatus;	// 로그인 상태

	public MemberSanctions() {
		super();
	}
	public MemberSanctions(String sanctionsNo, String memberNo, Timestamp sanctionsSDate, Timestamp sanctionsFDate,
			String sanctionsContent) {
		super();
		this.sanctionsNo = sanctionsNo;
		this.memberNo = memberNo;
		this.sanctionsSDate = sanctionsSDate;
		this.sanctionsFDate = sanctionsFDate;
		this.sanctionsContent = sanctionsContent;
	}
	public MemberSanctions(String sanctionsNo, String memberNo, Timestamp sanctionsSDate, Timestamp sanctionsFDate,
			String sanctionsContent, String loginSatatus) {
		super();
		this.sanctionsNo = sanctionsNo;
		this.memberNo = memberNo;
		this.sanctionsSDate = sanctionsSDate;
		this.sanctionsFDate = sanctionsFDate;
		this.sanctionsContent = sanctionsContent;
		this.loginSatatus = loginSatatus;
	}
	public String getSanctionsNo() {
		return sanctionsNo;
	}
	public void setSanctionsNo(String sanctionsNo) {
		this.sanctionsNo = sanctionsNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public Timestamp getSanctionsSDate() {
		return sanctionsSDate;
	}
	public void setSanctionsSDate(Timestamp sanctionsSDate) {
		this.sanctionsSDate = sanctionsSDate;
	}
	public Timestamp getSanctionsFDate() {
		return sanctionsFDate;
	}
	public void setSanctionsFDate(Timestamp sanctionsFDate) {
		this.sanctionsFDate = sanctionsFDate;
	}
	public String getSanctionsContent() {
		return sanctionsContent;
	}
	public void setSanctionsContent(String sanctionsContent) {
		this.sanctionsContent = sanctionsContent;
	}
	public String getLoginSatatus() {
		return loginSatatus;
	}
	public void setLoginSatatus(String loginSatatus) {
		this.loginSatatus = loginSatatus;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "MemberSanctions [sanctionsNo=" + sanctionsNo + ", memberNo=" + memberNo + ", sanctionsSDate="
				+ sanctionsSDate + ", sanctionsFDate=" + sanctionsFDate + ", sanctionsContent=" + sanctionsContent
				+ ", loginSatatus=" + loginSatatus + "]";
	}

}
