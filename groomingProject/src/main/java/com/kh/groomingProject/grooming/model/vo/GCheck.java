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
	private String memberNickName;
	private String checkLate;
	private int checkY ;
	private int checkL ;
	private int checkN  ;
	private int difDay ;
	
	
	public GCheck() {
		super();
	}

	

	public GCheck(String memberNickName,String checkLate, int checkY, int checkL, int checkN, int difDay) {
		super();
		this.memberNickName = memberNickName;
		this.checkLate = checkLate;
		this.checkY = checkY;
		this.checkL = checkL;
		this.checkN = checkN;
		this.difDay = difDay;
	}



	public GCheck(String gCheckNo, String groomingNo, String gMemberNo, String gCheckStatus, Date gCheckDate) {
		super();
		
		this.gCheckNo = gCheckNo;
		this.groomingNo = groomingNo;
		this.gMemberNo = gMemberNo;
		this.gCheckStatus = gCheckStatus;
		this.gCheckDate = gCheckDate;
	}
	
	public GCheck(String gCheckNo, String groomingNo, String gMemberNo, String gCheckStatus, Date gCheckDate,
			String memberNickName) {
		super();
		this.gCheckNo = gCheckNo;
		this.groomingNo = groomingNo;
		this.gMemberNo = gMemberNo;
		this.gCheckStatus = gCheckStatus;
		this.gCheckDate = gCheckDate;
		this.memberNickName = memberNickName;
	}

	public String getMemberNickName() {
		return memberNickName;
	}

	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
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



	public String getCheckLate() {
		return checkLate;
	}



	public void setCheckLate(String checkLate) {
		this.checkLate = checkLate;
	}



	public int getCheckY() {
		return checkY;
	}



	public void setCheckY(int checkY) {
		this.checkY = checkY;
	}



	public int getCheckL() {
		return checkL;
	}



	public void setCheckL(int checkL) {
		this.checkL = checkL;
	}



	public int getCheckN() {
		return checkN;
	}



	public void setCheckN(int checkN) {
		this.checkN = checkN;
	}



	public int getDifDay() {
		return difDay;
	}



	public void setDifDay(int difDay) {
		this.difDay = difDay;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "GCheck [gCheckNo=" + gCheckNo + ", groomingNo=" + groomingNo + ", gMemberNo=" + gMemberNo
				+ ", gCheckStatus=" + gCheckStatus + ", gCheckDate=" + gCheckDate + ", memberNickName=" + memberNickName
				+ ", checkLate=" + checkLate + ", checkY=" + checkY + ", checkL=" + checkL + ", checkN=" + checkN
				+ ", difDay=" + difDay + "]";
	}



	



	


	
}
