package com.kh.groomingProject.grooming.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GCheck implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -557794419136512729L;
	
	
	private String gCheckNo;
	private String groomingNo;
	private String gMemberNo;
	private String gCheckStatus;
	private Date gCheckDate;

	public GCheck() {
		super();
	}

	public GCheck(String gCheckNo, String groomingNo, String gMemberNo, String gCheckStatus, Date gCheckDate) {
		super();
		this.gCheckNo = gCheckNo;
		this.groomingNo = groomingNo;
		this.gMemberNo = gMemberNo;
		this.gCheckStatus = gCheckStatus;
		this.gCheckDate = gCheckDate;
	}

	public String getgCheckNo() {
		return gCheckNo;
	}

	public void setgCheckNo(String gCheckNo) {
		this.gCheckNo = gCheckNo;
	}

	public String getGroomingNo() {
		return groomingNo;
	}

	public void setGroomingNo(String groomingNo) {
		this.groomingNo = groomingNo;
	}

	public String getgMemberNo() {
		return gMemberNo;
	}

	public void setgMemberNo(String gMemberNo) {
		this.gMemberNo = gMemberNo;
	}

	public String getgCheckStatus() {
		return gCheckStatus;
	}

	public void setgCheckStatus(String gCheckStatus) {
		this.gCheckStatus = gCheckStatus;
	}

	public Date getgCheckDate() {
		return gCheckDate;
	}

	public void setgCheckDate(Date gCheckDate) {
		this.gCheckDate = gCheckDate;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "GCheck [gCheckNo=" + gCheckNo + ", groomingNo=" + groomingNo + ", gMemberNo=" + gMemberNo
				+ ", gCheckStatus=" + gCheckStatus + ", gCheckDate=" + gCheckDate
				+ "]";
	}
	
	
}
