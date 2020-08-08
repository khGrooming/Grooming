package com.kh.groomingProject.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Alert implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5614251653763257702L;
	
	private String alertNo;			// �˸� ��ȣ
	private String memberNo;		// ��� ��ȣ
	private String alertContent;	// �˸� ����
	private Date alertCreateDate;	// �˸� ������¥
	private String alertConfirm;	// �˸� Ȯ�� ����

	public Alert() {
		super();
	}
	public Alert(String alertNo, String memberNo, String alertContent, Date alertCreateDate, String alertConfirm) {
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
	public Date getAlertCreateDate() {
		return alertCreateDate;
	}
	public void setAlertCreateDate(Date alertCreateDate) {
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
