package com.kh.groomingProject.alert.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

public class Alert implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5614251653763257702L;
	
	private String alertNo;				// 알림 번호
	private String memberNo;			// 멤버 번호
	private String alertContent;		// 알림 내용
	private Timestamp alertCreateDate;	// 알림 생성날짜
	private String alertConfirm;		// 알림 확인 유무

	public Alert() {
		super();
	}
	public Alert(String alertNo, String memberNo, String alertContent, Timestamp alertCreateDate, String alertConfirm) {
		super();
		this.alertNo = alertNo;
		this.memberNo = memberNo;
		this.alertContent = alertContent;
		this.alertCreateDate = alertCreateDate;
		this.alertConfirm = alertConfirm;
	}
	public String getAlertNo() {
		return alertNo;
	}
	public void setAlertNo(String alertNo) {
		this.alertNo = alertNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getAlertContent() {
		return alertContent;
	}
	public void setAlertContent(String alertContent) {
		this.alertContent = alertContent;
	}
	public Timestamp getAlertCreateDate() {
		return alertCreateDate;
	}
	public void setAlertCreateDate(Timestamp alertCreateDate) {
		this.alertCreateDate = alertCreateDate;
	}
	public String getAlertConfirm() {
		return alertConfirm;
	}
	public void setAlertConfirm(String alertConfirm) {
		this.alertConfirm = alertConfirm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Alert [alertNo=" + alertNo + ", memberNo=" + memberNo + ", alertContent=" + alertContent
				+ ", alertCreateDate=" + alertCreateDate + ", alertConfirm=" + alertConfirm + "]";
	}

}
