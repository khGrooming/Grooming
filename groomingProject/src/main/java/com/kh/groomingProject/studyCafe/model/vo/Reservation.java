package com.kh.groomingProject.studyCafe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 419661200620588506L;

	private String cReserNo;
	private String memberNo;
	private String cPriceNo;
	private int cReserHeadCount;
	private String cReserDate;
	private String cReserSTime;
	private String cReserETime;

	public Reservation() {
	}

	public Reservation(String cReserNo, String memberNo, String cPriceNo, int cReserHeadCount, String cReserDate,
			String cReserSTime, String cReserETime) {
		this.cReserNo = cReserNo;
		this.memberNo = memberNo;
		this.cPriceNo = cPriceNo;
		this.cReserHeadCount = cReserHeadCount;
		this.cReserDate = cReserDate;
		this.cReserSTime = cReserSTime;
		this.cReserETime = cReserETime;
	}

	public String getcReserNo() {
		return cReserNo;
	}
	public void setcReserNo(String cReserNo) {
		this.cReserNo = cReserNo;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getcPriceNo() {
		return cPriceNo;
	}
	public void setcPriceNo(String cPriceNo) {
		this.cPriceNo = cPriceNo;
	}
	public int getcReserHeadCount() {
		return cReserHeadCount;
	}
	public void setcReserHeadCount(int cReserHeadCount) {
		this.cReserHeadCount = cReserHeadCount;
	}
	public String getcReserDate() {
		return cReserDate;
	}
	public void setcReserDate(String cReserDate) {
		this.cReserDate = cReserDate;
	}
	public String getcReserSTime() {
		return cReserSTime;
	}
	public void setcReserSTime(String cReserSTime) {
		this.cReserSTime = cReserSTime;
	}
	public String getcReserETime() {
		return cReserETime;
	}
	public void setcReserETime(String cReserETime) {
		this.cReserETime = cReserETime;
	}


	@Override
	public String toString() {
		return "Reservation [cReserNo=" + cReserNo + ", memberNo=" + memberNo + ", cPriceNo=" + cPriceNo
				+ ", cReserHeadCount=" + cReserHeadCount + ", cReserDate=" + cReserDate + ", cReserSTime=" + cReserSTime
				+ ", cReserETime=" + cReserETime + "]";
	}
	
}
